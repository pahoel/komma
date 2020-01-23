import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:komma/data.dart';

int _indeks; //Holder indeksen til gjeldende kommaregel overført fra main til regelIndeks her
int _uttrekksindeks = 0;
String valgtSvar = ""; // Brukerens løsning på setningen
String rettSvar = "";   //Korrekt svar på oppgaven
String regel = ""; //Regelen som skal vises under øvingstekset
List uttrekkSetninger = new List(); // Setningene som tilhører denne kommaregelen
String uttrekksSetning; //Setningen som skal vises i redigeringsfeltet

class ovelse extends StatefulWidget {

  @override
  _ovelseState createState() => _ovelseState();
  final int regelIndeks;
  const ovelse({Key key, this.regelIndeks});

}

class _ovelseState extends State<ovelse> {

  @override
  Widget build(BuildContext context) {
    //debugPrint(setninger[regelIndeks].tekstMedKomma);

    _indeks = widget.regelIndeks;
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
                  onChanged: (String value) {
                    valgtSvar = value;
                    rettSvar = setninger[_uttrekksindeks].tekstMedKomma;
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    regel,
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[
                    IconButton(
                      onPressed: () => tilForrige(),
                      icon: Icon(Icons.arrow_back),
                      color: Colors.deepOrangeAccent,
                      tooltip: "Til forrige setning",
                      highlightColor: Colors.black,
                      disabledColor: Colors.grey,
                    ),
                    IconButton(
                      onPressed: () => sjekkSvaret(),
                      icon: Icon(Icons.done),
                      color: Colors.deepOrangeAccent,
                      tooltip: "Sjekk løsningen din",
                      highlightColor: Colors.black,
                      disabledColor: Colors.grey,
                    ),
                    IconButton(
                      onPressed: () => tilNeste(),
                      icon: Icon(Icons.arrow_forward),
                      color: Colors.deepOrangeAccent,
                      tooltip: "Til neste setning",
                      highlightColor: Colors.black,
                      disabledColor: Colors.grey,
                    ),
                  ],
                ),
                Spacer(),
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
          regel = kommaregler[_indeks].regel;
        }

      } on Exception catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  sjekkSvaret() {
    print("Svaret er <$valgtSvar> - og rett svar er <$rettSvar>");
    if(valgtSvar != rettSvar || valgtSvar == "" || rettSvar == ""){
      debugPrint("Svaret er feil");
    } else {
      debugPrint("Svaret er korrekt");
    }
  }

  tilForrige() {
    setState(() {
      _uttrekksindeks = (_uttrekksindeks - 1) % uttrekkSetninger.length;
    });
    debugPrint(_uttrekksindeks.toString());
  }

  tilNeste() {
    setState(() {
      _uttrekksindeks = (_uttrekksindeks + 1) % uttrekkSetninger.length;
    });
    uttrekksSetning = uttrekkSetninger[_uttrekksindeks].tekstUtenKomma;
    debugPrint(uttrekksSetning);
  }

}
