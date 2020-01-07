uses math;

type sty = record
         g,o,c: longint;
     end;
var it: array [0..4*100000] of sty;
    leaf: array [1..100000] of longint;
    n,m,i,x,u,v: longint;
    tmp: char;
    s: ansistring;

function up(a,b: sty): sty;
  var t: sty; tmp: longint;
  begin
      tmp:=min(a.o , b.c);

      t.g:=a.g + b.g + tmp;
      t.o:=a.o + b.o - tmp;
      t.c:=a.c + b.c - tmp;
      exit(t);
  end;

procedure build(i,l,r: longint);
  var mid: longint;
  begin
      if (l=r) then
        begin
            it[i].g:=0; it[i].o:=0; it[i].c:=0;
            if s[l]='(' then it[i].o:=1 else it[i].c:=1;
            leaf[l]:=i;
            exit;
        end;
      mid:=(l+r) div 2;
      build(2*i,l,mid);
      build(2*i+1,mid+1,r);
      it[i]:=up(it[2*i] , it[2*i+1]);
  end;

procedure update(i: longint; c: char);
  var x: longint;
  begin
      x:=leaf[i];
      it[x].o:=0; it[x].c:=0;
      if c='(' then it[x].o:=1 else it[x].c:=1;

      x:=x div 2;
      while x>0 do
        begin
            it[x]:=up(it[2*x] , it[2*x+1]);
            x:=x div 2;
        end;
  end;

function query(i,l,r: longint): sty;
  var mid: longint;
  begin
      if (r < u) or (v < l) then exit(it[0]);
      if (u <= l) and (r <= v) then exit(it[i]);

      mid:=(l+r) div 2;
      exit(up(query(2*i, l, mid) , query(2*i+1,mid+1,r)));
  end;

BEGIN
    readln(n,m);
    readln(s);

    build(1,1,n);

    for i:=1 to m do
      begin
          read(x);
          if x=0 then
            begin
                read(x,tmp,tmp);
                update(x,tmp);
            end
          else begin
                   read(u,v);
                   if 2*query(1,1,n).g = (v-u+1) then write(1) else write(0);
               end;
      end;
END.