import 'package:flutter/material.dart';
import 'package:stadiumapp/services/dataservices.dart';
import 'package:stadiumapp/view/widgets/formfieldOne.dart';

class CreateGames extends StatefulWidget {
  const CreateGames({super.key});

  @override
  State<CreateGames> createState() => _CreateGamesState();
}

TextEditingController _homeTeam = TextEditingController();
TextEditingController _awayTeam = TextEditingController();
TextEditingController _gameNumber = TextEditingController();

DateTime? selectedDate;

class _CreateGamesState extends State<CreateGames> {
  showDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {}
    return pickedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Create Games"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
        child: ListView(
          children: [
            formFielOne("HomeTeam", _homeTeam, false),
            SizedBox(
              height: 5,
            ),
            formFielOne("Away Team", _awayTeam, false),
            SizedBox(
              height: 5,
            ),
            formFielOne("Game Number", _gameNumber, false),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(174, 42, 170, 202),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, top: 10),
                      child: selectedDate == null
                          ? const Text(
                              "DD-MM-YY",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )
                          : Text(
                              selectedDate.toString().split(' ')[0],
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100),
                      );

                      setState(() {
                        selectedDate = pickedDate;
                      });
                      print(pickedDate);
                      if (pickedDate != null) {}
                    },
                    child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          border: Border.all(
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text(
                          "Play Date",
                          style: TextStyle(fontSize: 15),
                        ))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.amber)),
                onPressed: () {
                  print(selectedDate);
                  DataService().createGames(
                    _homeTeam.text,
                    _awayTeam.text,
                    selectedDate.toString().split(' ')[0],
                    _gameNumber.text,
                  );
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
