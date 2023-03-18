 import 'package:get/route_manager.dart';

class Messages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en': {
          'Login': 'Login',
          'Mobile': 'Mobile',
          'Passwrod': 'Passwrod',
          'Please login here': 'Please Login Here'
        },
        'hi': {
          'Login': 'लॉग इन करें',
          'Mobile': 'गतिमान',
          'Passwrod': 'पासवर्ड',
          'Login Page': 'लोग इन वाला पन्ना',
          'Please login here': 'कृपया यहाँ लॉगिन करें'
        },
        'fr': {
          'Login': 'connexion',
          'Mobile': 'Mobile',
          'Passwrod': 'Mot de passe',
          'Please login here': 'Veuillez vous connecter ici'
        }
      };
}