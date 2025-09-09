import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:group_chat_nhz/components/loading_screen.dart';
import 'package:group_chat_nhz/constants.dart';
import '../apis/send_message.dart';
import '../auth_services.dart';
import '../components/drawer.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  TextEditingController messageController = TextEditingController();
  final AuthenticationServices _authenticationServices =
      AuthenticationServices();

  @override
  Widget build(BuildContext context) {
    var email = FirebaseAuth.instance.currentUser?.email;
    return



      Scaffold(
      endDrawer: CustomDrawer(authenticationServices: _authenticationServices),
      appBar: AppBar(
        backgroundColor: kDarkPrimary1,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text(
          "NHZ Chat",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),

        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("messages")
            .orderBy("date")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          }
          if (snapshot.data?.docs.length == 0) {
            return Center(child: Text("No Messages Yet!"));
          }

          print(snapshot.data?.docs);

          return ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.only(bottom: 8.0),
                alignment: email == snapshot.data!.docs[index]['senderEmail']
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 4 / 5,
                  ),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: email == snapshot.data!.docs[index]['senderEmail']
                        ? kDarkPrimary2
                        : kLightPrimary1,
                    borderRadius:
                        email == snapshot.data!.docs[index]['senderEmail']
                        ? BorderRadius.only(
                            bottomRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0),
                          )
                        : BorderRadius.only(
                            bottomRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                  ),

                  child: Text(
                    snapshot.data!.docs[index]['message'],
                    style: TextStyle(
                      color: email == snapshot.data!.docs[index]['senderEmail']
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: messageController,
                minLines: 1,
                maxLines: 5,
              ),
            ),

            Visibility(
              //     visible: (messageController.text.trim() == null ||  messageController.text.trim().isEmpty) ? false : true,
              child: InkWell(
                borderRadius: BorderRadius.circular(360),
                onTap: () {



                  sendMessage(email!,messageController.text.trim());
                  messageController.clear();
                },
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 40,
                    maxWidth: 40,
                    minHeight: 40,
                    minWidth: 40,
                  ),
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: kDarkPrimary2,
                    borderRadius: BorderRadius.circular(360.0),
                  ),

                  child: Icon(Icons.send, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//
// Container(
// padding: EdgeInsets.only(bottom: 8.0),
// alignment: Alignment.centerRight,
// child: Container(
// constraints: BoxConstraints(
// maxWidth: MediaQuery.of(context).size.width * 4 / 5,
// ),
// padding: EdgeInsets.all(8.0),
// decoration: BoxDecoration(
// color: kDarkPrimary2,
// borderRadius: BorderRadius.only(
// bottomRight: Radius.circular(20.0),
// bottomLeft: Radius.circular(20.0),
// topLeft: Radius.circular(20.0),
// ),
// ),
//
// child: Text(
// "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
// style: TextStyle(color: Colors.white),
// ),
// ),
// ),
// Container(
// constraints: BoxConstraints(
// maxWidth: MediaQuery.of(context).size.width * 4 / 5,
// ),
// padding: EdgeInsets.only(bottom: 8.0),
// alignment: Alignment.centerLeft,
// child: Container(
// padding: EdgeInsets.all(8.0),
// decoration: BoxDecoration(
// color: kLightPrimary1,
// borderRadius: BorderRadius.only(
// bottomRight: Radius.circular(20.0),
// bottomLeft: Radius.circular(20.0),
// topRight: Radius.circular(20.0),
// ),
// ),
//
// child: Text("Hello"),
// ),
// ),
