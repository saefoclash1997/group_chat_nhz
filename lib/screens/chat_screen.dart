import 'package:flutter/material.dart';
import 'package:group_chat_nhz/constants.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});



  TextEditingController messageController = TextEditingController();
  List<String> messages = ["Hello", "Hello", "My name is mmmm", "Block", "NO"];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
      ),
      appBar: AppBar(
        backgroundColor: kDarkPrimary1,
        title: Text(
          "NHZ Chat",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(bottom: 8.0),
            alignment:  index%2==0 ? Alignment.centerRight : Alignment.centerLeft  ,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 4 / 5,
              ),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: index%2==0 ? kDarkPrimary2 : kLightPrimary1,
                borderRadius:  index%2==0 ? BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ) :  BorderRadius.only(
bottomRight: Radius.circular(20.0),
bottomLeft: Radius.circular(20.0),
topRight: Radius.circular(20.0),
),
              ),

              child: Text(
                messages[index],
                style: TextStyle(color: index%2==0 ? Colors.white : Colors.black),
              ),
            ),
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

                )),

            Visibility(
         //     visible: (messageController.text.trim() == null ||  messageController.text.trim().isEmpty) ? false : true,
              child: InkWell(
                borderRadius: BorderRadius.circular(360),
                onTap: (){},
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 40,
                    maxWidth: 40,
                    minHeight: 40,
                    minWidth: 40
                  ),
                    alignment: Alignment.center,
                    width: 40, height: 40,
                    decoration: BoxDecoration(
                      color: kDarkPrimary2,
                      borderRadius: BorderRadius.circular(360.0),

                    ),

                    child: Icon(Icons.send,
                    color: Colors.white,

                    )),
              ),
            )
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
