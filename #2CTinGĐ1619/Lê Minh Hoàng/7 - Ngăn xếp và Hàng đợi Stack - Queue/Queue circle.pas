const max = 1000;
var A: array [0..max-1] of longint;
    i,n,front,rear: longint;

procedure push(v: longint);
  begin
    if n=max then writeln('Full')
    else
      begin
        rear:=(rear+1) mod max;
        A[rear]:=v;
        inc(n);
      end;
  end;

function pop: longint;
  begin
    if n=0 then writeln('Empty')
    else
      begin
        pop:=A[front];
        front:=(front+1) mod max;
        dec(n);
      end;
  end;

BEGIN
  randomize;

  front:=1; rear:=max-1; n:=0;
  for i:=1 to max do
    push(random(1000)+1);
  for i:=1 to max do
    writeln(pop);

  readln
END.