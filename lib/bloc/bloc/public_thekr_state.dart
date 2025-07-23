part of 'public_thekr_bloc.dart';

@immutable
sealed class PublicThekrState {}

final class PublicThekrInitial extends PublicThekrState {}

final class PublicThekrLoading extends PublicThekrState {}

final class publicThekrLoaded extends PublicThekrState {
  List<ThekrModel> thekrList = [];
  publicThekrLoaded(this.thekrList);
}

final class publicThekrError extends PublicThekrState {
  final String message;
  publicThekrError(this.message);
}
