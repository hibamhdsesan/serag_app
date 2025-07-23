import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serag_app/model/thekr.dart';
import 'package:serag_app/service/publicThekr.dart';

part 'public_thekr_event.dart';
part 'public_thekr_state.dart';

class PublicThekrBloc extends Bloc<PublicThekrEvent, PublicThekrState> {
  final ThekrService thekrService;
  PublicThekrBloc(this.thekrService) : super(PublicThekrInitial()) {
    on<FetchthekrEvent>((event, emit) async {
      emit(PublicThekrLoading());
      try {
        final thekrList = await thekrService.fetchThekrList();
        emit(publicThekrLoaded(thekrList));
      } catch (e) {
        emit(publicThekrError(" لا يمكن تحميل البيانات"));
      }
    });
  }
}
