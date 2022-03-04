import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';

final auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final messageController = TextEditingController();
  late User loggedinUser;
  late String text;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = auth.currentUser;
      if (user != null) {
        loggedinUser = user;
        print(loggedinUser.displayName);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chat'),
          centerTitle: true,
          leading: Icon(Icons.home),
          backgroundColor: Color.fromARGB(255, 243, 33, 156),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            messageStream(),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                Flexible(
                  child: TextField(
                    controller: messageController,
                    onChanged: (value) {
                      text = value;
                    },
                    decoration: const InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  width: 30,
                  child: FloatingActionButton(
                    onPressed: () {
                      messageController.clear();
                      firestore
                          .collection('messages')
                          .add({'text': text, 'sender': loggedinUser.email});
                    },
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

class messageStream extends StatelessWidget {
  const messageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            backgroundColor: Colors.lightBlueAccent,
          ); //const Text("Loading");
        }

        return Expanded(
          child: ListView(
            shrinkWrap: true,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              // return ListTile(
              //   title: Text(data['text']),
              //   subtitle: Text(data['sender']),
              // );
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 247, 8, 108),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      data['text'],
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
