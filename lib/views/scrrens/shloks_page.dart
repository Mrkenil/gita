import 'package:flutter/material.dart';
import 'package:departure/modal/shlok_modal.dart';

class shlok_page extends StatefulWidget {
  const shlok_page({super.key});

  @override
  State<shlok_page> createState() => _shlok_pageState();
}

class _shlok_pageState extends State<shlok_page> {
  @override
  Widget build(BuildContext context) {
    Map adhyay = ModalRoute.of(context)!.settings.arguments as Map;
    List all_shlok = adhyay["all_shlok"];

    List<shloks> shlok = all_shlok.map((e) => shloks.fromMap(data: e)).toList();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "${adhyay["name"]}",
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
                      "https://i.pinimg.com/474x/3d/56/a8/3d56a8408fbe4ab6129c24953b28be4e--indian-gods-indian-art.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: shlok.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('shlok', arguments: shlok[index]);
                  },
                  child: Card(
                    color: Colors.white.withOpacity(0.3),
                    child: Center(
                      child: Text(
                        "shlok ${shlok[index].s_n}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
