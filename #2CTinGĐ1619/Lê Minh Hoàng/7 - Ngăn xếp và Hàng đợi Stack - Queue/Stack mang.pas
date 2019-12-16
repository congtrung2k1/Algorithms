const max = 100000;
var A: array [0..max] of longint;
    top: longint;
    i,v: longint;

procedure push(v: longint);
  begin
    if top = max then writeln('Stack is full')
    else
      begin
        inc(top); A[top]:=v;
      end;
  end;

function pop: longint;
  begin
    if top=0 then writeln('Stack is full')
    else
      begin
        pop:=A[top]; dec(top);
      end;
  end;

BEGIN
  writeln('Stack Point');
  randomize;

  top:=0;                                          // khoi tao

  for i:=1 to 100 do                            // them ptu random
    begin
      v:=random(1000)+1;
      push(v);
    end;

  for i:=1 to 100 do                            // lay ptu ra
    writeln(pop);

  readln;
END.