uses math;
type sty = ^trie;
     trie = record
          long,count: longint;
          c: array ['a'..'z'] of sty;
     end;
var root: sty;
    n,i: longint;
    s: ansistring;

procedure addnew(var a: sty);
  var i: char;
  begin
      new(a);
      a^.count:=0; a^.long:=0;
      for i:='a' to 'z' do a^.c[i]:=nil;
  end;

procedure add(s: string);
  var p: sty;
      i: longint; 
  begin
      p:=root;
      for i:=1 to length(s) do
        begin
            if p^.c[s[i]]=nil then addnew(p^.c[s[i]]);
            p:=p^.c[s[i]];
        end;
      p^.count:=1;
  end;

procedure dfs(a: sty);
  var i: char;
  begin
      a^.long:=0;
      for i:='a' to 'z' do
        if a^.c[i]<>nil then
          begin
              dfs(a^.c[i]);
              a^.long:=max(a^.long,a^.c[i]^.long);
          end;
      inc(a^.long,a^.count);
  end;

BEGIN
    readln(n);
    addnew(root);
    for i:=1 to n do
      begin
          readln(s);
          add(s);
      end;
    dfs(root);
    writeln(root^.long);
END.