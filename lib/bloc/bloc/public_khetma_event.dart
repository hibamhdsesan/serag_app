part of 'public_khetma_bloc.dart';

@immutable
sealed class PublicKhetmaEvent {}

class FetchKhetmaEvent extends PublicKhetmaEvent {}

class AddKhetmaEvent extends PublicKhetmaEvent {
  final PublicKhetmaModel khetma;
  AddKhetmaEvent(this.khetma);
}
