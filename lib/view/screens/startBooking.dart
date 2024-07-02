import 'package:flutter/material.dart';
import 'package:stadiumapp/view/screens/ticketsBook.dart';

class StartBooking extends StatefulWidget {
  const StartBooking({super.key});

  @override
  State<StartBooking> createState() => _StartBookingState();
}

class _StartBookingState extends State<StartBooking> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.green,
            labelStyle:
                TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                child: Text("Regular"),
              ),
              Tab(
                child: Text("Standard"),
              ),
              Tab(
                child: Text("VIP-B"),
              ),
              Tab(
                child: Text("VIP-A"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TicketsbookView(pageLabele: "Regular Tickets"),
            TicketsbookView(pageLabele: "Standard Tickets"),
            TicketsbookView(pageLabele: "VIP-B Tickets"),
            TicketsbookView(pageLabele: "VIP-A Tickets"),
          ],
        ),
      ),
    );
  }
}
