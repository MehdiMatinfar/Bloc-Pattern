import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/home/home_bloc.dart';
import 'package:weather_app/features/weather/presentation/screen/home_screen.dart';
import 'package:weather_app/test-bloc-learn_bloc/counter_cubit.dart';
import 'package:weather_app/test-bloc-learn_bloc/home_page.dart';

import 'config/dependency_injection/locator.dart';
import 'core/widgets/main_wrapper.dart';

void main() async {
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(debugShowCheckedModeBanner: false, home:  BlocProvider(create: (context) => CounterCubit(), child: const HomePage()));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
            providers: [BlocProvider(create: (context) => locator<HomeBloc>())],
            child: const MainWrapper()));
  }
}
