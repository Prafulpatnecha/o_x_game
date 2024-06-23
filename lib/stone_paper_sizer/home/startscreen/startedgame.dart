import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoneStart extends StatefulWidget {
  const StoneStart({super.key});

  @override
  State<StoneStart> createState() => _StoneStartState();
}

class _StoneStartState extends State<StoneStart> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            Container(
              height: 100,
              width: width,
              color: Colors.cyanAccent,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                child: Container(
                  // margin: EdgeInsets.only(top: 50),
                  width: width,
                  color: Colors.cyan,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    const Text('Point: '),
                    Container(
                      height: 10,
                      width: 10,
                      color: Colors.cyan,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
