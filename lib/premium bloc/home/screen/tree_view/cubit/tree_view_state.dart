part of 'tree_view_cubit.dart';

class TreeViewState extends Equatable {
  final bool isHovering;
  final TreeEntry<MyNode>? node;
  final String text;

  const TreeViewState(
      {required this.isHovering, this.node, required this.text});

  TreeViewState copyWith({
    bool? isHovering,
    TreeEntry<MyNode>? node,
    String? text,
  }) {
    return TreeViewState(
      isHovering: isHovering ?? this.isHovering,
      node: node ?? this.node,
      text: text ?? this.text,
    );
  }

  @override
  List<Object?> get props => [isHovering, node, text];
}
