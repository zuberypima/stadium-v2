import 'package:flutter/material.dart';
import 'package:stadiumapp/constants/constants.dart';
import 'package:stadiumapp/view/screens/paymentList.dart';
import 'package:stadiumapp/view/widgets/profileCard.dart';

import 'adminPages/adminHomePage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:Colors.blueGrey,
      backgroundColor: Colors.grey[200],

      //  Colors.lightBlueAccent[100],
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: ListView(
        children: [
          profileCardWidget('Notifications', Icons.notifications_none),
          InkWell(
              onTap: () {
                nextPageNavigation(context, PaymentMethodLis());
              },
              child: profileCardWidget('Payments', Icons.payment)),
          profileCardWidget('Settings', Icons.settings),
          profileCardWidget('Help & info', Icons.help),
          InkWell(
              onTap: () {
                nextPageNavigation(context, AdminDashBoard());
              },
              child: profileCardWidget(
                  'Admin Services', Icons.admin_panel_settings)),
        ],
      ),
    );
  }
}
