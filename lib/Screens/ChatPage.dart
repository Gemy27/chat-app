import 'package:chatapp2/Widgets.dart/chatbubble.dart';
import 'package:chatapp2/constants.dart';
import 'package:chatapp2/models/messagemodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = "chatpage";
  String text="";
  TextEditingController controller = TextEditingController();
  var _controller = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('time', descending: false).snapshots(),
        builder: (context, Snapshot) {
          if (Snapshot.hasData) {
            List<Messagemodel> messageslist = [];
            for (int i = 0; i < Snapshot.data!.docs.length; i++) {
              messageslist.add(Messagemodel.fromJson(Snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kprimarycolor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/scholar.png",
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Scolar Chat"),
                  ],
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          controller: _controller,
                          itemCount: messageslist.length,
                          itemBuilder: ((context, index) {
                            if (messageslist[index].message != Null ||
                                messageslist[index].message != "") {
                              if (email == messageslist[index].id) {
                                return ChatBubble(
                                    text: messageslist[index].message);
                              } else {
                                return ChatBubbleFriend(
                                    text: messageslist[index].message);
                              }
                            }
                          })),
                    ),
                    Container(
                      height: 80,
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: TextField(
                        onChanged: (data){
                          text=data;
                        },
                        controller: controller,
                        onSubmitted: (data) {
                          messages.add({
                            'message': data,
                            'time': DateTime.now(),
                            'id': email,
                          });
                          controller.clear();
                          _controller.animateTo(
                            _controller.position.maxScrollExtent,
                            duration: const Duration(seconds: 2),
                            curve: Curves.easeInOut,
                          );
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  messages.add({
                            'message': text,
                            'time': DateTime.now(),
                            'id': email,
                          });
                          controller.clear();
                          _controller.animateTo(
                            _controller.position.maxScrollExtent,
                            duration: const Duration(seconds: 2),
                            curve: Curves.easeInOut,
                          );
                                },
                                icon: const Icon(
                                  Icons.send,
                                  color: kprimarycolor,
                                )),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: kprimarycolor,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: kprimarycolor,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Text("Loading");
          }
        });
  }
}
