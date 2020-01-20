import 'package:flutter/material.dart';
import 'package:komma/data.dart';

class showDetails extends StatelessWidget {
  int _indeks = 0;
  int regelIndeks = 0;
  String forslag = "";

  /*final List setninger = [
    Eksempler("Dette er tekst med komma, og ikke uten komma",
        "Dette er tekst uten komma og ikke med komma"),
    Eksempler("Dette er også en tekst med komma, og ikke uten komma",
        "Dette er også en tekst uten komma og ikke med komma")
  ];*/

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
                Text("Skriv inn setninga under streken med korrekt bruk av komma, og trykk Enter når du er ferdig:\n",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent),
                    textAlign: TextAlign.left),
                TextField(
                  autofocus: true,
                  maxLines: null,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    helperText: kommaregler[setninger[_indeks].regelNr].regel,
                    hintText: setninger[_indeks].tekstMedKomma, hintMaxLines: 3,
                  ),
                  onSubmitted: (String str) {
                    setState() {
                      forslag = str;
                      _indeks ++; }
                    debugPrint(str);
                  },

                ),
                Text (""),
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
