import 'package:dartz/dartz.dart';
import 'package:vet_digital/src/core/error/exception.dart';
import 'package:vet_digital/src/core/error/failure.dart';
import 'package:vet_digital/src/modules/home/data/model/about_app.dart';
import 'package:vet_digital/src/modules/home/data/model/katalog_model.dart';
import 'package:vet_digital/src/modules/home/data/service/firestore.dart';

abstract class InfoRepo {
  Future<Either<Failure, AboutAppModel>> getAboutApp({
    required String documentName,
  });
  Future<Either<Failure, List<KatalogModel>>> getKatalog({
    required String collectionName,
  });
}

class InfoRepoImpl implements InfoRepo {
  InfoRepoImpl({required this.firestore});
  final FireStore firestore;

  @override
  Future<Either<Failure, AboutAppModel>> getAboutApp({
    required String documentName,
  }) async {
    try {
      final aboutAppModel = await firestore.getAboutApp(
        documentName: documentName,
      );

      return Right(aboutAppModel);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<KatalogModel>>> getKatalog({
    required String collectionName,
  }) async {
    try {
      final katalogModel = await firestore.getKatalog(
        collectionName: collectionName,
      );

      return Right(katalogModel);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
