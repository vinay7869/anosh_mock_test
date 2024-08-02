part of 'home_cubit.dart';

final class HomeState {
  final List<Item> items;
  final List<Item> searchItem;
  final List<TableData> tableData;
  final Item? selectedItem;
  final bool show;

  const HomeState({
    required this.items,
    required this.show,
    required this.selectedItem,
    required this.searchItem,
    required this.tableData,
  });

  HomeState copyWith({
    List<Item>? items,
    List<Item>? searchItem,
    List<TableData>? tableData,
    Item? selectedItem,
    bool? show,
  }) {
    return HomeState(
      items: items ?? this.items,
      searchItem: searchItem ?? this.searchItem,
      tableData: tableData ?? this.tableData,
      selectedItem: selectedItem,
      show: show ?? this.show,
    );
  }
}
