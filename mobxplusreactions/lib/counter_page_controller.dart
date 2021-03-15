import 'package:mobx/mobx.dart';
part 'counter_page_controller.g.dart';

class CounterPageController = _CounterPageControllerBase with _$CounterPageController;

abstract class _CounterPageControllerBase with Store {

  @observable
  int counter = 0;

  @computed
  bool get isEven => counter % 2 == 0;

  @action
  void increment() => counter++;
  
}