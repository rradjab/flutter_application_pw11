import 'package:flutter/material.dart';
import 'package:flutter_application_pw11/models/space.dart';

class DetailedView extends StatelessWidget {
  const DetailedView({super.key, required this.data});
  final Space data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: data.id,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(data.image),
                  ),
                ),
                Positioned(
                    bottom: -15,
                    right: 0,
                    child: Hero(
                        tag: '${data.id}-button',
                        child: IconButton(
                          iconSize: 50.0,
                          onPressed: () {
                            debugPrint('Id: is ${data.id}');
                          },
                          icon: const Icon(Icons.add_box),
                          color: Colors.amber,
                        ))),
              ],
            ),
            Hero(
              tag: '${data.id}-title',
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Material(child: Text(data.description)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
