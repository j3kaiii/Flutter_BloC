// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Шаг 1. Определяем принимаемые события
enum ColorEvent { event_red, event_green }

// Шаг 2. Создаем класс, наследуем от Bloc<Событие, Состояние>
class ColorBloc extends Bloc<ColorEvent, Color> {
  // Шаг 3. В конструкторе задаем начальное состояние
  ColorBloc() : super(Colors.red);

  // Шаг 4. Переопределяем метод
  // Возвращаем поток с типом состояния( у нас это Color)
  // В параметрах указываем событие
  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    // async* - работаем с потоком а не с объектом Future

    // в зависимости от события (event)
    switch (event) {
      case ColorEvent.event_red:
        // возвращаем нужное состояние
        yield Colors.red;
        break;
      case ColorEvent.event_green:
        yield Colors.green;
        break;
    }
  }
}
