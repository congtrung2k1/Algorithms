COnst   FI='Cola.inp';
        FO='Cola.out';
Var     f:text;
        a,b,d:array[0..1005]of Longint;
        n,m,k,i,j,t:Longint;
        c: char;

Procedure INIT;
Begin
 Assign(f,fi);Reset(f);
 Readln(f,n,m,k);
 For i:=1 to m do d[i]:=k;
 For i:=1 to n do Begin
  Read(f,c);
  Case c of
   'W': Begin
        d[0]:=0; t:=0;
        For j:=1 to n do If d[j]>d[t] then t:=j;
        End;
   'E': Begin
        d[0]:=k+1; t:=0;
        For j:=1 to n do
         If (d[j]>0) and (d[j]<d[t]) then t:=j;
        End;
   End;
   a[i]:=t;
   dec(d[t]);
   End;
  Readln(f);
  For i:=1 to n do Begin
   Read(f,t);
   For j:=1 to n do
    If d[j]=t then Begin d[j]:=-1; b[j]:=i; Break; End;
         End;
  Close(f);
End;

Procedure TRY;
Begin
 Assign(f,fo);Rewrite(f);
 For i:=1 to n do Write(F,b[a[i]],' ');
 Close(f);
End;

Begin
 INIT;
 TRY;
End.
