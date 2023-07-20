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
        title: Text(
          "Bhagavad Gita",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://thumbs.dreamstime.com/b/lord-shrikrishna-vishvaroop-krishna-eighth-incarnation-god-vishnu-hinduism-bhagavad-gita-many-other-puranas-45008215.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          FutureBuilder(
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
                          color: Colors.orangeAccent.withOpacity(0.3),
                          child: Center(
                            child: Text(
                              "${gita[index]["name"]}",
                              style: TextStyle(
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
        ],
      ),
    );
  }
}
