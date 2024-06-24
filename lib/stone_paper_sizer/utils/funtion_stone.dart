


import 'package:o_x_game/stone_paper_sizer/utils/stone_globle.dart';

import '../home/startscreen/startedgame.dart';
int apiPoint=0;
int userPoint=0;
void stoneFuntion()
{
  if(selectIndexUser==0 && xIndex==2)
    {
      userPoint++;
    }
  if(selectIndexUser==2 && xIndex==0)
    {
      apiPoint++;
    }
  if(selectIndexUser==1 && xIndex==0)
    {
      userPoint++;
    }
  if(selectIndexUser==0 && xIndex==1)
    {
      apiPoint++;
    }
  if(selectIndexUser==2 && xIndex==1)
    {
      userPoint++;
    }
  if(selectIndexUser==1 && xIndex==2)
    {
      apiPoint++;
    }
}