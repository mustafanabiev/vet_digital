import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vet_digital/src/modules/home/data/model/about_app.dart';
import 'package:vet_digital/src/modules/home/data/model/katalog_model.dart';
import 'package:vet_digital/src/modules/home/data/repositories/info_repo.dart';

part 'info_about_app_state.dart';

class InfoAboutAppCubit extends Cubit<InfoAboutAppState> {
  InfoAboutAppCubit({
    required this.infoRepo,
  }) : super(LoadingInfoAboutAppState());
  final InfoRepo infoRepo;

  Future<void> getAboutApp(String documentName) async {
    emit(LoadingInfoAboutAppState());

    final infoAboutApp = await infoRepo.getAboutApp(documentName: documentName);

    infoAboutApp.fold(
      (error) => emit(const UserFailureState('')),
      (infoAboutApp) => emit(LoadedAboutAppState(infoAboutApp)),
    );
  }

  Future<void> getKatalog(String collectionName) async {
    emit(LoadingInfoAboutAppState());

    final infoKatalog = await infoRepo.getKatalog(collectionName: collectionName);

    infoKatalog.fold(
      (error) => emit(const UserFailureState('')),
      (infoAboutApp) => emit(LoadedKatalogState(infoAboutApp)),
    );
  }
}
