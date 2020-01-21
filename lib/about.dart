import 'package:flutter/material.dart';
import 'package:komma/data.dart';

int _indeks;
String forslag = "";
List uttrekkSetninger = new List();

class showDetails extends StatelessWidget {

  final int regelIndeks;
  const showDetails({Key key, this.regelIndeks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //debugPrint(setninger[regelIndeks].tekstMedKomma);
    _indeks = regelIndeks;
    fyllUttrekksetninger(); // Lager en liste med setninger som tilhører gjeldende kommaregelnummer (regelNr)

    return Scaffold(
      appBar: AppBar(
        title: Text("Lær deg kommareglen!"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        child: Container(
          margin: EdgeInsets.only(top: 30.0, left: 5.0, right: 5.0),
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
                  //autofocus: true,
                  maxLines: null,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    helperText: "Husk: Ikke mellomrom foran komma...",
                    hintText: setninger[_indeks].tekstMedKomma, hintMaxLines: 3,
                  ),
                  onSaved: (String str) {
                    setState() {
                      forslag = str;
                      _indeks ++; }
                    debugPrint(str);
                    final snackbar = SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text("Korrekt svar"),
                    );
                    Scaffold.of(context).showSnackBar(snackbar);
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(kommaregler[setninger[regelIndeks].regelNr].regel,
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    final snackbar = SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text("Korrekt svar"),
                    );
                    Scaffold.of(context).showSnackBar(snackbar);
                  },
                  //onPressed: _performLogin,
                  child: Text('Ferdig'),
                ),
                Text (""),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fyllUttrekksetninger (){
    int i;
    for(i = 0; i < setninger.length; i++){
      if(setninger[i].regelNr == regelIndeks){
        uttrekkSetninger.add(Training(setninger[i].tekstMedKomma, setninger[i].tekstUtenKomma, regelIndeks));
      }
    }
    debugPrint(uttrekkSetninger.length.toString());
  }

  void svartest (int i){

  }
}

/*class Eksempler {
  String tekstMedKomma;
  String tekstUtenKomma;

  Eksempler(this.tekstMedKomma, this.tekstUtenKomma);
}*/
