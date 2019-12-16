//CAO NGUYET MINH - LHP - 12CTIN
Const
    fi='PIN.INP';
    fo='PIN.OUT';
Type
    STR = String[5];
Var g,f : Text;
    N,D,i,j : LongInt;
    S : STR;
    Exist : Array[0..37,0..37,0..37,0..37] of Int64;
    Only : Array[0..5] of Int64;
    OK : Array[0..5] of Boolean;
    A : Array[0..5] of LongInt;
    kq : Int64;

Function Chuyen (C : Char) : LongInt;
 Begin
 if (C>='0') and (C<='9') then exit(ORD(C)-47);
 exit(ORD(C)-86);
 End;

Procedure Update;
 Var ii : LongInt;
 Begin
 For ii:=1 to 4 do
  if not OK[ii] then A[ii]:=37 else A[ii]:=Chuyen(S[ii]);
 Exist[A[1],A[2],A[3],A[4]]:=Exist[A[1],A[2],A[3],A[4]]+1;
 End;

Procedure Chay (x,dem : LongInt);
 Begin
 if (x=4) then Begin Update; exit; End;
 OK[x+1]:=false;
 Chay(x+1,dem);
 OK[x+1]:=true;
 Chay(x+1,dem+1);
 End;

Procedure Init;
 Begin
 Assign(f,fi); Reset(f);
 Readln(f,N,D);
 For i:=1 to N do Begin Readln(f,S); Chay(0,0); End;
 Close(f);
 End;

Procedure Try;
 Var i1,i2,i3,i4,cs : LongInt;
     tmp : Int64;
 Begin
 For i1:=1 to 37 do
  For i2:=1 to 37 do
   For i3:=1 to 37 do
    For i4:=1 to 37 do
     Begin
     cs:=4;
     if i1=37 then dec(cs);
     if i2=37 then dec(cs);
     if i3=37 then dec(cs);
     if i4=37 then dec(cs);
     tmp:=Exist[i1,i2,i3,i4];
     tmp:=tmp*(tmp-1);
     tmp:=tmp div 2;
     Only[cs]:=Only[cs]+tmp;
     End;
 if D=1 then kq:=Only[3];
 if D=2 then kq:=Only[2]-3*Only[3];
 if D=3 then kq:=Only[1]-2*Only[2]+3*Only[3];
 if D=4 then kq:=Only[0]-Only[1]+Only[2]-Only[3];
 End;


Procedure Outp;
 Var C : Char;
 Begin
 Assign(g,fo);
 Rewrite(g);
 Write(g,kq);
 Close(g);
 End;

Begin
 Init;
 Try;
 Outp;
End.
