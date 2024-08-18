import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cubit_h_state.dart';

class CubitHCubit extends Cubit<CubitHState> {
  CubitHCubit()
      : super(const CubitHState(
          isSelected: false,
          selectedList: [],
          currItem: 0,
          isHovering: false,
        ));

  void isSelectedAll(bool isSelected) {
    List<int> selectedList = List.from(state.selectedList);

    if (isSelected == true) {
      selectedList = List.generate(10, (index) => index);
    } else {
      selectedList.clear();
    }
    emit(state.copyWith(isSelected: isSelected, selectedList: selectedList));
  }

  void toggleItem(int index) {
    List<int> selectedList = List.from(state.selectedList);

    if (selectedList.contains(index)) {
      selectedList.remove(index);
    } else {
      selectedList.add(index);
    }

    emit(state.copyWith(selectedList: selectedList));
  }

  void onHover(bool value, int index) {
    emit(state.copyWith(currItem: index, isHovering: value));
  }
}
