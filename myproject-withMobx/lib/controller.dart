import 'package:mobx/mobx.dart';
part 'controller.g.dart'; //Gerado através do comando 'flutter pub run build_runner build'
//É uma parte do código que vai ser gerada

 class Controller = ControllerBase with _$Controller;

  abstract class ControllerBase with Store {

    @observable //metadado
    int counter = 0;

    @action //faz alteração no metadado, uma action faz a alteração
    increment(){
    //counter.value++; //sem orianteção a objeto

    counter++; //com orianteção a objeto
  }
}


//Antes das facilidades
/* class Controller{

  //Parecido com Bloc
  var _counter = Observable(0);
  //Um pouco de orientação a objeto
  int get counter =>  _counter.value;
  set counter(int newValue) => _counter.value = newValue; */

  /* 
  Action increment;
  
  Controller(){
    increment = Action(_increment);

    //escutando reação dentro do código, sem a necessidade de escutar na view
    autorun((_){
      //Se colocar algo que tenha um observable
      
      //print(counter.value);//sem orianteção a objeto
      
      print(counter);//com orianteção a objeto
    });
  } */