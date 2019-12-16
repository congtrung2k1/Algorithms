CONST FI='SVEMIR.INP';
      FO='SVEMIR.OUT';
TYPE LIST= RECORD U,V,C: LONGINT; END;
     ARR=ARRAY[0..100005] OF LONGINT;
     ARR1=ARRAY[0..300005] OF LIST;
VAR X,Y,Z,ID1,ID2,ID3,P:ARR;
    DSC: ARR1;
    N,ANS,T: LONGINT;
    F: TEXT;


Procedure Init;
 Begin
 assign(f,fi); Reset(F);
 Readln(f,n);
 For n:=1 to n do
  Readln(f,x[n],y[n],z[n]);
 Close(F);
 End;

Procedure Swap(Var X,Y: Longint);
 Var tmp: Longint;
 Begin
 Tmp:=X; X:=Y; Y:=Tmp;
 End;

Procedure Qsort(Var a,b: Arr);
 procedure sort(l,r: longint);
 var i,j,x,y: longint;
 begin
 i:=l; j:=r;
 x:=a[b[(l+r) div 2]];
 repeat
 while a[b[i]]<x do inc(i);
 while x<a[b[j]] do dec(j);
 if not(i>j) then begin
              //  swap(a[i],a[j]);
                Swap(b[i],b[j]);
                inc(i); dec(j);
                end;
 until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
 end;
  Begin
  sort(1,n);
  End;


Procedure QSort1(Var a: Arr1);
procedure sort1(l,r: longint);
 var i,j,x: longint;
     y: List;
 begin
 i:=l; j:=r;
 x:=a[(l+r) div 2].c;
 repeat
 while a[i].c<x do inc(i);
 while x<a[j].C do dec(j);
 if not(i>j) then begin
                y:=a[i]; a[i]:=a[j]; a[j]:=y;
                inc(i); dec(j);
                end;
 until i>j;
 if l<j then sort1(l,j);
 if i<r then sort1(i,r);
 end;
 Begin
 Sort1(1,n);
 End;

Function Union(i:longint):Boolean;
Var u,v:longint;
Begin
 u:=dsc[i].u;
 v:=dsc[i].v;
 While u<>p[u] do u:= p[u];
 While v<>p[v] do v:= p[v];
 If(u=v) then Exit(False);
 If(u>v) then p[u]:=v Else p[v]:=u;
 Exit(True);
End;

Procedure Try;
 Var i,U,V: Longint;
 Begin
 For i:=1 to n do Begin
  id1[i]:=i; Id2[i]:=i; Id3[i]:=i; P[i]:=i; End;
 QSort(x,id1); QSort(y,id2); QSort(z,id3); T:=0;
 For i:=1 to n-1 do
  Begin
  Inc(t);
  dsc[t].u:=id1[i];
  dsc[t].v:=id1[i+1];
  dsc[t].c:=x[dsc[t].v]-x[dsc[t].u];
  Inc(t);
  dsc[t].u:=id2[i]; dsc[t].v:=id2[i+1]; dsc[t].c:=y[dsc[t].v]-y[dsc[t].u];
  Inc(t);
  dsc[t].u:=id3[i]; dsc[t].v:=id3[i+1]; dsc[t].c:=z[dsc[t].v]-z[dsc[t].u];
  End;
 N:=T;
 QSort1(dsc); T:=0;
 For i:=1 to n do
  If Union(i) then
   Begin
   Ans:=Ans+DSC[i].C;
   Inc(T);
   If T=n-1 then break;
   end;
 Assign(f,fo); Rewrite(F);
 Writeln(f,Ans);
 Close(F);
 End;



Begin
 Init;
 Try;
End.

