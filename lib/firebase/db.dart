import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';

String collection = 'foreign_video';

Future<Map?> getVideoFiles() async {
  Map files = {};
  try {
    await FirebaseFirestore.instance
        .collection(collection)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        files[doc.id] = doc.data();
        print("Reading Doc Data");
        print(doc.data());
        print("Finished Doc Data");
      }
      print("Return files");
      // return files;
    });
  }catch(e){
    print(e);
  }
  return files;
}


