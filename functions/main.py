from firebase_functions import firestore_fn, https_fn, storage_fn, options
from firebase_admin import initialize_app, storage, firestore
import os
import pathlib
import librosa
import numpy as np
import soundfile as sf
import ffmpeg
import google.cloud.firestore
from firebase_admin import initialize_app, storage, credentials

cred = credentials.ApplicationDefault()
initialize_app(cred, {
    'storageBucket': 'cocomakers-sound-classify-app.appspot.com'  # バケット名を指定します
})

@storage_fn.on_object_finalized(bucket="cocomakers-sound-classify-app.appspot.com", region='asia-northeast1',  memory=options.MemoryOption.GB_1) # timeout_sec=300
def process_audio(event: storage_fn.CloudEvent[storage_fn.StorageObjectData]):
    bucket_name = event.data.bucket
    file_path = pathlib.PurePath(event.data.name)
    content_type = event.data.content_type
    print(f"bucket_name: {bucket_name}")
    print(f"file_path: {file_path}")
    print(f"content_type: {content_type}")
    
    
    if file_path.name.startswith("edited_audio_files"): # すでに編集済みのファイルはスキップ(無限ループの防止)
        print("Already edited.")
        return
    
    if not content_type or not content_type.startswith("audio/x-m4a"):
        print(f"Unsupported content type: {content_type}")
        return


    bucket = storage.bucket(bucket_name)
    
    # Convert m4a to mp3
    input_blob = bucket.blob(str(file_path))
    input_path = f"/tmp/{file_path.name}"
    input_blob.download_to_filename(input_path)
    print(f"input_path: {input_path}")
    
    path = input_path  # 例：tmp/久江ホ.m4a
    print(f"Converting {path} to mp3")
    to = "mp3"
    s = ffmpeg.input(path)

    # ファイル名と拡張子を分離して、新しい拡張子を付け加える
    base, ext = os.path.splitext(path)
    mp3_path = f"{base}.{to}"

    s = ffmpeg.output(s, mp3_path)
    try:
        ffmpeg.run(s)
    except ffmpeg.Error as e:
        print(f"Error converting m4a to mp3: {e}")
        return

    print(f"mp3file saved to: {mp3_path}")

    # Audio processing
    try:
        y, sr = librosa.load(mp3_path, sr=48000)
    except Exception as e:
        print(f"Error loading mp3 file with librosa: {e}")
        return
    
    D = librosa.stft(y)
    D_magnitude, D_phase = librosa.magphase(D)
    D_magnitude_db = librosa.amplitude_to_db(D_magnitude, ref=np.max)

    # Amplify specific frequency band
    target_low = 2000
    target_high = 4000
    amplification_factor = 2.5
    freqs = librosa.fft_frequencies(sr=sr)
    target_freqs_mask = (freqs >= target_low) & (freqs <= target_high)
    D_magnitude_db[target_freqs_mask, :] += amplification_factor

    D_amplified = librosa.db_to_amplitude(D_magnitude_db) * D_phase
    y_amplified = librosa.istft(D_amplified)
    
    print(f"y_amplified:{y_amplified}")
    print(f"file_path:{file_path}")
    print(f"file_path.stem:{file_path.stem}")

    # Save the edited file
    output_filename = f"edited_{file_path.stem}.wav"
    output_path = f"/tmp/{output_filename}"
    sf.write(output_path, y_amplified, sr)
    
    # wav形式の音声ファイルをm4a形式に変換
    path = output_path  # 例：tmp/久江ホ.m4a
    print(f"Converting {path} to m4a")
    to = "m4a"
    s = ffmpeg.input(path)
    
    # ファイル名と拡張子を分離して、新しい拡張子を付け加える
    base, ext = os.path.splitext(path)
    output_m4a_path = f"{base}.{to}"
    
    s = ffmpeg.output(s, output_m4a_path)
    try:
        ffmpeg.run(s)
    except ffmpeg.Error as e:
        print(f"Error converting wav to m4a: {e}")
        return
    print(f"wavfile saved to: {output_m4a_path}") # 例：tmp/久江ホ.m4a
    output_m4a_filename = os.path.basename(output_m4a_path)
    print(f"output_m4a_filename: {output_m4a_filename}")

    # Upload the processed file to Cloud Storage
    output_blob = bucket.blob(f"edited_audio_files/{output_m4a_filename}")
    output_blob.upload_from_filename(output_m4a_path)

    # Clean up temporary files
    os.remove(input_path)
    os.remove(mp3_path)
    os.remove(output_path)
    os.remove(output_m4a_path)

    print(f"Processed file uploaded to edited_audio_files/{output_m4a_filename}")