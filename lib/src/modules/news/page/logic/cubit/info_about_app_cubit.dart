import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vet_digital/src/modules/home/data/model/about_app.dart';
import 'package:vet_digital/src/modules/home/data/model/katalog_model.dart';
import 'package:vet_digital/src/modules/home/data/repositories/info_repo.dart';

part 'info_about_app_state.dart';

class InfoAboutAppCubit extends Cubit<InfoAboutAppState> {
  InfoAboutAppCubit({
    required this.infoRepo,
  }) : super(LoadingState());
  final InfoRepo infoRepo;

  Future<void> getKatalog(String collectionName) async {
    emit(LoadingState());

    final infoKatalog =
        await infoRepo.getKatalog(collectionName: collectionName);

    infoKatalog.fold(
      (error) => emit(const UserFailureState('')),
      (infoAboutApp) => emit(LoadedKatalogState(infoAboutApp)),
    );
  }
}
