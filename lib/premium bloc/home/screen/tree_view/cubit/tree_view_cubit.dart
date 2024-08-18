import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';

import '../screen/tree_screen.dart';

part 'tree_view_state.dart';

class TreeViewCubit extends Cubit<TreeViewState> {
  TreeViewCubit() : super(const TreeViewState(isHovering: false, text: ''));

  void whenHovering(bool value, TreeEntry<MyNode> node) {
    emit(state.copyWith(isHovering: value, node: node));
  }

  void changeText(String text) {
    emit(state.copyWith(text: text));
  }
}
