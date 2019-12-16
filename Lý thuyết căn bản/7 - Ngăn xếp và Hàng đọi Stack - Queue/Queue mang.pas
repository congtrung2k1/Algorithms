const max = 1000;
var A: array [1..max] of longint;
    front, rear: longint;

procedure push(v: longint);
  begin
    if rear=max then writeln('Queue is full')	//kt ptu day
    else
      begin
        inc(rear);
        A[rear]:=v;
      end;
  end;

function pop: longint;
  begin
    if front>rear then writeln('Queue is empty')	//kt ptu trong
    else
      begin
        pop:=A[front];
        inc(front);
      end;
  end;

BEGIN
  writeln('Queue by Array');

  front:=1; rear:=0;
  randomize;
  while rear<max do		//them gtri vao mang
    begin
      push(random(1000)+1);
    end;
  while front<rear do		//loai bo ptu
    begin	
      writeln(pop);
    end;

  readln;
END.