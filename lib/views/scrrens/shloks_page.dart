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
        title: Text("${adhyay["name"]}"),
      ),
      body: GridView.builder(
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
                child: Center(
                  child: Text("shlok ${shlok[index].s_n}"),
                ),
              ),
            );
          }),
    );
  }
}
