import 'package:flutter/material.dart';
import 'package:listview/data_source.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MockDataSource _dataSource = MockDataSource();
  List<String> _items = [];
  List<int> _list = [1, 2, 5, 7, 12, 34, 1, 34, 0012];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    setState(() {
      _items = _dataSource.fetchData(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dynamic List View'),
        ),
        body: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(color: Colors.red),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 120,
                      decoration: BoxDecoration(color: Colors.greenAccent),
                      child: Column(
                        children: [
                          Text("Items"),
                          Text(_items[index].toString()),
                        ],
                      )),
                ),
              );
            }));
  }
}
