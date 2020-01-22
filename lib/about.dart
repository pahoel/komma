import 'package:flutter/material.dart';
import 'package:komma/data.dart';

int _indeks; //Holder indeksen til gjeldende kommaregel overført fra main til regelIndeks her
int _uttrekksindeks = 0;
String forslag = "";
String regel = ""; //Regelen som skal vises under øvingstekset
List uttrekkSetninger = new List();
String uttrekksSetning; //Setningen som skal vises i redigeringsfeltet

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
                Text("Sett inn komma der du mener det bør stå:\n",
                    style: TextStyle(color: Colors.blueGrey),
                    textAlign: TextAlign.left),
                TextFormField(
                  initialValue: uttrekksSetning,
                  maxLines: null,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    helperText: "Husk: Ikke mellomrom foran komma...",
                    hintText: setninger[0].tekstMedKomma,
                    hintMaxLines: 3,
                  ),
                  onSaved: (String str) {
                    setState() {
                      forslag = str;
                      _indeks++;
                    }

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
                  child: Text(
                    regel,
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
                Text(""),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fyllUttrekksetninger() {
    int i;
    uttrekkSetninger.clear();
    uttrekksSetning = "Ingen øvingssetninger til denne kommaregelen"; //Dersom try-catch ikke gir resultat
    regel = "";

    for (i = 0; i < setninger.length; i++) {
      try {
        if (setninger[i].regelNr == _indeks) {
          uttrekkSetninger.add(Training(setninger[i].tekstMedKomma, setninger[i].tekstUtenKomma, i));
          uttrekksSetning = uttrekkSetninger[0].tekstUtenKomma;
          //regel = kommaregler[setninger[regelIndeks].regelNr].regel;
          regel = kommaregler[regelIndeks].regel;
        }

      } on Exception catch (e) {
        debugPrint(e.toString());
      }
    }
    debugPrint(regelIndeks.toString());
    debugPrint(regel);
  }
}

/*class Eksempler {
  String tekstMedKomma;
  String tekstUtenKomma;

  Eksempler(this.tekstMedKomma, this.tekstUtenKomma);
}*/
