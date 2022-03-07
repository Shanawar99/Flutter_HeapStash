import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/material.dart';

class FireStorage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);
    print(file);
    print('I in storage');
    try {
      await storage.ref('test/$fileName').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  Future<void> downloadURL() async {
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref('test/abc')
        .getDownloadURL();
    // Within your widgets:
    Image.network(downloadURL);
  }
}
