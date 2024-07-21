import 'dart:math';

import 'package:flutter/material.dart';
import 'package:o_x_game/stone_paper_sizer/utils/funtion_stone.dart';
import 'package:o_x_game/stone_paper_sizer/utils/stone_globle.dart';
import 'package:o_x_game/util/stone_modal.dart';

StoneModal? stoneModalList;

class StoneStart extends StatefulWidget {
  const StoneStart({super.key});

  @override
  State<StoneStart> createState() => _StoneStartState();
}

class _StoneStartState extends State<StoneStart> {
  @override
  Widget build(BuildContext context) {
    stoneModalList = StoneModal.toList(listModal: emptyStone);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 80,
                width: width,
                // color: Colors.cyanAccent,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                  child: Container(
                    // margin: EdgeInsets.only(top: 50),
                    width: width,
                    // color: Colors.cyan,
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
              SizedBox(
                height: height / 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        textUserName.text,
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(
                        userPoint.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.cyanAccent,
                            image: (stoneFindBoolUser == false)
                                ? DecorationImage(
                                    image: stoneModalList!
                                        .listImage[selectIndexUser].imageFind!,
                                    fit: BoxFit.scaleDown)
                                : null),
                        height: 150,
                        width: 150,
                        alignment: Alignment.center,
                        child: (stoneFindBoolUser == true)
                            ? const SizedBox(
                                child: Text(
                                  '?',
                                  style: TextStyle(
                                      color: Colors.purpleAccent,
                                      fontSize: 100),
                                ),
                              )
                            : Container(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Ai',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        apiPoint.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      //todo enter points auto
                      Container(
                        decoration: BoxDecoration(
                          image: (stoneFindBool == false)
                              ? DecorationImage(
                              image: stoneModalList!
                                  .listImage[xIndex].imageFind!,
                              fit: BoxFit.scaleDown)
                              : null,
                          color: Colors.cyanAccent,
                        ),
                        height: 150,
                        width: 150,
                        alignment: Alignment.center,
                        child: (stoneFindBool == true)
                            ? const SizedBox(
                          child: Text(
                            '?',
                            style: TextStyle(
                                color: Colors.red, fontSize: 100),
                          ),
                        )
                            : Container(),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height / 4,
              ),
              // ()?:,
              (stoneFindBoolUser == true)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...List.generate(
                          stoneModalList!.listImage.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  Random random = Random();
                                  xIndex = random.nextInt(emptyStone.length);
                                  // print(xIndex);
                                  stoneFindBoolUser = false;
                                  selectIndexUser = index;
                                  stoneFindBool = false;
                                  stoneFuntion();
                                });
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.deepOrangeAccent,
                                  image: DecorationImage(
                                    image: stoneModalList!
                                        .listImage[index].imageFind!,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                  colors: [Colors.white, Colors.cyanAccent])),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                stoneFindBoolUser = true;
                                stoneFindBool = true;
                              });
                            },
                            child: const Text(
                              'Continue',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                  colors: [Colors.white, Colors.cyanAccent])),
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  stoneFindBoolUser = true;
                                  stoneFindBool = true;
                                  apiPoint = 0;
                                  userPoint = 0;
                                });
                              },
                              child: const Text(
                                'Reset',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        )
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
int xIndex = 0;
// DateTime dateTime = DateTime.now();