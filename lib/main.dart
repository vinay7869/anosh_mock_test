import 'package:anosh_mock_test/pp/pp.dart';
import 'package:anosh_mock_test/premium%20bloc/home/bloc/home_bloc.dart';
import 'package:anosh_mock_test/premium%20bloc/home/screen/bloc_screen.dart';
import 'package:anosh_mock_test/premium%20bloc/home/screen/cubit/cubit_h_cubit.dart';
import 'package:anosh_mock_test/ui/feature/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'premium bloc/home/screen/tree_view/screen/tree_screen.dart';
import 'ui/feature/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

late Size mq;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => HomeBloc()),
        BlocProvider(create: (_) => CubitHCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Manrope',
          useMaterial3: false,
        ),
        // home: const PP(),
        // home: const BlocScreen(),
        home: const MyTreeView(),
      ),
    );
  }
}
