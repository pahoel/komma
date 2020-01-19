import 'package:flutter/material.dart';

class showDetails extends StatelessWidget {

  String forslag = "";
  final TextEditingController textController = new TextEditingController();

  final List setninger = [
    Eksempler("Dette er tekst med komma, og ikke uten komma", "Dette er tekst uten komma og ikke med komma"),
    Eksempler("Dette er også en tekst med komma, og ikke uten komma", "Dette er også en tekst uten komma og ikke med komma")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lær deg kommareglen!"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Container(
           child: Container(
             margin: EdgeInsets.only(top: 30.0, left: 5.0, right: 5.0),
             height: 200,
            decoration: BoxDecoration(
              border: Border.all(style: BorderStyle.solid, color: Colors.black38),
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                    Text("Sett inn komma på rett plass i setninga under:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent), textAlign: TextAlign.left),
                  TextField (
                    controller: textController,
                    decoration: InputDecoration(
                      helperText: ("Ikke mellomrom foran komma, bare etter. \nAvslutt med Enter."),

                    ),

                    onSubmitted:(String str){
                      setState(){
                        forslag = str;
                      }
                      debugPrint(str);
                  },

                  ),
                  new Text = "",
                  ],
                ),
              ),
            ),
          ),
        );
  }
}

class Eksempler {
  String tekstMedKomma;
  String tekstUtenKomma;

  Eksempler(this.tekstMedKomma, this.tekstUtenKomma);
}