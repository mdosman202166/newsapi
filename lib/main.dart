import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'aritecal.dart';
import 'aritecalData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Articels> _articellist = <Articels>[];

  @override
  void initState() {
    articelsfun();
  }

  articelsfun() async {
    AritecalData articel = AritecalData();
    await articel.getArticel();
    setState(() {
      _articellist = articel.articellist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NewsApi"),
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              child: (ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width * .5,
                              child: (Image.asset(
                                "images/app.jpg",
                                fit: BoxFit.fill,
                              )),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: MediaQuery.of(context).size.height * .70,
                child: (ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _articellist.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  margin: EdgeInsets.fromLTRB(10, 5, 6, 3),
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: (Image.network(
                                      _articellist[index].urlToImage.toString(),
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  margin: EdgeInsets.fromLTRB(10, 5, 6, 3),
                                  alignment: Alignment.center,
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    _articellist[index].author.toString(),
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white70),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 5, 6, 3),
                                    color: Colors.black38,
                                    alignment: Alignment.bottomRight,
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        _articellist[index]
                                            .publishedAt
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              _articellist[index].title.toString(),
                              style: TextStyle(fontSize: 25, color: Colors.black),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              _articellist[index].description.toString(),
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black38),
                            ),
                          ],
                        ),
                      );
                    })),
              ),
            ),
          ],
        ));
  }
}
