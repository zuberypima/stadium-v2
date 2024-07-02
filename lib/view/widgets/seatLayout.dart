import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stadiumapp/services/dataservices.dart';

class SeatLayout extends StatefulWidget {
  String seatCategory;
  SeatLayout({super.key, required this.seatCategory});

  @override
  State<SeatLayout> createState() => _SeatLayoutState();
}

class _SeatLayoutState extends State<SeatLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            widget.seatCategory,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: DataService().fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No Data Found'));
            } else {
              List<Map<String, dynamic>> data = snapshot.data!;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> item = data[index];
                  return InkWell(
                    onTap: () {
                      byTicketFunction();
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Icon(Icons.chair),
                          Text(item['SetatNo']),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  byTicketFunction() {
    return showDialog(
        context: context,
        builder: (contex) {
          return AlertDialog(
            content: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Center(
                  child: Text("Your about to by a Ticket"),
                )),
            actions: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
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
