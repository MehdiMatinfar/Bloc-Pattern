import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/test-bloc-learn_bloc/counter_cubit.dart';
import 'package:weather_app/test-bloc-learn_bloc/home_page.dart';

import 'core/widgets/main_wrapper.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home:  BlocProvider(create: (context) => CounterCubit(), child: const HomePage()));




  }
}
