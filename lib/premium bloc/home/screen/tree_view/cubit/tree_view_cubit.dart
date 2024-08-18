import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tree_view_state.dart';

class TreeViewCubit extends Cubit<TreeViewState> {
  TreeViewCubit() : super(TreeViewInitial());
}
