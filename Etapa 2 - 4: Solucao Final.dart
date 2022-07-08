import 'package:flutter/material.dart';

//2022/07/08 ROTTAS TUTORIAL- BOTTOM BAR COM VALUENOTIFIER

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
  //Ele é int? Porque pode ser nullable. Fiz isso só pra treinar.
  //Normalmente não faria, certo?
  final _currentIndex = ValueNotifier<int?>(null);
  final screens = [TelaBuscar(), TelaHome(), TelaMapas()];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder(
      valueListenable: _currentIndex,
          builder: (BuildContext context, int? value, Widget? child){
            return BottomNavigationBar(
       showSelectedLabels: false,
        iconSize:42,
        //
        //
        //Leia: O valor de current index. Se for nulo, use "0".
      currentIndex: _currentIndex.value??0,
        onTap: (int index){
          
           //
           //
           //É assim que se seta o valor de uma ValueNotifier:
           _currentIndex.value = index;
          
          //setState( (){  _currentIndex = index } );
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
        );
            
          }
       
      ),
      appBar: AppBar(
        title: const Text('Flutter TrocaCores'),
      ),
        //
        //
        //Leia: O valor de current index. Se for nulo, use "0".
        //body: screens[_currentIndex.value??0],
        body: ValueListenableBuilder<int?>(
          valueListenable: _currentIndex,
          builder: (BuildContext context, int? value, Widget? child){
            //
            //Value é o nome padrão. Mas eu poderia chamar de index,
            //current index, etc.
            return screens[value??0];
            //
            //Essa sintaxe também seria válida:
            //return screens[_currentIndex.value??0];
            
          }
          
        )
      
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
      
    
