part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<int> selectedList;
  final bool isSelectedAll;

  const HomeState({
    required this.selectedList,
    required this.isSelectedAll,
  });

  factory HomeState.initial() {
    return const HomeState(selectedList: [], isSelectedAll: false);
  }

  HomeState copyWith({
    List<int>? selectedList,
    bool? isSelectedAll,
  }) {
    return HomeState(
      selectedList: selectedList ?? this.selectedList,
      isSelectedAll: isSelectedAll ?? this.isSelectedAll,
    );
  }

  @override
  List<Object?> get props => [selectedList, isSelectedAll];
}
