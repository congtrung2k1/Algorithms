CONST FI='SUM2ARR.INP';
      FO='SUM2ARR.OUT';
Type arr= ARRAY [1..20005] OF LONGINT;
VAR A,B,HEAP: arr;
    N,NHEAP,K,M: LONGINT;
    F: TEXT;


PROCEDURE INIT;
 BEGIN
 ASSIGN(F,FI); RESET(F);
 Readln(f,m,n,k);
 For m:=1 to m do read(F,a[m]);
 Readln(F);
 For n:=1 to n do read(F,b[n]);
 Close(F);
 End;

Procedure Swap(var x,y: longint);
 Var tmp: longint;
 Begin
 tmp:=x; x:=y; y:=tmp;
 end;

Procedure Upheap(x: longint);
 Var y: longint;
 Begin
 If (x=1) or (heap[x]<heap[x div 2]) then exit;
 y:=x div 2;
 swap(heap[y],heap[x]);
 Upheap(y);
 End;

PRocedure Downheap(x: longint);
 Var y: longint;
 Begin
 y:=x*2;
 If y>nheap then exit;
 If (heap[y]<heap[y+1]) and (y<nheap) then inc(y);
 If heap[y]>heap[x] then
 begin swap(heap[y],heap[x]);
 Downheap(y);
 end;
 End;

procedure sort(var a: arr; l,r: longint);
 var i,j,x,y: longint;
 begin
 i:=l; j:=r;
 x:=a[(l+r) div 2];
 repeat
 while a[i]<x do inc(i);
 while x<a[j] do dec(j);
 if not(i>j) then begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                inc(i);
                j:=j-1;
             end;
 until i>j;
 if l<j then sort(a,l,j);
 if i<r then sort(a,i,r);
 end;

Function Pop: longint;
 Begin
 pop:=heap[1];
 heap[1]:=heap[nheap];
 dec(nheap);
 downheap(1);
 End;

PRocedure Push(x: longint);
 Begin
 inc(nheap);
 heap[nheap]:=x;
 Upheap(nheap);
 End;

Procedure Try;
 Var i,j: longint;
 Begin
 Assign(F,FO); RewritE(F);
 Sort(a,1,m); sort(b,1,n);
 nheap:=0;
 For i:=1 to m do
  begin
  if nheap=k then if a[i]+b[1]>=heap[1] then break;
  For j:=1 to n do
   if (nheap=k) then begin
    if (a[i]+b[j]>=heap[1]) then break
     else begin push(a[i]+b[j]); pop; end;
   end else push(a[i]+b[j]);
  end;
 Sort(heap,1,nheap);
 For k:=1 to k do writeln(f,heap[k]);
 Close(F);
 End;

Begin
 Init;
 Try;
End.