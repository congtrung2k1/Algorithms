type sty = ^trie;
     trie = record
          d: longint;
          c: array [0..1] of sty;
     end;

var root: sty;
    s: string;
    k: boolean;
    i: longint;
    n,m,x,dem: int64;

procedure addnew(var a: sty);
  begin
      new(a);
      a^.d:=0;
      a^.c[0]:=nil; a^.c[1]:=nil;
  end;

function getbit(x,j: longint): longint;
  begin
      exit(x shr (j-1) and 1);
  end;

procedure add;
  var p: sty; j,k: longint;
  begin
      p:=root;
      for j:=32 downto 1 do
        begin
            k:=getbit(x,j);
            if p^.c[k]=nil then addnew(p^.c[k]);
            p:=p^.c[k];
        end;
      inc(p^.d);
  end;

procedure find(i,ans: longint; p: sty);
  begin
      if i=0 then
        begin
            inc(dem,p^.d);
            if dem >= x then
              begin
                  writeln(ans);
                  k:=true;
              end;
            exit;
        end;

      if p^.c[1]<>nil then
        find(i-1, ans + 1 shl (i-1), p^.c[1]);

      if k=true then exit;

      if p^.c[0]<>nil then find(i-1, ans, p^.c[0]);
  end;

procedure swap(i: longint; var p: sty);
  var tmp: sty;
      k: longint;
  begin
      k:=getbit(x,i);
      if k=1 then
        begin
            tmp:=p^.c[0]; p^.c[0]:=p^.c[1]; p^.c[1]:=tmp;
        end;
      if p^.c[0]<>nil then swap(i-1,p^.c[0]);
      if p^.c[1]<>nil then swap(i-1,p^.c[1]);
  end;

BEGIN
    read(n,m);

    addnew(root);

    for i:=1 to n do
      begin
          read(x);
          add;
      end;

    readln;
    for i:=1 to m do
      begin
          readln(s);
          if s[1]='F' then
            begin
                delete(s,1,5); val(s,x);
                dem:=0; k:=false;
                find(32,0,root);
            end
          else
            begin
                delete(s,1,4); val(s,x);
                swap(32,root);
            end;
      end;
END.