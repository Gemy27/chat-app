import 'package:chatapp2/constants.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({this.text, super.key});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        margin: const EdgeInsets.symmetric(vertical:8),
        decoration: const BoxDecoration(
          color: kprimarycolor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34),
              topRight: Radius.circular(34),
              bottomRight: Radius.circular(34)),
        ),
        child: Text(
          text.toString(),
          style: TextStyle(color: Colors.white, fontFamily: "", fontSize: 15),
        ),
      ),
    );
  }
}




class ChatBubbleFriend extends StatelessWidget {
  const ChatBubbleFriend({this.text, super.key});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        margin: const EdgeInsets.symmetric(vertical:8),
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34),
              topRight: Radius.circular(34),
              bottomLeft: Radius.circular(34)),
        ),
        child: Text(
          text.toString(),
          style: TextStyle(color: Colors.white, fontFamily: "", fontSize: 15),
        ),
      ),
    );
  }
}
