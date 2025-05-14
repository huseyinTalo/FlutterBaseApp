class CounterModel {
  final int value;
  
  CounterModel({this.value = 0});
  
  CounterModel copyWith({int? value}) {
    return CounterModel(
      value: value ?? this.value,
    );
  }
}