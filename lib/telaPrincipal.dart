import 'package:flutter/material.dart';

import 'package:trabalho_grafos2/usuario1.dart';
import 'package:trabalho_grafos2/usuario2.dart';
import 'package:trabalho_grafos2/usuario3.dart';
import 'package:trabalho_grafos2/usuario4.dart';
import 'package:trabalho_grafos2/usuario5.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Trabalho Recomendados'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: FloatingActionButton(
                heroTag: "btn1",
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Icon(
                          Icons.person,
                          size: 50.0,
                          ),
                      ),
                      Text(
                        "Usuário 1"
                      ),
                    ],
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usu1()),
                  );
                }
                ),
            ),
            Container(
              height: 100,
              width: 100,
              child: FloatingActionButton(
                heroTag: "btn2",
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Icon(
                          Icons.adb,
                          size: 50.0,
                          ),
                      ),
                      Text(
                        "Usuário 2"
                      ),
                    ],
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usu2()),
                  );
                }
                ),
            ),
            Container(
              height: 100,
              width: 100,
              child: FloatingActionButton(
                heroTag: "btn3",
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Icon(
                          Icons.wine_bar,
                          size: 50.0,
                          ),
                      ),
                      Text(
                        "Usuário 3"
                      ),
                    ],
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usu3()),
                  );
                }
                ),
            ),
            Container(
              height: 100,
              width: 100,
              child: FloatingActionButton(
                heroTag: "btn4",
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Icon(
                          Icons.ac_unit,
                          size: 50.0,
                          ),
                      ),
                      Text(
                        "Usuário 4"
                      ),
                    ],
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usu4()),
                  );
                }
                ),
            ),
            Container(
              height: 100,
              width: 100,
              child: FloatingActionButton(
                heroTag: "btn5",
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Icon(
                          Icons.account_tree,
                          size: 50.0,
                          ),
                      ),
                      Text(
                        "Usuário 5"
                      ),
                    ],
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usu5()),
                  );
                }
                ),
            ),
          ],
        )
      ),
    );
  }
}