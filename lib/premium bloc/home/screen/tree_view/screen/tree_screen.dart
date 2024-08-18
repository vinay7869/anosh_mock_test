import 'package:anosh_mock_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';

class MyNode {
  const MyNode({
    required this.title,
    this.children = const <MyNode>[],
  });

  final String title;
  final List<MyNode> children;
}

class MyTreeView extends StatefulWidget {
  const MyTreeView({super.key});

  @override
  State<MyTreeView> createState() => _MyTreeViewState();
}

class _MyTreeViewState extends State<MyTreeView> {
  static const List<MyNode> roots = <MyNode>[
    MyNode(
      title: 'Root 1',
      children: <MyNode>[
        MyNode(
          title: 'Node 1.1',
          children: <MyNode>[
            MyNode(title: 'Node 1.1.1'),
            MyNode(title: 'Node 1.1.2'),
          ],
        ),
        MyNode(title: 'Node 1.2'),
      ],
    ),
    MyNode(
      title: 'Root 2',
      children: <MyNode>[
        MyNode(
          title: 'Node 2.1',
          children: <MyNode>[
            MyNode(title: 'Node 2.1.1'),
          ],
        ),
        MyNode(title: 'Node 2.2')
      ],
    ),
  ];

  late final TreeController<MyNode> treeController;
  TextEditingController textC = TextEditingController();

  @override
  void initState() {
    super.initState();
    treeController = TreeController<MyNode>(
      roots: roots,
      childrenProvider: (MyNode node) => node.children,
    );
  }

  @override
  void dispose() {
    treeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textC,
              enabled: false,
            ),
          ),
          SizedBox(
            height: mq.height * .7,
            width: double.maxFinite,
            child: TreeView<MyNode>(
              treeController: treeController,
              nodeBuilder: (BuildContext context, TreeEntry<MyNode> entry) {
                return MyTreeTile(
                  key: ValueKey(entry.node),
                  entry: entry,
                  onTap: () {
                    textC.text = entry.node.title;
                    treeController.toggleExpansion(entry.node);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Create a widget to display the data held by your tree nodes.
class MyTreeTile extends StatelessWidget {
  const MyTreeTile({
    super.key,
    required this.entry,
    required this.onTap,
  });

  final TreeEntry<MyNode> entry;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TreeIndentation(
        entry: entry,
        guide: const IndentGuide.connectingLines(indent: 48),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
          child: Row(
            children: [
              // FolderButton(
              //   isOpen: entry.hasChildren ? entry.isExpanded : null,
              //   onPressed: entry.hasChildren ? onTap : null,
              // ),

              IconButton(
                  onPressed: () {
                    entry.hasChildren ? onTap : null;
                  },
                  icon: Icon(entry.hasChildren
                      ? Icons.folder
                      : Icons.folder_copy_outlined)),
              Text(entry.node.title),
            ],
          ),
        ),
      ),
    );
  }
}
