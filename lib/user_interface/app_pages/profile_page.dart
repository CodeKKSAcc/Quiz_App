

import 'package:flutter/material.dart';


enum PaymentMethod {
  upi,
  card,
  cash,
}


class ProfilePage extends StatefulWidget {

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PaymentMethod? selectedMethod = PaymentMethod.upi;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green,
    );
  }
}

