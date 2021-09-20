import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_2/color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Шаг 5. Обертка - BlocProvider
      home: BlocProvider(
        create: (context) => ColorBloc(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter_BloC'),
        centerTitle: true,
      ),
      body: Center(
        // Шаг 6. Обертка для изменяемого виджета
        // В билдер передаем контекст и состояние
        child: BlocBuilder<ColorBloc, Color>(builder: (context, state) {
          return AnimatedContainer(
            height: 100,
            width: 100,
            // рисуем UI из состояния
            color: state,
            duration: const Duration(milliseconds: 500),
          );
        }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // передаем событие в Bloc
              _bloc.add(ColorEvent.event_red);
            },
            backgroundColor: Colors.red,
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              // передаем событие в Bloc
              _bloc.add(ColorEvent.event_green);
            },
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
