part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeSelectAllEvent extends HomeEvent {
  final int itemCount;

  const HomeSelectAllEvent(this.itemCount);

  @override
  List<Object?> get props => [itemCount];
}

class HomeSelectSingleEvent extends HomeEvent {
  final int selectedItem;
  final int itemCount;

  const HomeSelectSingleEvent(this.selectedItem, this.itemCount);

  @override
  List<Object?> get props => [selectedItem, itemCount];
}
