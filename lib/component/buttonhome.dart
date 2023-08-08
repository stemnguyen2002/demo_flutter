import 'package:flutter/material.dart';
import 'buttonstyle.dart';

class ButtonHome extends StatelessWidget {
  const ButtonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green,),
          onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => const ButtonApp()));
        }, 
        child: const Text('Home'),),
      ),
    );
  }
}