uses math;
type sty = ^trie;
     trie = record
          count,pass: longint;
          c: array ['0'..'1'] of sty;
     end;

var root: sty;
    n,m,i,x,j,z: longint;
    s: ansistring;

procedure addnew(var a: sty);
  var i: char;
  begin
      new(a);
      a^.count:=0; a^.pass:=0;
      for i:='0' to '1' do a^.c[i]:=nil;
  end;

procedure add;
  var p: sty;
      i,dem: longint;
  begin
      p:=root;
      for i:=1 to length(s) do
        begin
            if p^.c[s[i]]=nil then addnew(p^.c[s[i]]);
            p:=p^.c[s[i]];
            inc(p^.pass);
        end;
      inc(p^.count);
  end;

function find: longint;
  var dem,i: longint; p: sty;
  begin
      dem:=0;
      p:=root;
      for i:=1 to length(s) do
        begin
            p:=p^.c[s[i]];
            if p=nil then break else inc(dem, p^.count);
        end;

      if p<>nil then inc(dem,p^.pass-p^.count);
      exit(dem);
  end;

BEGIN
    read(m,n);
    addnew(root);
    for i:=1 to m do
      begin
          read(x);
          s:='';
          for j:=1 to x do
            begin
                read(z);
                s:=s + chr(z+48);
            end;
          add;
      end;

    for i:=1 to n do
      begin
          read(x);
          s:='';
          for j:=1 to x do
            begin
                read(z);
                s:=s + chr(z+48);
            end;
          writeln(find);
      end;
END.