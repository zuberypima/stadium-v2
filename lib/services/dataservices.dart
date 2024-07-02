import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final CollectionReference collection = FirebaseFirestore.instance
      .collection('StadiumSeats')
      .doc('North')
      .collection('VIPA');
  Future<List<Map<String, dynamic>>> fetchData() async {
    QuerySnapshot snapshot = await collection.get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  CollectionReference database = FirebaseFirestore.instance
      .collection('StadiumSeats')
      .doc('North')
      .collection('VIPA');

  Future<void> createSeats(int seatNum) {
    return database.add({
      "GameNo": '1001',
      "SetatNo": seatNum,
      "Status": "Available",
    });
  }

  void loopFunc() {
    for (var i = 1; i < 200; i++) {
      createSeats(i);
      print(i.toString());
    }
  }

  Future<void> createGames(String homeTeam, awayTeam, playDate, gameNumber) {
    return FirebaseFirestore.instance.collection('Games').doc(gameNumber).set({
      "PlayDate": playDate,
      "AwayTeam": awayTeam,
      "HomeTeam": homeTeam,
      "GameNumber": gameNumber
    });
  }
}
