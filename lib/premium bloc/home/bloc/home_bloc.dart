import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeSelectAllEvent>(_selectAll);
    on<HomeSelectSingleEvent>(_selectSingleItem);
  }

  void _selectAll(HomeSelectAllEvent event, Emitter<HomeState> emit) {
    final isSelected = !state.isSelectedAll;
    List<int> selectedList = [];

    if (isSelected) {
      selectedList = List.generate(event.itemCount, (index) => index);
    } else {
      selectedList.clear();
    }

    emit(state.copyWith(isSelectedAll: isSelected, selectedList: selectedList));
  }

  void _selectSingleItem(HomeSelectSingleEvent event, Emitter<HomeState> emit) {
    List<int> selectedList = state.selectedList;

    if (!selectedList.contains(event.selectedItem)) {
      selectedList.add(event.selectedItem);
    } else {
      selectedList.remove(event.selectedItem);
    }

    emit(state.copyWith(
        isSelectedAll: selectedList.length == event.itemCount,
        selectedList: selectedList));
  }
}
