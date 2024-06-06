// lib/data_source.dart
import 'dart:math';

class MockDataSource {
  final _random = Random();

  List<String> fetchData(int count) {
    return List.generate(count, (index) => 'Item ${_random.nextInt(500)}');
  }
}
