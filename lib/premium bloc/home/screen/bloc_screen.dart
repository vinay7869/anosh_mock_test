import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import 'cubit/cubit_h_cubit.dart';

class BlocScreen extends StatefulWidget {
  const BlocScreen({super.key});

  @override
  State<BlocScreen> createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {
  bool ho = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Home Screen'),
      ),
      body: BlocBuilder<CubitHCubit, CubitHState>(
        builder: (context, state) {
          log(state.isSelected.toString());
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Select All'),
                    Checkbox(
                        value: state.isSelected,
                        onChanged: (value) {
                          context.read<CubitHCubit>().isSelectedAll(value!);
                        })
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    onHover: (value) {
                      // setState(() {
                      //   ho = value;
                      // });
                      context.read<CubitHCubit>().onHover(value, index);
                    },
                    hoverColor: state.isHovering ? Colors.amber : Colors.red,
                    child: ListTile(
                        title: Text('Item $index'),
                        trailing: Checkbox(
                            value: state.selectedList.contains(index),
                            onChanged: (value) {
                              context.read<CubitHCubit>().toggleItem(index);
                            })),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
