import 'package:flutter/material.dart';
import 'package:komma/about.dart';
import 'package:komma/data.dart';
import 'package:komma/splash.dart';

void main() => runApp(new MaterialApp(home: Komma()));
Color _colorFront = Colors.deepOrangeAccent;
Color _colorBack = Colors.deepOrangeAccent.shade100;

class Test extends ovelse{}

class Komma extends StatelessWidget {

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
                        MaterialPageRoute(builder: (context) => ovelse(regelIndeks: index)));
                  },
                ),
              );
            })
    );
  }
}

