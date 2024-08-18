part of 'cubit_h_cubit.dart';

class CubitHState extends Equatable {
  final List<int> selectedList;
  final bool isSelected;
  final int currItem;
  final bool isHovering;

  const CubitHState({
    required this.selectedList,
    required this.isSelected,
    required this.currItem,
    required this.isHovering,
  });

  CubitHState copyWith({
    List<int>? selectedList,
    bool? isSelected,
    int? currItem,
    bool? isHovering,
  }) {
    return CubitHState(
      selectedList: selectedList ?? this.selectedList,
      isSelected: isSelected ?? this.isSelected,
      currItem: currItem ?? this.currItem,
      isHovering: isHovering ?? this.isHovering,
    );
  }

  @override
  List<Object> get props => [selectedList, isSelected];
}
