import 'package:flutter/material.dart';

class ButtonAll extends StatelessWidget {
  const ButtonAll({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
     // padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget> [
          const Spacer(),
          ButtonText(suffixIcon: Icons.add_circle, title: 'Text', prefixIcon: Icons.add_circle, enabled: true,),
          const Spacer(),
          ButtonText(suffixIcon: Icons.add_circle, title: 'Text', prefixIcon: Icons.add_circle, enabled: false,),
          const Spacer(),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ButtonText extends StatelessWidget {
  IconData suffixIcon;
  IconData prefixIcon;
  String title;
  final bool enabled;
  ButtonText({super.key, required this.suffixIcon, required this.prefixIcon, required this.title, required this.enabled});

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = enabled ? () {} : null;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
       // maximumSize: Size(127, 56),
        minimumSize: const Size(127, 56),
        backgroundColor: const Color(0xFF008C4F),
        foregroundColor: Colors.white,
        //padding: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onPressed, 
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon: Icon(suffixIcon),),
          Text(title),
          IconButton(onPressed: (){}, icon: Icon(prefixIcon),),
        ],
      )
      );
  }
}


