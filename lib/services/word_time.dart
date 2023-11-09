import 'package:intl/intl.dart';

class WordTime {
  String time = '';
  int hour = 0;
  bool isDayTime = false;
  String? location = '';
  String? flag = '';

  WordTime({this.location, this.flag});

  Future<void> getTime() async {
    DateTime now = DateTime.now();

    try {
      time = await Future.delayed(const Duration(seconds: 3), () {
        return DateFormat.jm().format(now);
      });
      hour = now.hour;
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      print("Erreur: ${e}");

      time = "Une erreur s'est souvenue lors du chargement des données";
    }
  }
}
