import 'package:flutter/material.dart';

import '../../modal/shlok_modal.dart';

class shlok extends StatefulWidget {
  const shlok({super.key});

  @override
  State<shlok> createState() => _shlokState();
}

class _shlokState extends State<shlok> {
  String selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    shloks shlok = ModalRoute.of(context)!.settings.arguments as shloks;
    return Scaffold(
      appBar: AppBar(
        title: Text("shlok ${shlok.s_n}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${shlok.shlok}",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "select language: ",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 4,
                ),
                DropdownButton<String>(
                  value: selectedLanguage,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLanguage = newValue!;
                    });
                  },
                  items: <String>['English', 'gujarati', 'hindi']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  (selectedLanguage != "English")
                      ? (selectedLanguage != "gujarati")
                          ? "${shlok.hindi}"
                          : "${shlok.gujarati}"
                      : "${shlok.english}",
                  style: TextStyle(fontSize: 26),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
