import 'package:flutter/foundation.dart';
import '../models/counter_model.dart';

class CounterViewModel extends ChangeNotifier {
  CounterModel _model = CounterModel();
  
  int get counter => _model.value;
  
  void increment() {
    _model = _model.copyWith(value: _model.value + 1);
    notifyListeners();
  }
}