import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_prod/screens/add_todo_screen.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (
              context,
              index,
            ) {
              return Dismissible(
                  background: Container(
                    color: Colors.red,
                  ),
                  key: UniqueKey(),
                  onDismissed: (direction) {
                   
                  },
                  child: ListTile(
                    title: Text('title'),
                    subtitle: Text('Description'),
                  ));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Todo',
        child: Icon(Icons.add),
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTodoScreen()))
        },
      ),
    );
  }
}
