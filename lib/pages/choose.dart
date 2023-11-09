import 'package:flutter/material.dart';
import 'package:wordtime/services/word_time.dart';

class Choose extends StatefulWidget {
  const Choose({super.key});

  @override
  State<Choose> createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  List<WordTime> locations = [
    WordTime(location: "London", flag: 'uk.png'),
    WordTime(location: "Caire", flag: 'egypt.png'),
    WordTime(location: "Indonesia", flag: 'indonesia.png'),
    WordTime(location: "Kenya", flag: 'kenya.png'),
    WordTime(location: "Korea", flag: 'south_korea.png'),
    WordTime(location: "Berlin", flag: 'germany.png'),
    WordTime(location: "Greece", flag: 'greece.png'),
  ];

  void updateTime(int index) async {
    WordTime location = locations[index];
    await location.getTime();
    Navigator.pop(context, {
      'location': location.location,
      'flag': location.flag,
      'time': location.time,
      'isDayTime': location.isDayTime,
      'isData': true,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
          title: const Text('Choose location'),
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, int index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location.toString()),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/${locations[index].flag.toString()}'),
                  ),
                ),
              );
            }));
  }
}
