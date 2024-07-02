import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:stadiumapp/provider/ticketDataProvider.dart';

class Bookingservices {
  Future<void> bookingOnProgress(String _docId, seatNumber) async {
    await FirebaseFirestore.instance
        .collection('StadiumSeats')
        .doc('North')
        .collection('VIPA')
        .doc(_docId)
        .update({'Status': 'OnProgress'}).then((contex) {
      add_Booking_To_Cart(seatNumber.toString());
    });
  }

  Future<void> direct_Ticket_Purches(String emailId, _docId, seatNumber) async {
    await FirebaseFirestore.instance
        .collection('UsersDetails')
        .doc(emailId)
        .collection('MyTickets')
        .add({
      'TicketNum': "0000111",
      'SeatNum': seatNumber,
    });
  }

  Future<void> add_Booking_To_Cart(String _seatNumber) async {
    await FirebaseFirestore.instance
        .collection('UsersDetails')
        .doc("0718934183")
        .collection('0718934183')
        .add({
      "SeatNo": _seatNumber,
    });
  }

  //Booking List

  Future<void> ticketList(context) async {
    await FirebaseFirestore.instance
        .collection('UsersDetails')
        .doc("0718934183")
        .collection('0718934183')
        .get()
        .then((QuerySnapshot querySnapshot) {
      print(querySnapshot.docs.length);
      // TicketDataProvider().getLiskInCart(querySnapshot.docs.length);
      print("value yetu" + querySnapshot.docs.length.toString());
      Provider.of<TicketDataProvider>(context, listen: false)
          .getLiskInCart(querySnapshot.docs.length);
      print("Value iliochukuliwa");
    });
  }

  Future<int> userBooking() async {
    return FirebaseFirestore.instance
        .collection('UsersDetails')
        .doc("0718934183")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        // String formattedData = data.entries.map((e) => '${e.key}: ${e.value}').join(', ');
        print(data['SeatNo']);
        print(data.length);
      } else {
        print('Document does not exist on the database');
      }
      print(documentSnapshot.data());
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      return data['SeatNo'];
    });
  }
}
