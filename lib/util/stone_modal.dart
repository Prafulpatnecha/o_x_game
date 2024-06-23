

import 'package:flutter/cupertino.dart';

class StoneModal
{
  AssetImage? imageFind;
  List<StoneModal> listImage=[];
  StoneModal({this.imageFind});
  factory StoneModal.fromStone(Map m1)
  {
    return StoneModal(imageFind: m1['image']);
  }

  StoneModal.toList({required List listModal})
  {
    for(int i=0; i<listModal.length; i++)
      {
        listImage.add(StoneModal.fromStone(listModal[i]));
      }
  }
}