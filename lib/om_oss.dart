import 'package:flutter/material.dart';

class OmOss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Velkommen til Komma!"),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top:30, left: 10, right: 10,bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text (
              "Bruksanvisning:\n",
              style: TextStyle(fontSize: 20, color: Colors.deepOrangeAccent),
            ),
            Text("På forsiden ser du de ti viktigste kommareglene - med eksempler.\nNår du klikker på en av reglene, får du anledning til "
                "å trene litt på den aktuelle regelen.\nGjør teksten korrekt i forhold til bruk av komma. Du sjekker om løsninga"
                "er korrekt ved å trykke på V under setninga.\n\n"),
            Text (
              "Om appen:\n",
              style: TextStyle(fontSize: 20, color: Colors.deepOrangeAccent),
            ),
            Text("Denne appen er laget av No9 Factory as.\nDen er helt gratis for alle brukere. Men hvis du synes at den har verdi for deg, er du velkommen til"
                "å bidra til videre utvikling av appen.\nDet kan du gjøre ved å Vippse en skjerv til:\n\n"),
                Text (
                  "470 64 570",
                  style: TextStyle(fontSize: 30)),
          ],
        )
      ),
    );
  }
}
