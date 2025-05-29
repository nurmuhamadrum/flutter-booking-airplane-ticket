import 'package:flutter_bloc/flutter_bloc.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void selectSeat(String id) {
    if (!isSelectSeat(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }
    // make new instance
    emit(List.from(state));
  }

  bool isSelectSeat(String id) {
    int index = state.indexOf(id);
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }
}
