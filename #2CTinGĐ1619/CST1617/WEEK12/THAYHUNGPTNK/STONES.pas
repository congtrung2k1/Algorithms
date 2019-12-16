CONST FI='STONES.INP';
      FO='STONES.OUT';

VAR HEAP: ARRAY [0..20000,0..20000] OF LONGINT;
    N,M: LONGINT;
    F,G: TEXT;

Procedure Swap(Var x,y:Longint);
 Var temp:Longint;
 Begin
  temp:=x; x:=y; y:=temp;
 End;

Procedure UpHeap(x,i:Longint);
 Begin
  If (i=1) or (Heap[x,i] > Heap[x,i div 2]) then Exit;
  Swap(Heap[x,i],Heap[x,i div 2]);
  UpHeap(x,i div 2);
 End;

Procedure DownHeap(x,i:Longint);
 Var j:Longint;
 Begin
  j:=i*2;
  If j>Heap[x,0] then Exit;
  If (j < Heap[x,0]) and (Heap[x,j] > Heap[x,j+1]) then Inc(j);
  If Heap[x,i] > Heap[x,j] then
  Begin
   Swap(Heap[x,i],Heap[x,j]);
   DownHeap(x,j);
  End;
 End;

Procedure Push(x,c:Longint);
 Begin
  Inc(Heap[x,0]);
  Heap[X,Heap[x,0]]:=c;
  UpHeap(x,Heap[x,0]);
 End;

Function Pop(x,v:Longint):Longint;
 Begin
  Pop:=Heap[x,v];
  Heap[x,v]:=Heap[x,Heap[x,0]];
  Dec(Heap[x,0]);
  DownHeap(x,v);
 End;

Procedure Try;
 Var Ma,i,u: Longint;
 Begin
 Ma:=-Maxlongint;
 For i:=1 to n do
  If Ma<Heap[i,1] Then Begin Ma:=Heap[i,1]; u:=i; End;
 Writeln(g,ma);
 Pop(u,1);
 end;

Procedure Init;
 Var k,u,c,i: Longint;
 Begin
 Assign(f,fi); Reset(F);
 Assign(g,fo); Rewrite(g);
 Readln(f,m,n);
 for i:=1 to n do Heap[i,0]:=0;
 For m:=1 to m do
  Begin
  Read(f,k);
  If k=1 then begin Readln(f,u,c); Push(u,c); End
   Else Begin Readln(F); Try; End;
  End;
 Close(F); Close(G);
 End;

Begin
 Init;
End.
