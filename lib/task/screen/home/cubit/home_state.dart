part of 'home_cubit.dart';

final class HomeState {
  final List<Item> items;
  final List<Item> searchItem;
  final Item? selectedItem;
  final bool show;

  const HomeState({
    required this.items,
    required this.show,
    required this.selectedItem,
    required this.searchItem,
  });

  HomeState copyWith({
    List<Item>? items,
    List<Item>? searchItem,
    Item? selectedItem,
    bool? show,
  }) {
    return HomeState(
      items: items ?? this.items,
      searchItem: searchItem ?? this.searchItem,
      selectedItem: selectedItem ?? this.selectedItem,
      show: show ?? this.show,
    );
  }
}
