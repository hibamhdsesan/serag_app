import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serag_app/model/publicKhtma.dart';
import 'package:serag_app/service/publicKhtma.dart';

part 'public_khetma_event.dart';
part 'public_khetma_state.dart';

class PublicKhetmaBloc extends Bloc<PublicKhetmaEvent, PublicKhetmaState> {
  final PublicKhetmaService service;

  PublicKhetmaBloc(this.service) : super(PublicKhetmaInitial()) {
    on<FetchKhetmaEvent>((event, emit) async {
      print("FetchKhetmaEvent triggered");
      emit(PublicKhetmaLoading());
      try {
        final list = await service.fetchKhetmaList();
        print("Fetched ${list.length} khetmas");
        emit(PublicKhetmaLoaded(list));
      } catch (e, stacktrace) {
        print("Error fetching khetmas: $e");
        print(stacktrace);
        emit(PublicKhetmaError("حدث خطأ أثناء تحميل الختمات"));
      }
    });

    on<AddKhetmaEvent>((event, emit) async {
      print("AddKhetmaEvent triggered with khetma: ${event.khetma}");
      emit(PublicKhetmaLoading());
      try {
        await service.addKhetma(event.khetma);
        print("Khetma added successfully");
        final updatedList = await service.fetchKhetmaList();
        print("Fetched updated list with ${updatedList.length} khetmas");
        emit(PublicKhetmaAdded());
        emit(PublicKhetmaLoaded(updatedList));
      } catch (e, stacktrace) {
        print("Error adding khetma: $e");
        print(stacktrace);
        emit(PublicKhetmaError("فشل في إضافة الختمة"));
      }
    });
  }
}
