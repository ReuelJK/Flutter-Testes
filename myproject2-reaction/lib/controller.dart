import 'package:mobx/mobx.dart';
part 'controller.g.dart'; //Gerado através do comando 'flutter pub run build_runner build'
//É uma parte do código que vai ser gerada

 class Controller = ControllerBase with _$Controller;

  abstract class ControllerBase with Store {
  @observable
  String nome = '';  

  @observable
  String sobrenome = ''; 

  @computed
  String get nomeCompleto => "$nome $sobrenome";

  @action
  mudarNome(String novoNome){
    nome = novoNome;
  }

  @action
  mudarSobrenome(String novoSobrenome){
    sobrenome = novoSobrenome;
  }
}