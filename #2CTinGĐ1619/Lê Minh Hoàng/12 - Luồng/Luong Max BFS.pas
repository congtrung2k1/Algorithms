uses math;
const oo = round(1e18);
type sty = ^node;
     node = record
         v: longint;
         next: sty;
     end;
     nmax = 1..1000;

var n,m,s,t,i,u,v: longint;
    a: array [nmax] of sty;
    trace: array [nmax] of longint;
    f: array [nmax,nmax] of longint;
    c: array [nmax,nmax] of longint;
    fi: text;

procedure addnew(u,v: longint);
  var p: sty;
  begin
      new(p);
      p^.v:=v;
      p^.next:=a[u];
      a[u]:=p;
  end;

function find: boolean;
  var first,last,u: longint;
      q: array [nmax] of longint;
      p: sty;
  begin
      fillchar(trace,sizeof(trace),0);
      first:=1; last:=1;
      q[1]:=s;
      trace[s]:=n+1;

      repeat
          u:=q[first]; inc(first);

          p:=a[u];
          while p<>nil do
            begin
                if (trace[p^.v] = 0) and (c[u,p^.v] > f[u,p^.v]) then
                  begin
                      trace[p^.v]:=u;
                      if p^.v = t then exit(true);
                      inc(last); q[last]:=p^.v;
                  end;
                p:=p^.next;
            end;
      until first > last;

      exit(false);
  end;

procedure incmax;
  var u,smin: int64;
  begin
      u:=t;
      smin:= oo;
      repeat
          smin:= min(smin , c[trace[u],u] - f[trace[u],u]);
          u:=trace[u];
      until u=s;

      u:=t;
      repeat
          inc(f[trace[u],u] , smin);
          dec(f[u,trace[u]] , smin);
          u:=trace[u];
      until u=s;
  end;

function out: int64;
  var p: sty;
  begin
      p:=a[s]; out:=0;
      while p<>nil do
        begin
            inc(out , f[s , p^.v]);
            p:=p^.next;
        end;
  end;

BEGIN
    assign(fi,''); reset(fi);
    read(fi,n,m,s,t);
    for i:=1 to m do
      begin
          read(fi,u,v,c[u,v]);
          addnew(u,v);
      end;

    fillchar(f,sizeof(f),0);
    while find do incmax;

    writeln(out);
END.