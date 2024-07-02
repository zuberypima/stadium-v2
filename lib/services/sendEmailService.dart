import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class SendEmailService {
  final _recipientController =
      TextEditingController(text: "zuberypima12@gmail.com");

  final _subjectController = TextEditingController(text: 'The subject');
  final _bodyController = TextEditingController(
    text: 'Mail body.',
  );


  Future<void> send() async{
    await Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      // attachmentPaths: attachments,
      isHTML: false,
    );
  }
}
