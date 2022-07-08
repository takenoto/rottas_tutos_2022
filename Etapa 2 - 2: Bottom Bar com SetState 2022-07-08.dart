import 'package:flutter/material.dart';

//2022/07/08 ROTTAS TUTORIAL- BOTTOM BAR COM SETSTATE

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
  final screens = [TelaBuscar(), TelaHome(), TelaMapas()];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
       showSelectedLabels: false,
        iconSize:42,
      currentIndex: _currentIndex,
        onTap: (int index){
          setState( (){
            _currentIndex = index;
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
      
    
