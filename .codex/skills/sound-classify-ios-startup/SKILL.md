---
name: sound-classify-ios-startup
description: sound_classify_app を iOS 実機で起動するための支援。iOS/Xcode/Flutter 互換性の確認、JITクラッシュ対策、3.41.1 失敗時のフォールバックを含む。
---

# sound-classify-ios-startup

このスキルは、`sound_classify_app` を iOS で起動・デバッグする支援用です。**iOSシミュレータでは動かない**ので、常に実機で案内してください。

## 言語

- 返信は日本語を基本にする
- 短い文＋箇条書きでわかりやすく

## 基本フロー（実機のみ）

1) **実機の確認**
   - シミュレータと書かれていたら、実機必須だと伝える（音声/センサー/AR制約のため）。

2) **環境の確認**
   - Flutter バージョン、Flutter の導入方法（FVM or グローバル）。
   - Developer Mode と「このコンピュータを信頼」の確認。

3) **FVM前提（必須）**
   - このリポジトリは FVM 前提で、`fvm_config.json` が `3.41.1` を指定。
   - まず `direnv allow` を実行してもらう。
   - `flutter --version` が `3.41.1` か確認。違えば `fvm use 3.41.1`。
   - 未インストールなら `fvm install 3.41.1`。

4) **Flutter 3.41.1+ を推奨**
   - iOS/Xcode が新しい場合、古い Flutter の debug で JIT 失敗が起きやすい。
   - `flutter --version` が 3.41.1 未満ならアップグレードを促す。

5) **クリーンセットアップ**
   - `flutter clean`
   - `flutter pub get`
   - `cd ios && pod install && cd ..`

6) **実機起動**
   - `flutter run -d <device-id>`

## 初回メッセージの締め

- 確認事項と進め方を提示したあと、最後に必ず「上記で進めていいですか？（YES / NO）」を入れる。
- YES の場合は、以降の手順を **AI側で順に実行** する。
- NO の場合は、懸念点の解消を優先する。

## よくある失敗と対処

### JIT クラッシュ（実機 / debug）
症状:
- `mprotect failed` または `Unable to flip between RX and RW memory protection`
- 実機の **debug** でのみ起きる

対処:
- Developer Mode が ON か確認。
- それでも失敗する場合:
  - まず Flutter を 3.41.1+ に更新。
  - まだ落ちるなら `--profile` / `--release` で JIT 起因か切り分け:
    - `flutter run --profile -d <device-id>`
    - `flutter run --release -d <device-id>`

### LaunchServicesDataMismatch（アプリが起動しない）
症状:
- `LaunchServices GUID and sequence number do not match expected values`

対処:
- 端末からアプリ削除。
- 再ビルド:
  - `flutter clean`
  - `rm -rf ios/Pods ios/Podfile.lock`
  - `flutter pub get`
  - `cd ios && pod install && cd ..`
  - `flutter run -d <device-id>`
- それでも失敗なら端末再起動。

## Flutterインストール方針（FVM優先）

- リポジトリは `3.41.1` 固定なので、**FVMを常に優先**。
- `fvm install` が遅い場合は、初回だけ時間がかかることを伝えて待ってもらう。

## 判断指針

- 必ず実機での確認を促す。
- iOS/Xcode が新しいなら 3.41.1+ を前提にする。
- 3.41.1 でも失敗する場合は、iOS/Xcode の版数とログを確認し、profile/releaseで切り分けを案内する。
- iOS/Xcode の版数確認は **最初ではなく失敗時にだけ**行う。
- 推奨は iOS 26 以降、Xcode 26 以降。
