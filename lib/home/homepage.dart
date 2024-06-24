import 'package:flutter/material.dart';
import 'package:o_x_game/util/image.dart';

import '../stone_paper_sizer/home/startscreen/startedgame.dart';
import '../stone_paper_sizer/home/stone_play.dart';
import '../util/stone_modal.dart';
import 'gameplay/gamest.dart';

class MyOX extends StatelessWidget {
  const MyOX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akhil Sir',
      routes: {
        '/': (context) => const HomePage(),
        '/play':(context) => const GamePlay(),
        '/play2':(context) => const StonePlay(),
        '/start':(context) => const StoneStart(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    stoneModal=StoneModal.toList(listModal: allListImage);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color(0xff12154a),
        title: const Text(
          "Start Point",
          style:
              TextStyle(color: Color(0xff12154a), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      // backgroundColor: const Color(0xff12154a),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ox,
                ),
              ),
            ),
            Container(
              height: 80,
              width: 170,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(40),
                // gradient: LinearGradient(
                //   colors: [
                //     Colors.deepPurpleAccent,
                //     Colors.green,
                //   ]
                // ),
        
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/play');
                },
                child: Image(image: play,),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              height: 80,
              width: 170,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(40),
                // gradient: LinearGradient(
                //   colors: [
                //     Colors.deepPurpleAccent,
                //     Colors.green,
                //   ]
                // ),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/play2');
                },
                child: Image(image: stoneModal!.listImage[2].imageFind!,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
