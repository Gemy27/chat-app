import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield(this.text,{this.obsecuretext=false,this.onchanged,super.key});
  final String? text;
  final Function(String)? onchanged;
  final bool? obsecuretext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecuretext!,
      style: Theme.of(context).textTheme.displayMedium,
      validator: (data){
        if(data!.isEmpty)
        {
          return "Field is required";
        }
        return null;
      },
      onChanged: onchanged,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: Theme.of(context).textTheme.displayMedium,
        focusColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white,),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
