import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:stadiumapp/view/widgets/gameListView.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  @override
  void initState() {
    super.initState();
    generateWeekDates(DateTime.now());
  }

  List<String> datesForDataBase = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          // backgroundColor: Colors.lightBlueAccent[100],
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Text("Games"),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.green,
              tabs: [
                for (String date in generateWeekDates(DateTime.now()))
                  Tab(text: date.toString()),
              ],
            ),
          ),
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(),
                child: ClipRect(
                  child: PanoramaViewer(
                    hotspots: [
                      Hotspot(
                          orgin: Offset(2, 1.5),
                          name: "Lefside",
                          widget: Text(
                            "Here",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                    child: Image.asset('assets/pixel.jpg'),
                  ),
                ),
              ),
              Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.5,
                child: TabBarView(
                  children: [
                    gameListView(datesForDataBase[0]),
                    gameListView(datesForDataBase[1]),
                    gameListView(datesForDataBase[2]),
                    gameListView(datesForDataBase[3]),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  List<String> generateWeekDates(DateTime startDate) {
    List<String> dates = [];

    DateFormat dateFormat = DateFormat('dd/MM');
    DateFormat dateFormat2 = DateFormat('yyyy-MM-dd');

    for (int i = 0; i < 4; i++) {
      DateTime date = startDate.add(Duration(days: i));
      dates.add(dateFormat.format(date));
      datesForDataBase.add(dateFormat2.format(date));
      // print(dates);
    }
    return dates;
  }

  String firstDate() {
    return generateWeekDates(DateTime.now()).first;
  }

  String secodDate() {
    return generateWeekDates(DateTime.now())[2];
  }
}
