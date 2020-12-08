import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trabalho_grafos2/varEstaticas.dart';

class Usu2 extends StatefulWidget {


  @override
  _Usu2State createState() => _Usu2State();
}

class _Usu2State extends State<Usu2> {
  List<String> listaFilmeCompartilhado2= [];
  List<String> listaFilmeCompartilhadoTeste= [];
  int numm = 0;
  int qtdfilmes = 200;
  bool interador = false;
  int qtdfilmesRec = 0;
  List<String> listatela = [
    "https://www.arkade.com.br/wp-content/uploads/2020/08/marvels-avengers-beta.jpg",
    "https://img.youtube.com/vi/FG1EByNnHUU/maxresdefault.jpg",
    "https://www.motherjones.com/wp-content/uploads/x-men-master.jpg?w=990",
    "https://br.sonychannel.com/sites/br.set/files/ct_movie_f_primary_image/bad-boys-br.jpg",
  ];
  List<List<dynamic>> data = [];
  List<String> dataNomesFilmes = [];
  List<String> dataCategoriasFilmes = [];
  List<String> dataNomesFilmesRec = [];
  List<String> dataCategoriasFilmesRec = [];
  void acaoRecomendado(index, texto){
    void inserir (cont, total){
      setState(() {
          dataNomesFilmesRec.add(dataNomesFilmes[cont]);
          dataCategoriasFilmesRec.add(dataCategoriasFilmes[cont]);
          qtdfilmesRec += total;
          variavelStaticas.user1 = dataNomesFilmesRec;
          variavelStaticas.user3 = dataNomesFilmesRec;
          variavelStaticas.user4 = dataNomesFilmesRec;
          variavelStaticas.user5 = dataNomesFilmesRec;
          variavelStaticas.user1Cate = dataCategoriasFilmesRec;
          variavelStaticas.user3Cate = dataCategoriasFilmesRec;
          variavelStaticas.user4Cate = dataCategoriasFilmesRec;
          variavelStaticas.user5Cate = dataCategoriasFilmesRec;
          variavelStaticas.qttFilmes1 = 50;
          variavelStaticas.qttFilmes3 = 50;
          variavelStaticas.qttFilmes4 = 50;
          variavelStaticas.qttFilmes5 = 50;
          listaFilmeCompartilhadoTeste = (dataCategoriasFilmes[index].split("|"));
          if (listaFilmeCompartilhado2.contains(listaFilmeCompartilhadoTeste[0])){
            listaFilmeCompartilhadoTeste.clear();
          }else{
            listaFilmeCompartilhado2.add(listaFilmeCompartilhadoTeste[0]);
            listaFilmeCompartilhadoTeste.clear();
          }
        });
    }
    if (dataCategoriasFilmes[index].contains(texto)){
      dataNomesFilmesRec.clear();
      dataCategoriasFilmesRec.clear();
      qtdfilmesRec = 0;
      for(int cont = 0; cont<= qtdfilmes; cont++){
        if (dataCategoriasFilmes[cont].contains(texto)){
          inserir(cont, 1);                  
        }
      }
    }
  }
  loadAsset() async {
    final myData = await rootBundle.loadString("asset/movies.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);
    data = csvTable;
    for(var i = 1; i <= qtdfilmes; i++ ) {
      setState(() {
        String modifi = data[i].toString();
        List<String> modifi2 = modifi.split(",");
        dataNomesFilmes.add(modifi2[1]);
        dataCategoriasFilmes.add(modifi2[2]);
        dataCategoriasFilmesRec.add(modifi2[2]);
        dataNomesFilmesRec.add(modifi2[1]);
        qtdfilmesRec = dataNomesFilmesRec.length;
      });
   }
  }
  @override
  void initState() {
    // TODO: implement initState
    
    loadAsset();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "Series",
              style: TextStyle(
                color: Colors.white
              ),
            ),
            Text(
              "Filmes",
              style: TextStyle(
                color: Colors.white
              ),
            ),
            Text(
              "Minha lista",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 3),
              ),
              items: listatela.map((it){
                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        it,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Geral",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/4,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: qtdfilmes,
                itemBuilder: (context, index){
                  return Card(
                    color: Colors.white,
                    child: Container(
                      width: MediaQuery.of(context).size.width/2.5,
                      child: SizedBox.expand(
                        child: RaisedButton(
                          splashColor: Colors.red,
                          onPressed: (){
                                acaoRecomendado(index, "Adventure");
                                acaoRecomendado(index, "Children");
                                acaoRecomendado(index, "Fantasy");
                                acaoRecomendado(index, "Animation");
                                acaoRecomendado(index, "Comedy");
                                acaoRecomendado(index, "Romance");
                                acaoRecomendado(index, "Action");
                                acaoRecomendado(index, "Thriller");
                                acaoRecomendado(index, "Horror");
                                acaoRecomendado(index, "Drama");
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ListTile(
                                title: Text("${dataNomesFilmes[index]}",
                                style: TextStyle(
                                  fontSize: 15
                                ),
                                ),
                                subtitle: Text("${dataCategoriasFilmes[index]}",
                                style: TextStyle(
                                  fontSize: 10
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                ),
            ),
            Padding( 
              padding: const EdgeInsets.all(16.0),
              child: Text("Recomendados",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/4,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: qtdfilmesRec,
                itemBuilder: (context, index){
                  return Card(
                    color: Colors.white,
                    child: Container(
                      width: MediaQuery.of(context).size.width/2.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ListTile(
                            title: Text("${dataNomesFilmesRec[index]}",
                            style: TextStyle(
                              fontSize: 15
                            ),
                            ),
                            subtitle: Text("${dataCategoriasFilmesRec[index]}",
                            style: TextStyle(
                              fontSize: 10
                            ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                ),
            ),
            Padding( 
              padding: const EdgeInsets.all(16.0),
              child: Text("Alguns usuários sugeriram!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/4,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: variavelStaticas.qttFilmes2,
                itemBuilder: (context, index){
                  return Card(
                    color: Colors.white,
                    child: Container(
                      width: MediaQuery.of(context).size.width/2.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ListTile(
                            title: Text("${variavelStaticas.user2[index]}",
                            style: TextStyle(
                              fontSize: 15
                            ),
                            ),
                            subtitle: Text("${variavelStaticas.user2Cate[index]}",
                            style: TextStyle(
                              fontSize: 10
                            ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                ),
            ),
          ],
        ),
      ),
      
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}