import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vet_digital/src/modules/home/data/model/about_app.dart';
import 'package:vet_digital/src/modules/home/data/model/katalog_model.dart';

abstract class FireStore {
  Future<AboutAppModel> getAboutApp({required String documentName});
  Future<List<KatalogModel>> getKatalog({required String collectionName});
}

class FireStoreImpl implements FireStore {
  FireStoreImpl({required this.firestoreDB});
  final FirebaseFirestore firestoreDB;

  @override
  Future<AboutAppModel> getAboutApp({
    required String documentName,
  }) async {
    final DocumentSnapshot aboutApp =
        await firestoreDB.collection('biz').doc(documentName).get();
    if (aboutApp.exists) {
      final aboutAppMap = aboutApp.data() as Map<String, dynamic>?;
      final aboutAppObject = AboutAppModel.fromJson(aboutAppMap!);
      return aboutAppObject;
    } else {
      return AboutAppModel();
    }
  }

  @override
  Future<List<KatalogModel>> getKatalog({
    required String collectionName,
  }) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestoreDB.collection(collectionName).get();
    List<KatalogModel> katalogData = <KatalogModel>[];
    for (final doc in querySnapshot.docs) {
      KatalogModel katalogModel = KatalogModel.fromJson(doc.data());
      katalogData.add(katalogModel);
    }
    return katalogData;
  }
}
