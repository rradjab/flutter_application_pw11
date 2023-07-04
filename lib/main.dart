import 'package:flutter/material.dart';
import 'package:flutter_application_pw11/models/space.dart';
import 'package:flutter_application_pw11/views/detailed_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animations',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Animations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: spaces.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150,
                child: Card(
                  color: Colors.grey,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: Hero(
                              tag: spaces[index].id,
                              child: SizedBox(
                                width: double.infinity,
                                child: Image.asset(
                                  spaces[index].image,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                child: Center(
                                    child: Text(
                                  spaces[index].description,
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                          child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DetailedView(data: spaces[index])),
                            );
                          },
                          icon: const Icon(
                            size: 50.0,
                            Icons.add_box,
                            color: Colors.amber,
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
