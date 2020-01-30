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
String resultatet = "";
int antRette = 0;
int antFeil = 0;

class ovelse extends StatefulWidget {
  @override
  _ovelseState createState() => _ovelseState();
  final int regelIndeks;
  const ovelse({Key key, this.regelIndeks});
}

class _ovelseState extends State<ovelse> {


 final formFieldController = TextEditingController(); // Kontrollerer hva som skal vises i editeringsfeltet@override

    // Start listening to changes.
  @override
  void initState() {
    _indeks = widget.regelIndeks;
    fyllUttrekksetninger(); // Lager en liste med setninger som tilhører gjeldende kommaregelnummer (regelNr)
    super.initState();
  }

 // Clean up the controller when the widget is disposed.
 void dispose() {
   formFieldController.dispose();
   super.dispose();
 }

 @override
  Widget build(BuildContext context) {
    //debugPrint(setninger[regelIndeks].tekstMedKomma);

    //_indeks = widget.regelIndeks;
    //fyllUttrekksetninger(); // Lager en liste med setninger som tilhører gjeldende kommaregelnummer (regelNr)

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
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: formFieldController,
                    maxLines: null,
                    //autofocus: true,
                    style: TextStyle(fontSize: 20, letterSpacing: 2),
                    decoration: InputDecoration(
                      helperText: "Husk: Ikke mellomrom foran komma...",
                    ),
                    onChanged: (String value) {
                      valgtSvar = value;
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
                  Container(
                    child: Text(
                      resultatet,
                      style: TextStyle(color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold),
                    ),
                  ),
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
    //_indeks = widget.regelIndeks;
    uttrekksSetning = "Ingen øvelser til denne kommaregelen"; //Dersom try-catch ikke gir resultat
    regel = "";
    uttrekkSetninger.clear();

    for (i = 0; i < setninger.length; i++) {
      try {
        if (setninger[i].regelNr == _indeks) {
          uttrekkSetninger.add(Training(
              setninger[i].tekstMedKomma, setninger[i].tekstUtenKomma, i));
          uttrekksSetning = uttrekkSetninger[0].tekstUtenKomma;
          regel = kommaregler[_indeks].regel;
        }
      } on Exception catch (e) {
        debugPrint(e.toString());
      }
    }
    formFieldController.text = uttrekksSetning;//Gir ny tekst i tekstfeltet som skal redigeres
    rettSvar = uttrekkSetninger[0].tekstMedKomma; // Setter verdiene til rett svar og valgt svar når ny kommaregel kommer
    valgtSvar = uttrekksSetning; // og brukeren avgir svar uten å klikke i tekstfeltet
  }

  sjekkSvaret(BuildContext context) {
    bool _svaretErKorrekt = false;
    debugPrint("Valgt svar: $valgtSvar og rett svar: $rettSvar . ant setninger er ${uttrekkSetninger.length}");
    if (valgtSvar != rettSvar || valgtSvar == "" || rettSvar == "") {
      final snackbar = SnackBar(
        duration: Duration(seconds: 10),
          backgroundColor: Colors.red,
          content: Text("Svaret er feil! Prøv på nytt..."));
      Scaffold.of(context).showSnackBar(snackbar);
    } else {
      _svaretErKorrekt = true;
      final snackbar = SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.green,
          content: Text("Svaret er korrekt"));
      Scaffold.of(context).showSnackBar(snackbar);
    }
    setState(() {
      if(_svaretErKorrekt == true){
        antRette ++;
      } else{
        antFeil ++;
      }
    });
    resultatet = ("$antRette korrekte svar og $antFeil feil svar så langt");
  }

  tilForrige() {
    setState(() {
      _uttrekksindeks = (_uttrekksindeks - 1) % uttrekkSetninger.length;
      uttrekksSetning = uttrekkSetninger[_uttrekksindeks].tekstUtenKomma;
      formFieldController.text = uttrekksSetning;
    });
    valgtSvar = uttrekksSetning;
    rettSvar = uttrekkSetninger[_uttrekksindeks].tekstMedKomma;
  }

  tilNeste() {
    formFieldController.clear();
    setState(() {
      _uttrekksindeks = (_uttrekksindeks + 1) % uttrekkSetninger.length;
      uttrekksSetning = uttrekkSetninger[_uttrekksindeks].tekstUtenKomma;
      formFieldController.text = uttrekksSetning;
    });
    valgtSvar = uttrekksSetning;
    rettSvar = uttrekkSetninger[_uttrekksindeks].tekstMedKomma;
    //debugPrint("Valgt svar: $valgtSvar og rett svar: $rettSvar . ant setninger er ${uttrekkSetninger.length}");
  }

}
