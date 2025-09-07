

import 'package:cloud_firestore/cloud_firestore.dart';

void sendMessage(String email, String message){
FirebaseFirestore.instance.collection("messages").doc().set({
"message": message,
"senderEmail": email!,
"date": DateTime.now(),
});

}