import 'package:flutter/material.dart';

class showDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lær kommareglen"),
          backgroundColor: Colors.green,
        ),
        body: Container(
            child: RichText(text: TextSpan(text: "", style: TextStyle(color: Colors.black), children: [TextSpan(text: "Dette er "), TextSpan(text: "farget", style: TextStyle(color: Colors.blue)), TextSpan(text: " tekst."),]),)
    )
    );
  }
}
