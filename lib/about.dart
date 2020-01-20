import 'package:flutter/material.dart';
import 'package:komma/data.dart';

int _indeks = 0;
String forslag = "";

class showDetails extends StatelessWidget {

  final int regelIndeks;
  const showDetails({Key key, this.regelIndeks}) : super(key: key);

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
                Text("Sett inn komma der du mener det bør stå, og trykk Enter når du er ferdig:\n",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent),
                    textAlign: TextAlign.left),
                TextFormField(
                  initialValue: setninger[_indeks].tekstUtenKomma,
                  autofocus: true,
                  maxLines: null,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    helperText: kommaregler[setninger[_indeks].regelNr].regel,
                    hintText: setninger[_indeks].tekstMedKomma, hintMaxLines: 3,
                  ),
                  onSaved: (String str) {
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
