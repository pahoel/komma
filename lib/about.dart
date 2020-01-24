import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:komma/data.dart';

int _indeks; //Holder indeksen til gjeldende kommaregel overført fra main til regelIndeks her
int _uttrekksindeks = 0;
String valgtSvar = ""; // Brukerens løsning på setningen
String rettSvar = ""; //Korrekt svar på oppgaven
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


  final formFieldController = TextEditingController(); // Kontrollerer hva som skal vises i editeringsfeltet@override

  // Clean up the controller when the widget is disposed.
  void dispose() {
    formFieldController.dispose();
    super.dispose();
  }
  // Start listening to changes.

  @override
  void initState() {
    super.initState();
    formFieldController.addListener(_printLatestValue);
  }

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
      body: Builder(
        builder: (BuildContext context) => Container(
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
                  Text("Sett inn komma der du mener det er riktig:\n",
                      style: TextStyle(color: Colors.blueGrey),
                      textAlign: TextAlign.left),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: formFieldController,
                    maxLines: null,
                    decoration: InputDecoration(
                      helperText: "Husk: Ikke mellomrom foran komma...",
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
                        onPressed: () => sjekkSvaret(context),
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
      ),
    );
  }

  void fyllUttrekksetninger() {
    int i;
    uttrekkSetninger.clear();
    uttrekksSetning =
        "Ingen øvingssetninger til denne kommaregelen"; //Dersom try-catch ikke gir resultat
    regel = "";

    for (i = 0; i < setninger.length; i++) {
      try {
        if (setninger[i].regelNr == _indeks) {
          uttrekkSetninger.add(Training(
              setninger[i].tekstMedKomma, setninger[i].tekstUtenKomma, i));
          uttrekksSetning = uttrekkSetninger[0].tekstUtenKomma;
          regel = kommaregler[_indeks].regel;
        }
        formFieldController.text = uttrekksSetning;
      } on Exception catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  sjekkSvaret(BuildContext context) {
    if (valgtSvar != rettSvar || valgtSvar == "" || rettSvar == "") {
      final snackbar = SnackBar(
        duration: Duration(seconds: 5),
          backgroundColor: Colors.red,
          content: Text("Svaret er feil"));
      Scaffold.of(context).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.green,
          content: Text("Svaret er korrekt"));
      Scaffold.of(context).showSnackBar(snackbar);
    }
  }

  tilForrige() {
    setState(() {
      _uttrekksindeks = (_uttrekksindeks - 1) % uttrekkSetninger.length;
    });
  }

  tilNeste() {
    setState(() {
      _uttrekksindeks = (_uttrekksindeks + 1) % uttrekkSetninger.length;
      formFieldController.text = uttrekkSetninger[_uttrekksindeks].tekstUtenKomma;
    });
    debugPrint(
        "Indeksen er: $_uttrekksindeks og setningen er: ${formFieldController.text}");
  }

  void _printLatestValue() {
    }
}
