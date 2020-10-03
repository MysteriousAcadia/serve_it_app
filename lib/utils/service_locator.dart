import 'package:get_it/get_it.dart';

//Shared Preference Service
import '../services/localstorage_service.dart';

GetIt locator = GetIt();

Future setupLocator() async{
  var instance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(instance);
}