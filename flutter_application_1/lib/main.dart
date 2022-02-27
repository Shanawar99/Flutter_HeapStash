// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Practice(),
    ));

class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 155, 139, 68),
      appBar: AppBar(
        title: Text(
          'Vampire App',
          style: TextStyle(
              color: Color.fromARGB(255, 219, 1, 1),
              fontFamily: 'belle',
              fontSize: 45,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 2, 2, 2),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                'Name',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'belle', fontSize: 20),
              ),
              Text(
                'Nosferatu',
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 3, 3),
                    fontFamily: 'belle',
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Image.network(
                'https://m.media-amazon.com/images/M/MV5BMTU5MTcwNDkwMl5BMl5BanBnXkFtZTgwNzYzNzEwMzE@._V1_.jpg',
                height: 200,
                width: 200,
              ),
              Text(
                'Name',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'belle', fontSize: 20),
              ),
              Text(
                ' Dracula',
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 3, 3),
                    fontFamily: 'belle',
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjWlA7J0esetmAEJnrbzk7GXUcLaw9AmVODHkz4vGtFPcrAg11k-tYlolEIEw0QXkb27k&usqp=CAU',
                height: 200,
                width: 200,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Name',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'belle', fontSize: 20),
              ),
              Text(
                'Eli',
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 3, 3),
                    fontFamily: 'belle',
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpub7r-3gXfYTJTteYpbO2LkVWIzhmJN39nQ&usqp=CAU',
                height: 200,
                width: 200,
              ),
              Text(
                'Name',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'belle', fontSize: 20),
              ),
              Text(
                'Adam',
                style: TextStyle(
                    color: Color.fromARGB(255, 197, 3, 3),
                    fontFamily: 'belle',
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp9FaGUujpixYv08h2sqLB9gF7kCY0Tf01TQ&usqp=CAU',
                  height: 200,
                  width: 250,
                  scale: 1.5,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
