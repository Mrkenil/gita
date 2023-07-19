import 'dart:async';

import 'package:departure/views/scrrens/home_page.dart';
import 'package:flutter/material.dart';

class sp_scrren extends StatefulWidget {
  const sp_scrren({super.key});

  @override
  State<sp_scrren> createState() => _sp_scrrenState();
}

class _sp_scrrenState extends State<sp_scrren> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => home_page(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://image.winudf.com/v2/image1/Y29tLmJoYWdhdmFkZ2l0YXdhbGxwYXBlcmhkLnNocmltYWRiaGFnd2F0Z2VldGFwaG90b3Nfc2NyZWVuXzBfMTYyODg3NDQ3M18wMzI/screen-0.webp?fakeurl=1&type=.webp"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
