import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(this.text,this.ontap, {super.key});
  final String? text;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
        onTap: ontap,
        child: Text(
          text.toString(),
          style: const TextStyle(fontFamily: "Pacifico", fontSize: 15),
        ),
      ),
    );
  }
}
