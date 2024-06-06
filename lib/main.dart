import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCheckList(),
    );
  }
}

class MyCheckList extends StatefulWidget {
  @override
  _MyCheckListState createState() => _MyCheckListState();
}

class _MyCheckListState extends State<MyCheckList> {
  List<String> _todoList = [];

  final _textController = TextEditingController();

  void _addItem() {
    setState(() {
      _todoList.add(_textController.text);
      _textController.text = '';
    });
  }

  void _removeItem(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Liste'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textController,
            decoration: InputDecoration(
                labelText: 'Eingabe hinzufügen',
                labelStyle: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: _addItem,
            final SharedPreferences prefs = 
            await SharedPreferences.getInstance();
            child: Text('Hinzufügen'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_todoList[index]),
                  trailing: IconButton(
                    onPressed: () => _removeItem(index),
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
