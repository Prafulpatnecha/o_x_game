import 'package:flutter/material.dart';
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
    stoneModalList=StoneModal.toList(listModal: emptyStone);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
              SizedBox(height: height/8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text('API',style: TextStyle(fontSize: 30),),
                      const Text('Point',style: TextStyle(fontSize: 20),),//todo enter points auto
                      Container(
                        decoration: const BoxDecoration(
                        color: Colors.cyanAccent,
                          shape: BoxShape.circle
                        ),
                        height: 150,
                        width: 150,
                        alignment: Alignment.center,
                        child: (stoneFindBool==true)?const SizedBox(
                          child: Text('?',style: TextStyle(color: Colors.red,fontSize: 50),),
                        ):Container(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(textUserName.text,style: const TextStyle(fontSize: 30),),
                      const Text('Point',style: TextStyle(fontSize: 20),),
                      Container(
                        decoration: const BoxDecoration(
                        color: Colors.cyanAccent,
                          shape: BoxShape.circle,
                        ),
                        height: 150,
                        width: 150,
                        alignment: Alignment.center,
                        child: (stoneFindBoolUser==true)?Container(
                          child: Text('?',style: TextStyle(color: Colors.red,fontSize: 50),),
                        ):Container(),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height/4,),
              // ()?:,
              (stoneFindBoolUser==true)?Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(stoneModalList!.listImage.length, (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                          image: DecorationImage(
                            image: stoneModalList!.listImage[index].imageFind!,
                          ),
                        ),
                      ),
                    ),
                  ),),
                ],
              ):GestureDetector(
                onTap: () {

                },
                  child: Container()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
