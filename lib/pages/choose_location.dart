import 'package:flutter/material.dart';
import 'package:world_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'https://www.countryflags.io/gb/flat/64.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'https://www.countryflags.io/de/flat/64.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'https://www.countryflags.io/eg/flat/64.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'https://www.countryflags.io/be/flat/64.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'https://www.countryflags.io/us/flat/64.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'https://www.countryflags.io/us/flat/64.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'https://www.countryflags.io/kr/flat/64.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'https://www.countryflags.io/id/flat/64.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];

    await instance.getTime();
    Navigator.pop(context, {
      'location' : instance.location,
      'time' : instance.time,
      'flag' : instance.flag,
      'isDaytime' : instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(

              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          updateTime(index);
                        },
                        title: Text(locations[index].location),
                        leading: Image(
                          image: NetworkImage('${locations[index].flag}'),
                        ),
                      ),
                    ),
                  );
                }
            ),
          ],
        ),
      )
    );
  }
}
