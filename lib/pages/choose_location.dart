
import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

import 'dart:convert' as convert;
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> Countys = [
    WorldTime(urll: 'KIAMBU', County: 'KIAMBU', flag: 'kenya.png'),
    WorldTime(urll: 'MOMBASA', County: 'MOMBASA', flag: 'kenya.png'),
    WorldTime(urll: 'KWALE', County: 'KWALE', flag: 'kenya.png'),
    WorldTime(urll: 'NAKURU', County: 'NAKURU', flag: 'kenya.png'),
    WorldTime(urll: 'THARAKA-NITHI', County: 'THARAKA-NITHI', flag: 'kenya.png'),
    WorldTime(urll: 'KISUMU', County: 'KISUMU', flag: 'kenya.png'),
    WorldTime(urll: 'KILIFI', County: 'KILIFI', flag: 'kenya.png'),
    WorldTime(urll: 'MANDERA', County: 'MANDERA', flag: 'kenya.png'),
    WorldTime(urll: 'NYAMIRA', County: 'NYAMIRA', flag: 'kenya.png'),
    WorldTime(urll: 'KISII', County: 'KISII', flag: 'kenya.png'),
    WorldTime(urll: 'MIGORI', County: 'MIGORI', flag: 'kenya.png'),
    WorldTime(urll: 'HOMA BAY', County: 'HOMA BAY', flag: 'kenya.png'),
    WorldTime(urll: 'SIAYA', County: 'SIAYA', flag: 'kenya.png'),
    WorldTime(urll: 'BUSIA', County: 'BUSIA', flag: 'kenya.png'),
    WorldTime(urll: 'BUNGOMA', County: 'BUNGOMA', flag: 'kenya.png'),
    WorldTime(urll: 'VIHIGA', County: 'VIHIGA', flag: 'kenya.png'),
    WorldTime(urll: 'KAKAMEGA', County: 'KAKAMEGA', flag: 'kenya.png'),
    WorldTime(urll: 'BOMET', County: 'BOMET', flag: 'kenya.png'),
    WorldTime(urll: 'KERICHO', County: 'KERICHO', flag: 'kenya.png'),
    WorldTime(urll: 'KAJIADO', County: 'KAJIADO', flag: 'kenya.png'),
    WorldTime(urll: 'NAROK', County: 'NAROK', flag: 'kenya.png'),
    WorldTime(urll: 'LAIKIPIA', County: 'LAIKIPIA', flag: 'kenya.png'),
    WorldTime(urll: 'BARINGO', County: 'BARINGO', flag: 'kenya.png'),
    WorldTime(urll: 'NANDI', County: 'NANDI', flag: 'kenya.png'),
    WorldTime(urll: 'UASIN GISHU', County: 'UASIN GISHU', flag: 'kenya.png'),
    WorldTime(urll: 'TRANS NZOIA', County: 'TRANS NZOIA', flag: 'kenya.png'),
    WorldTime(urll: 'SAMBURU', County: 'SAMBURU', flag: 'kenya.png'),
    WorldTime(urll: 'WEST POKOT', County: 'WEST POKOT', flag: 'kenya.png'),
    WorldTime(urll: 'TURKANA', County: 'TURKANA', flag: 'kenya.png'),
    WorldTime(urll: "MURANG'A", County: "MANDERA", flag: 'kenya.png'),
    WorldTime(urll: 'KIRINYAGA', County: 'KIRINYAGA', flag: 'kenya.png'),
    WorldTime(urll: 'NYERI', County: 'NYERI', flag: 'kenya.png'),
    WorldTime(urll: 'NYANDARUA', County: 'NYANDARUA', flag: 'kenya.png'),
    WorldTime(urll: 'MAKUENI', County: 'MAKUENI', flag: 'kenya.png'),
    WorldTime(urll: 'MACHAKOS', County: 'MACHAKOS', flag: 'kenya.png'),
    WorldTime(urll: 'KITUI', County: 'KITUI', flag: 'kenya.png'),
    WorldTime(urll: 'EMBU', County: 'EMBU', flag: 'kenya.png'),
    WorldTime(urll: 'MERU', County: 'MERU', flag: 'kenya.png'),
    WorldTime(urll: 'ISIOLO', County: 'ISIOLO', flag: 'kenya.png'),
    WorldTime(urll: 'MARSABIT', County: 'MARSABIT', flag: 'kenya.png'),
    WorldTime(urll: 'WAJIR', County: 'WAJIR', flag: 'kenya.png'),
    WorldTime(urll: 'GARISSA', County: 'GARISSA', flag: 'kenya.png'),
    WorldTime(urll: 'TAITA/TAVETA', County: 'TAITA/TAVETA', flag: 'kenya.png'),
    WorldTime(urll: 'LAMU', County: 'LAMU', flag: 'kenya.png'),
    WorldTime(urll: 'TANA RIVER', County: 'TANA RIVER', flag: 'kenya.png'),
  ];
  void updateTime(index) async {
    WorldTime instance = Countys[index];
    await instance.getTime();
    Navigator.pop(context, {
      'County': instance.County,
      'flag': instance.flag,
      'Land': instance.Land,
      'Population': instance.Population,
      'isDayTime': instance.isDayTime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
          itemCount: Countys.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(Countys[index].County),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${Countys[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
