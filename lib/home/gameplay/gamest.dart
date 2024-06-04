import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:o_x_game/util/funtionox.dart';
import 'package:o_x_game/util/list_and_globle.dart';

import '../../util/globle_o_x.dart';

class GamePlay extends StatefulWidget {
  const GamePlay({super.key});

  @override
  State<GamePlay> createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () async {
              XFile? xfileimage=await imagePicker.pickImage(source: ImageSource.camera);
            setState(() {
              fileImage=File(xfileimage!.path);
            });
          }, icon: const Icon(Icons.camera_enhance)),
          IconButton(onPressed: () async {
            XFile? xfileImage=await imagePicker.pickImage(source: ImageSource.gallery);
            setState(() {
              fileImage=File(xfileImage!.path);
            });
          }, icon: const Icon(Icons.image)),
          const SizedBox(width: 20,),
          SizedBox(
            width: 110,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(colorListFile.length, (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        colorIndex=index;
                      });
                    },
                    child: (colorIndex!=index)?Container(
                      height: 50,
                      width: 50,
                      color: colorListFile[index]['color'],
                    ):Container(
                      height: 50,
                      width: 50,
                      color: colorListFile[index]['color'],
                      child: const Icon(Icons.done),
                    ),
                  ),),
                ],
              ),
            ),
          ),
          IconButton(onPressed: () {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: const Text('Button Change'),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      textFieldOX(textfindoxauto: 'O', controllerFind: controllerO),
                      const SizedBox(height: 10,),
                      textFieldOX(textfindoxauto: 'X',controllerFind: controllerX),
                      const SizedBox(height: 10,),
                      textFieldOX(textfindoxauto: '*',controllerFind: controllerAuto),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
                actions: [
                  TextButton(onPressed: () {
                    Navigator.of(context).pop();
                    }, child: const Text('Back')),
                  TextButton(onPressed: () {
                    setState(() {
                      if(controllerX.text!=controllerO.text && controllerAuto.text!=controllerX.text && controllerAuto.text!=controllerO.text)
                        {
                          O=controllerO.text;
                          X=controllerX.text;
                          autoOX=controllerAuto.text;
                          Navigator.of(context).pop();
                        }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please Input Different Enter'),));
                        Navigator.of(context).pop();
                      }
                    });
                  }, child: const Text('Save')),
                ],
              );
            },);
          }, icon: const Icon(Icons.edit_road,color: Colors.indigo,)),
          const SizedBox(width: 20,)
        ],
      ),
      // backgroundColor: Colors.blue,
      body: Container(//todo<==================================================================
        height: h,
        width: w,
        decoration: (fileImage!=null)?BoxDecoration(
          image: DecorationImage(
            image:
            FileImage(fileImage!),
            fit: BoxFit.fill
          ),
        ):const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              (colorIndexUnder==colorIndex)?const Text('Mind Game Get Started',style: TextStyle(color: Colors.red,fontSize: 30),):Container(),
              const SizedBox(
                height: 40,
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
                          child: (occk!=3)?buildContainer(index: index):(boolck==true)? (index==1)? Center(child: Text('$X Is Player Win',style: const TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),):Container():(index==1)? Center(child: Text('$O Player Is Win',style: const TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold))):Container(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 70,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border.symmetric(horizontal: BorderSide(color: Colors.redAccent,width: 3))
                    ),
                    width: 110,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(colorListFile.length, (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                colorIndexUnder=index;
                              });
                            },
                            child: (colorIndexUnder!=index)?Container(
                              height: 50,
                              width: 50,
                              color: colorListFile[index]['color'],
                            ):Container(
                              height: 50,
                              width: 50,
                              color: colorListFile[index]['color'],
                              child: const Icon(Icons.done),
                            ),
                          ),),
                        ],
                      ),
                    ),
                  ),
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
                      child: const Center(child: Text('Re-PLAY',style: TextStyle(color: Colors.black,fontSize: 20),)))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  TextField textFieldOX({required String textfindoxauto,required TextEditingController controllerFind}) {
    return TextField(
      maxLength: 1,
                controller: controllerFind,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.cyan)),
                  hintText: textfindoxauto,
                ),
              );
  }
  Container buildContainer({required var index}) {
    return Container(
      height: 116.5,
      width: 116.5,
      decoration: BoxDecoration(
          color: colorListFile[colorIndex]['color'], border: Border.all(color: colorListFile[colorIndexUnder]['color']),
        borderRadius: BorderRadius.circular(10)
      ),
      child:
      (selectindex[index]==1)?(ck[index]==true)?oDeifine():xDeifine():emtyDeifine(),
      // oDeifine(),
      // xDeifine(),
    );
  }

  Center xDeifine() => Center(child: Text(X,style: TextStyle(color: colorListFile[colorIndexUnder]['color'],fontSize: 75),),);
  Center emtyDeifine() => Center(child: Text(autoOX,style: TextStyle(color: colorListFile[colorIndexUnder]['color'],fontSize: 75),),);
  Center oDeifine() => Center(child: Text(O,style: TextStyle(color: colorListFile[colorIndexUnder]['color'],fontSize: 75),),);
}
