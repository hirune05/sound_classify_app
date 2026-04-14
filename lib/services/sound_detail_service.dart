import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sound_classify_app/models/detail.dart';

class SoundDetailService {
  final shopRef = FirebaseFirestore.instance.collection('shops');
  final placeRef = FirebaseFirestore.instance.collection('places');

  Future<void> setSoundDetail(Detail soundDetail) async {
    final documentRef = shopRef.doc();
    final lat = soundDetail.lat;
    final long = soundDetail.long;
    await documentRef.set({
      'lat': lat,
      'long': long,
      'sounds': soundDetail.sounds,
    });

    if (lat != null && long != null) {
      await placeRef.add({
        'lat': lat,
        'long': long,
      });
    }
  }
}
