part of 'info_about_app_cubit.dart';

abstract class InfoAboutAppState extends Equatable {
  const InfoAboutAppState();

  @override
  List<Object> get props => [];
}

class LoadingState extends InfoAboutAppState {}

class LoadedKatalogState extends InfoAboutAppState {
  const LoadedKatalogState(this.items);
  final List<KatalogModel>? items;

  @override
  List<Object> get props => [items!];
}

class UserFailureState extends InfoAboutAppState {
  const UserFailureState(this.message);
  final String? message;

  @override
  List<Object> get props => [message!];
}
