const max = 1000;
type pnode = ^tnode;
     tnode = record
       x: longint;
       link: pnode;
     end;

var Front, rear: pnode;
    i: longint;

procedure push(v: longint);
  var newp: pnode;
  begin
    new(newp); newp^.x:=v; newp^.link:=nil;
    if front=nil then front:=newp
    else rear^.link:=newp;
    rear:=newp;
  end;

function pop: longint;
  var newp: pnode;
  begin
    if front=nil then writeln('Empty')
    else begin
           pop:=front^.x;
           newp:=front^.link;
           dispose(front);
           front:=newp;
         end;
  end;

BEGIN
  writeln('Queue by Point');

  front:=nil;
  randomize;
  for i:=1 to max do
    push(random(1000)-1);

  for i:=1 to max do
    writeln(pop);

  readln
END.
