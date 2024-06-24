import 'package:flutter/material.dart';
import 'package:o_x_game/stone_paper_sizer/utils/stone_globle.dart';
import 'package:o_x_game/util/stone_modal.dart';

import '../../util/image.dart';

StoneModal? stoneModal;

class StonePlay extends StatefulWidget {
  const StonePlay({super.key});

  @override
  State<StonePlay> createState() => _StonePlayState();
}

class _StonePlayState extends State<StonePlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecting details'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: stoneModal!.listImage.length,
          itemBuilder: (context, index) {
            return Container(
              child: ListTile(
                title: Column(
                  children: [
                    RadioListTile(
                      value: selectIndexStone,
                      groupValue: index,
                      onChanged: (value) {
                        setState(() {
                          selectIndexStone = index;
                        });
                      },
                      title: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          color: Colors.cyanAccent,
                          image: DecorationImage(
                              image: stoneModal!.listImage[index].imageFind!,
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                    ),
                    (index==3)?const SizedBox(height: 20,):Container(),
                    (index==3)?textFindController(stoneControllerFind: textUserName):Container(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            emptyStone.clear();
            if (selectIndexStone == 0) {
              emptyStone.addAll(simpleImage);
            } else if (selectIndexStone == 1) {
              emptyStone.addAll(hardImage);
            } else if (selectIndexStone == 2) {
              emptyStone.addAll(miciImage);
            } else if (selectIndexStone == 3) {
              emptyStone.addAll(funnyImage);
            }
          });
          Navigator.of(context).pushNamed('/start');
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  TextFormField textFindController({required TextEditingController stoneControllerFind}) {
    return TextFormField(
      controller: stoneControllerFind,
                    decoration: InputDecoration(
                      label: Text('Enter User Name'),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))
                    ),
                  );
  }
}
// haxm
