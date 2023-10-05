import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:products/Cubit/homeCubit/home_cubit_cubit.dart';

import 'package:products/Pages/Home.dart';
import 'package:products/observe/blocobserv.dart';

import 'Cubit/updatecubit/update_cubit_cubit.dart';

void main() {
  Bloc.observer = Simpleblocobserve();
  runApp(StoarApp());
}

class StoarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdateCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
