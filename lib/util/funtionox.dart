import 'package:o_x_game/util/list_and_globle.dart';
void fullchecking()
{
  int i=0;
  for(i=0;i<=8;i++)
    {
      if(ck[i]==5)
      {
        fullck++;
      }
    }
  if(fullck==0)
  {
    reck();
  }
  fullck=0;
}
void reck()
{
  for(int i=0;i<=8;i++)
  {
    selectindex[i]=0;
    ck[i]=5;
  }
}
void xo()
{
  occk=0;
  for(int i=0;i<1;i++)
  {
    for(int j=0;j<=2;j++)
    {
      // print(0,1,2);
      if(ck[j]==false)
      {
        occk++;
      }
    }
    if(occk!=3)
    {
      occk=0;
      for(int j=3;j<=5;j++)
      {
        // print(3,4,5);
        if(ck[j]==false)
        {
          occk++;
        }
      }
    }
    if(occk!=3)
    {
      occk=0;
      for(int j=6;j<=8;j++)
      {
        // print(6,7,8);
        if(ck[j]==false)
        {
          occk++;
        }
      }
    }
    if(occk!=3)
    {
      occk=0;
      int k=0;
      for(int j=0;j<=2;j++)
      {
        // print(0,4,8);
        if(ck[k]==false)
        {
          occk++;
        }
        // print(k);
        k+=4;
      }
    }
    if(occk!=3)
    {
      occk=0;
      int k=0;
      for(int j=0;j<=2;j++)
      {
        // print(0,3,6);
        if(ck[k]==false)
        {
          occk++;
        }
        // print(k);
        k+=3;
      }
    }
    if(occk!=3)
    {
      occk=0;
      int k=1;
      for(int j=0;j<=2;j++)
      {
        // print(1,4,7);
        if(ck[k]==false)
        {
          occk++;
        }
        // print(k);
        k+=3;
      }
    }
    if(occk!=3)
    {
      occk=0;
      int k=2;
      for(int j=0;j<=2;j++)
      {
        // print(2,5,8);
        if(ck[k]==false)
        {
          occk++;
        }
        // print(k);
        k+=3;
      }
    }
  }
  if(occk!=3)
  {
    occk=0;
    int k=2;
    for(int j=0;j<=2;j++)
    {
      // print(2,4,6);
      if(ck[k]==false)
      {
        occk++;
      }
      // print(k);
      k+=2;
    }
  }
}
void ox()
{
  occk=0;
  for(int i=0;i<1;i++)
  {
    for(int j=0;j<=2;j++)
    {
      // print(0,1,2);
      if(ck[j]==true)
      {
        occk++;
      }
    }
    if(occk!=3)
    {
      occk=0;
      for(int j=3;j<=5;j++)
      {
        // print(3,4,5);
        if(ck[j]==true)
        {
          occk++;
        }
      }
    }
    if(occk!=3)
    {
      occk=0;
      for(int j=6;j<=8;j++)
      {
        // print(6,7,8);
        if(ck[j]==true)
        {
          occk++;
        }
      }
    }
    if(occk!=3)
    {
      occk=0;
      int k=0;
      for(int j=0;j<=2;j++)
      {
        // print(0,4,8);
        if(ck[k]==true)
        {
          occk++;
        }
        // print(k);
        k+=4;
      }
    }
    if(occk!=3)
    {
      occk=0;
      int k=0;
      for(int j=0;j<=2;j++)
      {
        // print(0,3,6);
        if(ck[k]==true)
        {
          occk++;
        }
        // print(k);
        k+=3;
      }
    }
    if(occk!=3)
    {
      occk=0;
      int k=1;
      for(int j=0;j<=2;j++)
      {
        // print(1,4,7);
        if(ck[k]==true)
        {
          occk++;
        }
        // print(k);
        k+=3;
      }
    }
    if(occk!=3)
    {
      occk=0;
      int k=2;
      for(int j=0;j<=2;j++)
      {
        // print(2,5,8);
        if(ck[k]==true)
        {
          occk++;
        }
        // print(k);
        k+=3;
      }
    }
  }
  if(occk!=3)
  {
    occk=0;
    int k=2;
    for(int j=0;j<=2;j++)
    {
      // print(2,4,6);
      if(ck[k]==true)
      {
        occk++;
      }
      // print(k);
      k+=2;
    }
  }
}