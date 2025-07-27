part of 'public_thekr_bloc.dart';

@immutable
sealed class PublicThekrEvent {}
class FetchthekrEvent extends PublicThekrEvent{}
class AddThekrEvent extends PublicThekrEvent {
  final ThekrModel thekr;
  AddThekrEvent(this.thekr);
}

