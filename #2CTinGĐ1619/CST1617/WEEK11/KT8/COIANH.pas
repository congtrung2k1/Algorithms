//CAO NGUYET MINH TEAM 1
Uses Math;
CONST FI='COIANH.INP';
      FO='COIANH.OUT';

VAR H: ARRAY [0..500000] OF LONGINT;
    N,A,B,T,Ans: LONGINT;
    Hi: ARRAY [0..500000] OF CHAR;
    Xet: ARRAY [0..500005] OF BOOLEAN;
    Free: ARRAY [0..500000,'h'..'w',0..2] OF BOOLEAN;
    F: TEXT;
 //1 w 2 h
Procedure Init;
 Var i: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(F,n,a,b,t);
 For i:=1 to n do Read(f,Hi[i]);
 Close(F);
 End;


Procedure DFS(X,Sum,Thoigian: Longint; Huong: Char; Chieu: Longint);
 Var Y,i,tmp: Longint;
 Begin
 If Free[x,Huong,Chieu]=False then exit;
 Free[X,Huong,Chieu]:=False;
 If (Thoigian<=T) then
  Begin Tmp:=0;
  For i:=1 to n do If Xet[i] then inc(tmp);
  Ans:=Max(Ans,tmp);
  End;
 If (Thoigian>T) Or (Sum>=N) then exit;
 If X+1>N then Y:=1 else Y:=X+1;
 If Free[Y,Huong,1] then
  If Huong<>Hi[Y] Then
   Begin Xet[y]:=True; DFS(Y,Sum+1,Thoigian+1+B+A,Hi[y],1); Xet[y]:=False; End
    Else Begin Xet[y]:=True; DFS(Y,Sum+1,Thoigian+A+1,Huong,1); Xet[y]:=False; End;//else
 //  iF Not Free[Y,Huong] Then DFS(Y,Sum,Thoigian,Huong);
 IF X-1<1 then Y:=N else Y:=x-1;
 If Free[Y,Huong,2] then
  If Huong<>Hi[Y] Then
    Begin Xet[y]:=True; DFS(Y,Sum+1,Thoigian+1+B+A,Hi[y],2); Xet[y]:=False; End
     Else Begin Xet[y]:=True; DFS(Y,Sum+1,Thoigian+A+1,Huong,2); Xet[y]:=False; End;// else
 //  IF Not Free[Y,Huong] Then DFS(Y,Sum,Thoigian,Huong);
 End;

Procedure Try;
 Var I: Longint;
 Begin
 Ans:=0;
 Fillchar(Xet,sizeof(xet),False);
 Fillchar(Free,sizeof(Free),True);
// Free[1,'h']:=False;
 //Xet[1]:=True;
 Xet[1]:=True; Ans:=0;
 If Hi[i]='h' then DFS(1,1,1,'h',0) else DFS(1,1,1+B,'w',0);
 Assign(f,fo); REwrite(F);
 Writeln(f,Ans);
 Close(F);
 End;


Begin
 Init;
 Try;
End.
