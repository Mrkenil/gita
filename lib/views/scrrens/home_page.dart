import 'dart:convert';

import 'package:departure/modal/shlok_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bhagavad Gita"),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString("lib/json/data_of_json.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String data = snapshot.data!;
            Map decoded_data = jsonDecode(data);
            List gita = decoded_data["Bhagavad_gita"];

            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: gita.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('shloks_page', arguments: gita[index]);
                    },
                    child: Card(
                      color: Colors.orangeAccent,
                      child: Center(
                        child: Text(
                          "${gita[index]["name"]}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
