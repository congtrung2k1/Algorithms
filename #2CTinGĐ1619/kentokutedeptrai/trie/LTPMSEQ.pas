uses math;
type sty = ^trie;
     trie = record
          check: boolean;
          c: array ['A'..'z'] of sty;
     end;

var root: sty;
    s: string;
    k: boolean;
    n,i: longint;

procedure addnew(var a: sty);
  var i: char;
  begin
      new(a);
      a^.check:=false;
      for i:='A' to 'z' do a^.c[i]:=nil;
  end;

procedure add;
  var i: longint; p: sty;
  begin
      p:=root;
      for i:=1 to length(s) do
        begin
            if p^.c[s[i]]=nil then addnew(p^.c[s[i]]);
            p:=p^.c[s[i]];
            p^.check:=not(p^.check);
        end;
  end;

procedure find(p: sty);
  var i: char;
  begin
      for i:='A' to 'z' do
        if (p^.c[i]<>nil) then
          if p^.c[i]^.check then
            begin
                k:=true;
                write(i);
                find(p^.c[i]);
            end;
  end;

BEGIN
    readln(n);
    addnew(root);
    for i:=1 to n do
      begin
          readln(s);
          add;
      end;
    k:=false;
    find(root);
    if k=false then writeln(-1) else writeln;
END.