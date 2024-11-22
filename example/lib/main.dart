import 'package:example/card_items.dart';
import 'package:example/items.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.grey.shade300,
          ),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Neu morphism"),
          ),
          backgroundColor: Colors.grey.shade300,
          body: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(child: myWidget(context)),
                Expanded(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Items(width: size.width);
                      }),
                ),
              ],
            ),
          ),
        ));
  }

  Widget myWidget(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return CardItems(width: size.width);
          }),
    );
  }
}
