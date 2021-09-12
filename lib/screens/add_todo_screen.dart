import 'package:flutter/material.dart';

class AddTodoScreen extends StatefulWidget {
  AddTodoScreen({Key? key}) : super(key: key);

  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  validated() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print("Form Validated");
    } else {
      print("Form not validated");
      return;
    }
  }

  // late String title;
  // late String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(labelText: 'Title'),
                    validator: (String? value) {
                      if (value == null || value.trim().length == 0) {
                        return "Required";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(labelText: 'Description'),
                    validator: (String? value) {
                      if (value == null || value.trim().length == 0) {
                        return "Required";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        validated();
                      },
                      child: Text('Add Todo'))
                ],
              ),
            )),
      ),
    );
  }
}
