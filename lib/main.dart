import 'package:flutter/material.dart';
import 'package:komma/about.dart';

void main() => runApp(new MaterialApp(home: Komma()));
Color _colorFront = Colors.deepOrangeAccent;
Color _colorBack = Colors.deepOrangeAccent.shade100;

RichText rikTekst = RichText(
    text: TextSpan(text: "", style: TextStyle(color: Colors.black), children: [
  TextSpan(text: "Dette er "),
  TextSpan(text: "farget", style: TextStyle(color: Colors.blue)),
  TextSpan(text: " tekst."),
]));

class Komma extends StatelessWidget {
  List kommaregler = [
    Kommaregler(
        "Komma mellom setninger som er bundet sammen med og, eller, for og men. Alltid komma foran men.",
        "Petter skifta jobb for tredje gang på to år, og Aud fulgte opp med sin andre skilsmisse på to år.",
        "Petter skifta jobb for tredje gang på to år og Aud fulgte opp med sin andre skilsmisse på to år."),
    Kommaregler(
        "Ikke komma mellom to leddsetninger (bisetninger) dersom subjunksjonen ikke gjentas\nSubjunksjoner:\n'da', 'når', 'hvis', 'dersom', 'mens', 'etter at', 'før', 'fordi', 'om', 'enda', 'selv om', 'at', 'for at', 'slik at', 'slik som, 'å' og 'som' og 'enn' når de innleder leddsetninger.",
        "Hvis helsa holder og økonomien er i orden, drar vi på ferie til Mexico neste år.\nMen: \nHvis helsa holder, og hvis økonomien er i orden, drar vi på ferie til Mexico neste år.",
        "Hvis helsa holder og økonomien er i orden drar vi på ferie til Mexico neste år.\n2: \nHvis helsa holder og hvis økonomien er i orden drar vi på ferie til Mexico neste år."),
    Kommaregler(
        "Komma etter leddsetning som står først i en helsetning",
        "Da Else kom, hadde de andre allerede spist.",
        ""),
    Kommaregler(
        "Komma etter innskutt leddsetning",
        "Boka som lå på bordet, var mi.",
        ""),
    Kommaregler(
        "Komma også foran innskutt leddsetning som ikke er nødvendig i helsetningen",
        "Direktøren, som hadde vært ute på rangel, møtte ikke opp.",
        ""),
    Kommaregler("Komma foran og etter forklarende tillegg",
        "Harare, hovedstaden i Zimbabwe, het før Salisbury.", ""),
    Kommaregler(
        "Komma foran og etter tiltaleord, svarord og utropsord",
        "Ole, kan du komme hit?\nKom hit med deg, din gjøk!\nJa, det forstår jeg godt.\nHei sann, den satt!",
        ""),
    Kommaregler(
        "Komma mellom ledd i oppregning dersom det ikke står noen konjunksjon('og', 'men', 'for', 'eller')",
        "Berit, Else, Gerd og Marit.",
        ""),
    Kommaregler(
        "Komma etter anførselstegnet ved ordrett sitat og gjengivelse av utsagn når ytringssetningen kommer etter det siterte.",
        "«Jeg kommer på fredag», sa han.",
        ""),
    Kommaregler(
        "Ikke komma etter anførselstegnet når sitatet slutter med et spørsmålstegn eller utropstegn.",
        "«Kommer du på fredag?» spurte hun.\n«Kom hit nå med en gang!» ropte hun.",
        ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kommareglene"),
          backgroundColor: _colorFront,
          centerTitle: true,
        ),
        backgroundColor: _colorBack,
        body: ListView.builder(
            itemCount: kommaregler.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 10,
                color: Colors.white,
                child: ListTile(
                  isThreeLine: true,
                  leading: CircleAvatar(
                    backgroundColor: _colorFront,
                    child: Container(
                      decoration: BoxDecoration(
                        //color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text((index + 1).toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0)),
                    ),
                  ),
                  title: Text(kommaregler[index].regel),
                  subtitle:
                      Text("\nEksempel:\n ${kommaregler[index].medKomma}"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => showDetails()));
                  },
                ),
              );
            }));
  }
}

class Kommaregler {
  String regel;
  String medKomma;
  String utenKomma;

  Kommaregler(this.regel, this.medKomma, this.utenKomma);
}
