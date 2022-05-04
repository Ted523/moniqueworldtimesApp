import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> setupWorldTime() async{
    WorldTime instance = WorldTime(County: 'KIAMBU', flag: 'germany.png', urll: 'KIAMBU');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'County': instance.County,
      'flag': instance.flag,
      'Land': instance.Land,
      'Population': instance.Population,

      'isDayTime': instance.isDayTime,
    }

    );


  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[900],
      body:Center (
        child:  SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
