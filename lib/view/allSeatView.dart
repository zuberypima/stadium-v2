import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadiumapp/provider/ticketDataProvider.dart';
import 'package:stadiumapp/services/bookingServices.dart';
import 'package:stadiumapp/view/screens/profileScreen.dart';
import 'package:stadiumapp/view/widgets/indicatorContainer.dart';

class AllseatView extends StatefulWidget {
  String stadium_side;
  AllseatView({super.key, required this.stadium_side});

  @override
  State<AllseatView> createState() => _AllseatViewState();
}

class _AllseatViewState extends State<AllseatView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Bookingservices().ticketList(context);
  }

  String _text = "0";
  void _updateText() {
    setState(() {
      print("vaule go to text" +
          Provider.of<TicketDataProvider>(context, listen: false)
              .listInCart
              .toString());
      _text = Provider.of<TicketDataProvider>(context, listen: false)
          .listInCart
          .toString();
      print("value to update text" + _text);
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> seatCollesction = FirebaseFirestore.instance
        .collection('StadiumSeats')
        .doc(widget.stadium_side)
        .collection('VIPA')
        .orderBy('SetatNo', descending: false)
        .snapshots();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.green,
          title: Text(
            "All Seat View",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Row(
              children: [
                Text(
                  'Seats',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                    child: Text(
                  _text,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue),
                )),
              ],
            )
          ],
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              indicatoContainer(context),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: seatCollesction,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text('Something went wrong'));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(child: Text('No seats available'));
                      }

                      return GridView.builder(
                        itemCount: snapshot.data?.docs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 6, childAspectRatio: 1.5),
                        itemBuilder: (BuildContext context, int index) {
                          var document = snapshot.data!.docs[index];
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;

                          return InkWell(
                            onTap: () {
                              if (data['Status'] == 'Available') {
                                if (_auth.currentUser?.email.toString() ==
                                    null) {
                                  pleaseRegisterAccount();
                                } else {
                                  startBuyingTicket(
                                      _auth.currentUser!.email.toString(),
                                      document.id.toString(),
                                      data['SetatNo']);
                                }

                                //   Bookingservices()
                                //       .ticketList(context)
                                //       .then((_) => _updateText);
                                // } else if (data['Status'] == 'OnProgress') {
                                //   bookingOnProgress();
                                // } else {
                                //   alreadySoldTicket(data['Status']).toString();
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                data['Status'] == 'Sold'
                                    ? const Icon(
                                        Icons.not_accessible_rounded,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.chair,
                                        size: 15,
                                      ),
                                Text(data['SetatNo'].toString()),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  startBuyingTicket(String userEmialId, seatID, seatNumber) {
    return showDialog(
        context: context,
        builder: (contex) {
          return AlertDialog(
            content: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: const Center(
                  child: Text("Your about to by a Ticket"),
                )),
            actions: [
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Bookingservices().direct_Ticket_Purches(
                      userEmialId,
                      seatID,
                      seatNumber,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("Buy It")),
            ],
          );
        });
  }

  bookingOnProgress() {
    return showDialog(
        context: context,
        builder: (contex) {
          return AlertDialog(
            content: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: const Center(
                  child: Text("Your about to by a Ticket"),
                )),
            actions: [
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK")),
            ],
          );
        });
  }

  updateStatePop() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Confim only"),
            actions: [
              ElevatedButton(onPressed: _updateText, child: Text("Buy it"))
            ],
          );
        });
  }

  pleaseRegisterAccount() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Center(child: Text("Please register to buy")),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ProfileScreen()));
                  },
                  child: Text("Ok"))
            ],
          );
        });
  }

  // Sold Out
  alreadySoldTicket(String _seatStatus) {
    return showDialog(
        context: context,
        builder: (contex) {
          return AlertDialog(
            content: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Center(
                  child: Text("Ticket is already" + ' ' + _seatStatus),
                )),
            actions: [
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK")),
            ],
          );
        });
  }
}
