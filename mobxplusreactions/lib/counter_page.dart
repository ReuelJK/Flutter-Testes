import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobxplusreactions/counter_page_controller.dart';

class CounterPage extends StatefulWidget {

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final controller = CounterPageController();
  List<ReactionDisposer> disposers;

  @override
  void initState() {

    disposers = [
    autorun(
      (r)=>
      print("${controller.counter} is ${controller.isEven}")
    ),


    when((r)=> controller.counter >= 10, //parte da lógica que pode ser mais complexa
                                          // faz dispose quando satisfaz uma vez a condição
      
      () =>showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: new Text("Epaaaa"),
          content: new Text("é 10 piazão"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      })),
    
    
    reaction<bool>((r)=> controller.counter % 2 == 0, //parte da lógica que pode ser mais complexa
    (isEven){
      if (isEven)

      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: new Text("Epaaaa"),
          content: new Text("é par piazão"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });},)

      ];

    /* reaction<int>((r)=> controller.counter, 
    (counter){
      if (counter % 2 == 0)

      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: new Text("Alert Dialog titulo"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });},); */
    super.initState();
  }

  @override
  void dispose() {
    disposers.forEach((dispose) => dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        title: Text("MobX Reactions"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(builder: (_) {
              return Text(
                '${controller.counter}',
                style: Theme.of(context).textTheme.display1,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
