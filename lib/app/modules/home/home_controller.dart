import '../../shared/services/light_service.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final LightService _lightService;

  _HomeControllerBase(this._lightService);

  @observable
  bool redIsOn = false;

  @action
  Future<void> toggleRedLight() async {
    if (redIsOn) {
      redIsOn = !await _lightService.turnRedLightToState('off');
    } else {
      redIsOn = await _lightService.turnRedLightToState('on');
    }
  }
}
