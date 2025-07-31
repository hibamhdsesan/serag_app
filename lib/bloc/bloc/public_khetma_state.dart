part of 'public_khetma_bloc.dart';

@immutable
sealed class PublicKhetmaState {}

final class PublicKhetmaInitial extends PublicKhetmaState {}

final class PublicKhetmaLoading extends PublicKhetmaState {}

final class PublicKhetmaLoaded extends PublicKhetmaState {
  final List<PublicKhetmaModel> khetmaList;
  PublicKhetmaLoaded(this.khetmaList);
}

final class PublicKhetmaAdded extends PublicKhetmaState {}

final class PublicKhetmaError extends PublicKhetmaState {
  final String message;
  PublicKhetmaError(this.message);
}
