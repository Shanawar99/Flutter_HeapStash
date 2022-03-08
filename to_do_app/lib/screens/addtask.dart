import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          'Add a Task',
          style: TextStyle(
              color: Colors.red, fontSize: 35, fontWeight: FontWeight.w800),
        ),
        TextField(
          onChanged: (value) {},
          textAlign: TextAlign.center,
        ),
        ElevatedButton(onPressed: () {}, child: Text('Add'))
      ]),
    );
  }
}
