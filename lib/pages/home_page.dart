import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/community.dart';
import 'package:flutter_app/widgets/drawer.dart';
import 'package:flutter_app/widgets/itemwidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/community.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    communitymodel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (communitymodel.items != null && communitymodel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final item = communitymodel.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)),
                      child: GridTile(
                        header: Container(
                          child: Text(
                            item.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                          ),
                        ),
                        child: Image.network(item.image),
                        footer: Container(
                          child: Text(
                            item.price.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                        ),
                      ));
                },
                itemCount: communitymodel.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: Mydrawer(),
    );
  }
}
