import 'package:flutter/material.dart';

//2022/07/08 ROTTAS TUTORIAL - Etapa 2-  PONTO DE PARTIDA


//Seu objetivo é:

//TODO 1) Colocar as classes criadas (TelaBuscar, TelaHome e TelaMapas)
//na lista "screens"
//Precisamos ter nossas telas salvas em uma lista para acessar

//TODO 2) Adicionar ao método setState a atualização do currentIndex.
//O que é esse currentIndex? A própria bottom bar define.
//É basicamente a id (int) do item selecionado.
//Sem esse método, pode apertar à vontade mas não vai atualizar.


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TrocaCores',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      //Aqui vai ficar a nossa Home
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  //TODO apaga esse widget container e coloca os 3 que criou
  final screens =  [Container(color: Colors.purpleAccent, child: Center(child:Text('ESTOU ERRADO!')))];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
       showSelectedLabels: false,
        iconSize:42,
      currentIndex: _currentIndex,
        onTap: (int index){
          setState( (){
            //_currentIndex = index;
          }
          );
        },
         items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
              label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
              label: 'Maps',
          ),
        ],
        ),
      appBar: AppBar(
        title: const Text('Flutter TrocaCores'),
      ),
      body: screens[_currentIndex],
      
      );
  }
}

class TelaBuscar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('BUILD::: $TelaBuscar :::');
    return Container(
    color: Colors.yellow,
    child: Center(
      child: Text('BUSCA!!!!!', style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}

class TelaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('BUILD::: $TelaHome :::');
    return Container(
    color: Colors.blue,
    child: Center(
      child: Text('HOME!!!!!', style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}

class TelaMapas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('BUILD::: $TelaMapas :::');
    return Container(
    color: Colors.green,
    child: Center(
      child: Text('MAPAS!!!!!', style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}
      
    
