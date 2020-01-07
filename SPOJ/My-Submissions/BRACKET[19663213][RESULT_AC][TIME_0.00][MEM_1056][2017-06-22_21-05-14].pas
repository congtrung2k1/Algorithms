uses math;

const fi = '';

var t: array [1..61,0..30,0..30] of int64;
    n,k,d: longint;
    ans: int64;
    s: string;

procedure init;
  var f: text;
  begin
      assign(f,fi); reset(f);
      read(f,n,k);  readln(f);
      readln(f,s);
  end;

function tinh(i,d,ba: longint): int64;
  var re: int64;
  begin
      if t[i,d,ba]<>-1 then exit(t[i,d,ba]);
      if (i>n) then
        if(d=0) and (ba=k) then exit(1) else exit(0);

      re:=0;
      if d<k then re:=re + tinh(i+1, d+1, max(ba,d+1));
      if d>0 then re:=re + tinh(i+1, d-1, max(ba,d-1));

      t[i,d,ba]:=re;
      exit(re);
  end;

procedure find(i,d,ba: longint);
  begin
      if i>n then
        begin
            inc(ans);
            writeln(ans);
            halt;
        end;

      if s[i]='(' then find(i+1, d+1, max(ba,d+1))
      else  ans:=ans + tinh(i+1, d+1, max(ba,d+1));

      if s[i]=')' then find(i+1, d-1, max(ba,d-1));
  end;

BEGIN
    init;
    fillchar(t,sizeof(t),255);
    writeln(tinh(1,0,0));

    ans:=0;
    find(1,0,0);
END.