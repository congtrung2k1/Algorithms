CONST FI='DANCE.INP';
      FO='DANCE.OUT';

TYPE TLIST= ARRAY [0..20005] OF LONGINT;
VAR N,NAM,NU,ANS,K: LONGINT;
    A,B,C: TLIST;
    F: TEXT;


Procedure Init;
 Var i,J: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Readln(F,n,k);
 Nam:=0; Nu:=0;
 For i:=1 to n do Read(F,C[i]);
 Readln(F);
 For i:=1 to n do
  Begin
  Read(f,j);
  If C[i]=1 then Begin Inc(Nu); A[nu]:=j; end
   Else Begin Inc(Nam); B[Nam]:=j; end;
  End;
 Close(F);
 End;

procedure qsort(var a : tlist;MI,MA: LONGINT);
    procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2];
         repeat
           while a[i]<x do
            inc(i);
           while x<a[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;

    begin
       sort(mi,ma);
    end;

Procedure Try;
 VAR I,J: Longint;
 Begin
 QSort(A,1,Nu); QSort(B,1,Nam);
 i:=1; j:=1;
 Repeat
 If (A[j]>B[i]) Then inc(i) else
  If (B[i]-A[j]<=K) And (B[i]-A[j]>=0) Then
   Begin Inc(Ans); Inc(i); Inc(j); End else Inc(j);
 Until (j>nu) or (i>nam);
 Assign(f,fo); Rewrite(F);
 Writeln(f,Ans);
 Close(F);
 End;

Begin
 Init;
 Try;
End.
