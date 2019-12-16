const max = 100000;
type Plist = ^data;
     data = record
       x: longint;
       link: Plist;
     end;

var top: plist;
    i: longint;

procedure push(v: longint);
  var newp: plist;
  begin
    new(newp); newp^.x:=v; newp^.link:=top;                        // tao nut moi (next)
    top:=newp;                                                    // top <- nut ms
  end;

function pop: longint;
  var newp: plist;
  begin
    if top = nil then writeln('Stack is empty')
    else
      begin
        pop:=top^.x;                                            // lay gtri
        newp:=top^.link;                                        // luu nut trc do
        dispose(top); top:=newp;                                //  giai phong bo nho va cap nhat top
      end;
  end;

BEGIN
  writeln('Stack by LIFO');
  randomize;

  top:=nil;                             // khoi tao

  for i:=1 to 10 do
      push(random(100)+1);

  for i:=1 to 10 do
      writeln(pop);


  readln;
END.