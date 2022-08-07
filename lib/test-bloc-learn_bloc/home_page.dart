import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/test-bloc-learn_bloc/counter_cubit.dart';

/// This Class is Just for Learning Bloc Structure !!!!

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Don't Use Bloc Widgets!!!
    var state=context.watch<CounterCubit>().state;

    /* How To Use context.watch Better */

    /*Clear Bloc(Consumer-Builder-Listerner) */

    /*

    Builder(builder:(coontext){
        var state=context.watch<CounterCubit>().state;

        return Text('${state}');

    }

    * */

    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        BlocConsumer<CounterCubit, int>(
          builder: (context, state) => Text('COUNT IS : ${state}'),
          listener: (context, state) => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Data Changed !'))),
          buildWhen: (previous, current) {
            if (current==3 || current==1) {
              return true;

            }
            return false;
          },
          listenWhen: (previous, current) {
            if (current==3 || current==1) {
              return true;

            }
            return false;
          },
        ),
        SizedBox(
          height: 12,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increase();
            },
            child: Text('Increase'),
          ),
          SizedBox(
            width: 24,
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).decrease();
              },
              child: Text('Decrease'))
        ]),
      ]),
    );
  }
}
