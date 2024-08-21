import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sound_classify_app/models/detail.dart';

class SoundDetailService {
  final shopRef = FirebaseFirestore.instance.collection('shops');

  Future<void> setSoundDetail(Detail soundDetail) async {
    final documentRef = shopRef.doc();
    await documentRef.set({
      'lat': soundDetail.lat,
      'long': soundDetail.long,
      'sounds': soundDetail.sounds,
    });
  }
}
