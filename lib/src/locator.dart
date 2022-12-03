import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:vet_digital/src/modules/home/data/service/firestore.dart';
import 'package:vet_digital/src/modules/information/page/logic/cubit/info_about_app_cubit.dart';

import 'modules/home/data/repositories/info_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    // repo
    ..registerLazySingleton<InfoRepo>(
      () => InfoRepoImpl(
        firestore: sl<FireStore>(),
      ),
    )

    // cubit
    ..registerLazySingleton(
      () => InfoAboutAppCubit(
        infoRepo: sl<InfoRepo>(),
      ),
    )

    // service
    ..registerLazySingleton<FireStore>(
      () => FireStoreImpl(
        firestoreDB: sl(),
      ),
    );

  // extarnal
  final firebase = await Firebase.initializeApp();
  sl.registerLazySingleton(() => firebase);

  final firestoreDB = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firestoreDB);
}
