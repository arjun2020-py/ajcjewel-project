import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetThemeController extends GetxController {
  //1: intalize the state of the switch widget

  RxBool isSwitched = false.obs;

  //2:instance of getxStroage is created.

  final switchStoageState = GetStorage();

  //3: need to create construter for the above class:

  // It’s not method name .
  //// It’s is a constructor  of GetThemeController where I check what is the previous data been stored my user  . Switch was on/off before closing app
  //)

  GetThemeController() {
    //6: check a if condation  for stored value in getxStorage

    if (switchStoageState.read('getxIsSwitched') != null) {
      isSwitched = switchStoageState.read('getxIsSwitched');
      update();
    }
  }

  changeThemeState(bool value) {
    //5: update the current value.
    isSwitched.value = value;
    switchStoageState.write('getxIsSwitched', isSwitched);
    
    update();
  }
  
}