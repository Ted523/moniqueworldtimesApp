import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  //String location = '';
  //String time = '';
  String County = '';
  String Population = '';
  String Land = '';
  String flag = '';
  String urll = '';
  bool isDayTime = false;

  //WorldTime({required this.location, required this.flag, required this.urll});
  WorldTime({required this.County, required this.flag, required this.urll});

  Future <void> getTime() async {
    try{
      //final uri = Uri.parse('http://10.0.2.2:8000/KIAMBU');
      //http.Response response = await http.get(uri);
      var response = await http.get(Uri.http("10.0.2.2:8000","/$urll")) ;
      print(response.runtimeType);
      String data1 = jsonDecode(jsonEncode(response.body));
      print(data1.runtimeType);
      List<dynamic> data2 = jsonDecode(data1) ;
      //List<dynamic> keysList = map1.keys.toList();
      var data = Map<String, dynamic>.from(data2[0]);
      print(data);
      //print(data);
      //print(data2);
      //print(data.runtimeType);
      //String location = data['County'];
      County = data['County'];
      //print(location);
      //String time = data['Land'];
      Land = data['Land'];
      Population = data['Population'];

      //DateTime now = DateTime.parse(datetime);
      //now = now.add(Duration(hours: int.parse(offset)));
      //isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      var pop = int.parse(Population);
      isDayTime = pop > 0 && pop < 1000000 ? true : false;
      //time = DateFormat.jm().format(now);
      //Land = Land;
      print(Land);
      print(County);
      print(pop);
    }
    catch (e){
      print('caught error: $e');
      Land = 'could not get time data';
    }

  }
}
