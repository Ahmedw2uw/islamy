import 'package:islamy/model/sura_model.dart';
import 'package:islamy/ui/utilits/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostResentSurasPrefrunces {
  static List<SuraModel> surasList = []; //! list contain the suras
  static const suraKey = "suras";

  static Future addSurasListToSharedPrefrunces(SuraModel sura) async {
    //! this work when the user click in the sura
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> oldSuras =
        prefs.getStringList(suraKey) ??
        []; //! ths to store the old list and if empty store empty list
    if (oldSuras.contains(sura.suraIndex.toString())) {//! if is contain of sura 
      oldSuras.remove(sura.suraIndex.toString());//! remove it 
      oldSuras.add(sura.suraIndex.toString());//! then add it again to be in first 
    } else {
      oldSuras.add(sura.suraIndex.toString());//! else add it direct
    }

    //! to add the new sura in old surasList
    prefs.setStringList(
      suraKey,
      oldSuras,
    ); //! to add the new sura suras from list
    await loadSurasListFromSharedPrefrunces(); //! load the list before fill it
  }

  static Future loadSurasListFromSharedPrefrunces() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> curentSurasList =
        pref.getStringList(suraKey) ??
        []; //! to get the old sura if empty add empty list []

    surasList =
        curentSurasList
            .map(
              (stringval) => AppConstants.suras[int.parse(stringval) - 1],
            ) //! sub 1 to start from index 0
            .toList()
            .reversed
            .toList(); //! revers the list
    //! this line is add opend suras by map function and taik the value as string and parse to string and chick of sura index to add it
  }
}
