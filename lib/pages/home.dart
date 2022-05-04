import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data['Land']);
    String bgImage = data['isDayTime'] ? 'bay.jpg' : 'nay.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo ;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image:AssetImage('assets/$bgImage'),
            fit: BoxFit.cover
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,120,0,0),
          child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                  children: <Widget> [
                    FlatButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'County': result['County'],
                            'isDayTime': result['isDayTime'],
                            'flag': result['flag'],
                            'Land': result['Land'],
                            'Population': result['Population'],
                          };
                        });
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label: Text(
                        'Edit Location',
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data['County'],
                          style: TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      data['Land'],
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      data['Population'],
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                      ),
                    ),

                  ]
              ),
              const ListTile(
                leading: Icon(Icons.album),
                title: Text('County with Similar conditions'),
                subtitle: Text('Kenya'),
              ),

            ],
          ),
        ),
        ),
      ),
      ),
    );
  }
}
