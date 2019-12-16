type Plist = ^data;
     data = record
       x: longint;
       ne: Plist;
     end;

var first, newp, last: Plist;
    n,s,i: longint;

procedure init(n,s,j: longint);
  var i: longint;
  begin
    if j<>1 then
      begin
        newp^.x:=1;
        newp^.ne:=nil;
        first:=newp;
      end;

    for i:=j to n-1 do
      begin
        new(newp);
        newp^.x:=i;
        if first = nil then
                first:=newp
        else last^.ne:=newp;
        last:=newp;
        last^.ne:=nil;
      end;
    new(newp);  newp^.x:=n;
    last^.ne:=newp;
    last:=newp;
    last^.ne:=first;
  end;

function bai2(i: longint): longint;
  var m,j,v: longint;
  begin
    newp:=first;
    for j:=2 to i do
      begin
        newp:=newp^.ne;
      end;
    last:=newp;

    m:=n; v:=1;
    while m>1 do
      begin
        if v=2 then
          begin
            last^.ne:=newp^.ne;
            dispose(newp);
            newp:=last^.ne;
            v:=1; dec(m);
          end
        else
          begin
            last:=newp;
            newp:=newp^.ne;
            v:=2;
          end;
      end;
    exit(newp^.x);
  end;

BEGIN
  write('Nhap n: '); read(n); writeln;
  write('Nhap s: '); read(s); writeln;

  init(n,s,1);
  writeln(bai2(1));

  for i:=1 to n do
    begin
      init(n,s,2);
      if (bai2(i) = s) then begin writeln(i); break; end;
    end;

  readln
END.
