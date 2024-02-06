
import 'package:flutter/material.dart';

class ForLoop extends StatelessWidget {
  const ForLoop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          for(var i=1; i<4; i++)  Text("Raju $i")
        ],
      ),
    );
  }
}
