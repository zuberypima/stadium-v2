import 'package:flutter/material.dart';

class SmsExtraction extends StatefulWidget {
  const SmsExtraction({Key? key}) : super(key: key);

  @override
  State<SmsExtraction> createState() => _SmsExtractionState();
}

class _SmsExtractionState extends State<SmsExtraction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              //takeName(sms);
              // phonenumber(sms);
              transId(sms);
            },
            child: Text('Test my tetx'),
          ),
        ),
      ),
    );
  }

  //take name only
  takeName(String recivedsms) {
    RegExp exp = RegExp(r'([A-Z][A-Z]{3})\w');

    Iterable<RegExpMatch> matches = exp.allMatches(recivedsms);
    for (final m in matches) {
      //print(m[0]);
      String? name = m[0];
      print(name);
    }
  }

//Take phone number
  phonenumber(String fornumber) {
    RegExp exp = RegExp(r'[\d]{12}');
    String str = 'Parse my string';
    RegExpMatch? match = exp.firstMatch(sms);
    print(match![0]);
  }

//take muamala id
  transId(String forid) {
    RegExp exp = RegExp(r'[\d]{11,}');
    Iterable<RegExpMatch> matches = exp.allMatches(forid);
    for (final m in matches) {
      //print(m[0]);
      String? name = m[0];
      print(name);
    }
  }

  String sms =
      "Zoezi la kuweka fedha kwa FEISAL KHALFAN, 255657281303 limefanikiwa. Kiasi Tsh 3,000. Mrejaa Tsh 56. Salio Jipya ni Tsh 162,081. Kumbukumbu No: 44824127299. 22/05/22 22:02.";
}
