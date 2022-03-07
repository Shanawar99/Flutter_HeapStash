import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:chat_app/services/storage.dart';
import 'dart:io';

final auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? loggedinUser;

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final messageController = TextEditingController();
  late String text;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = auth.currentUser;
      if (user == null) {
        print('user is null');
      }
      if (user != null) {
        loggedinUser = user;
        print(loggedinUser?.displayName);
      }
    } catch (e) {
      print(e);
    }
  }

  String getTime() {
    var time = DateTime.now();
    var time1 = DateFormat.jm().format(time);
    return time1;
  }

  @override
  Widget build(BuildContext context) {
    final FireStorage storage = FireStorage();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chat'),
          centerTitle: true,
          leading: const Icon(Icons.home),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Log Out',
              onPressed: () async {
                await auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
            )
          ],
          backgroundColor: const Color.fromARGB(255, 243, 33, 156),
        ),
        body: Column(
          children: [
            const messageStream(),
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    final results = await ImagePicker.platform
                        .pickImage(source: ImageSource.gallery);
                    // if (results == null) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //       const SnackBar(content: Text('No Files Selected')));
                    //   return null;
                    // }
                    final path = results!.path;
                    storage.uploadFile(path, 'abc');
                  },
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
                      firestore.collection('messages').add({
                        'text': text,
                        'sender': loggedinUser?.email,
                        'time': getTime(),
                        'sorttime': DateTime.now().millisecondsSinceEpoch,
                      });
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
    final FireStorage storage1 = FireStorage();
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').orderBy('sorttime').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            backgroundColor: Colors.lightBlueAccent,
          );
        }
        return Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              final currentUser = loggedinUser?.email;
              bool isMe = currentUser == data['sender'];
              return Align(
                alignment: isMe ? Alignment.topRight : Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data['sender'],
                          style: const TextStyle(
                              fontSize: 12, color: Colors.blueGrey),
                        ),
                      ),
                      Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(20),
                        color: isMe
                            ? const Color.fromARGB(255, 247, 8, 108)
                            : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            data['text'],
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data['time'],
                          style: const TextStyle(
                              fontSize: 10, color: Colors.blueGrey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
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
