import 'dart:developer';
import '../../../model/model.dart';
import 'package:bloc/bloc.dart';
import '../../../json/my_json.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(const HomeState(
          items: [],
          searchItem: [],
          tableData: [],
          show: false,
          selectedItem: null,
        ));

  void fetchItems() {
    final itemsList = List.from(myItems['Items'] as Iterable)
        .map((e) => Item.fromJson(e))
        .toList();
    emit(state.copyWith(items: itemsList, show: false));
  }

  void searchItem(String barcode) {
    final searchResults =
        state.items.where((e) => e.barcode.contains(barcode)).toList();

    emit(state.copyWith(searchItem: searchResults, show: true));
  }

  void selectItem(Item item) {
    final tableData = item.tableData;
    emit(state.copyWith(selectedItem: item, show: false, tableData: tableData));
  }

  void clearSearch() {
    log('Before -->> ${state.selectedItem}');
    emit(state.copyWith(selectedItem: null, show: false, searchItem: [],tableData: []));
    log('After -->> ${state.selectedItem}');
  }
}
