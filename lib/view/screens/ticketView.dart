import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Ticketview extends StatefulWidget {
  String seatNumber, ticketOuwner;
  Ticketview({super.key, required this.seatNumber, required this.ticketOuwner});

  @override
  State<Ticketview> createState() => _TicketviewState();
}

class _TicketviewState extends State<Ticketview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text("Ticket Detail"),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(widget.seatNumber),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(widget.ticketOuwner),
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(width: 5),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: QrImageView(
                    gapless: false,
                    data: widget.seatNumber,
                    size: 300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
