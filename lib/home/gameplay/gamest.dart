import 'package:flutter/material.dart';
import 'package:o_x_game/util/funtionox.dart';
import 'package:o_x_game/util/list_and_globle.dart';

class GamePlay extends StatefulWidget {
  const GamePlay({super.key});

  @override
  State<GamePlay> createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Center(
              child: SizedBox(
                height: 350,
                width: 350,
                // color: Colors.blue,
                child: Wrap(
                  children: [
                    ...List.generate(
                      9,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectindex[index]=1;
                              if(occk!=3)
                              {
                                if(ck[index]!=true && ck[index]!=false)
                                  {
                                    if(boolck==true)
                                    {
                                        ck[index]=true;
                                        boolck=false;
                                    }
                                    else{
                                        ck[index]=false;
                                      boolck=true;
                                    }
                                  }
                              }
                            if(boolck==true)
                            {
                              xo();
                            }
                            else
                            {
                              ox();
                            }
                          });
                          fullchecking();
                        },
                        child: (occk!=3)?buildContainer(index: index):(boolck==true)? (index==1)?const Center(child: Text('X Is Player Win',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),):Container():(index==1)?const Center(child: Text('O Player Is Win',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold))):Container(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 70,),
            TextButton(onPressed: () {
              setState(() {
                reck();
                occk=0;
              });
            }, child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color(0x00ffffff),
                  Colors.cyanAccent,
                ],
              ),
                shape: BoxShape.circle,
              ),
                child: const Center(child: Text('Re-PLAY',style: TextStyle(color: Colors.black,fontSize: 20),))))
          ],
        ),
      ),
    );
  }
  Container buildContainer({required var index}) {
    return Container(
      height: 116.5,
      width: 116.5,
      decoration: BoxDecoration(
          color: Colors.black, border: Border.all(color: Colors.white)),
      child:
      (selectindex[index]==1)?(ck[index]==true)?oDeifine():xDeifine():emtyDeifine(),
      // oDeifine(),
      // xDeifine(),
    );
  }

  Center xDeifine() => const Center(child: Text('X',style: TextStyle(color: Colors.white,fontSize: 75),),);
  Center emtyDeifine() => const Center(child: Text('*',style: TextStyle(color: Colors.white,fontSize: 75),),);

  Center oDeifine() => const Center(child: Text('O',style: TextStyle(color: Colors.white,fontSize: 75),),);
}
