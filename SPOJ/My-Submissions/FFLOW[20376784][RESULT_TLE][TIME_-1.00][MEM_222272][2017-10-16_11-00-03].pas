uses math;
const oo = round(1e18);
type sty = ^node;
     node = record
         v: longint;
         next: sty;
     end;
     nmax = 1..5000;

var n,m,i,u,v,x: longint;
    a: array [nmax] of sty;
    trace: array [nmax] of longint;
    f: array [nmax,nmax] of longint;
    c: array [nmax,nmax] of longint;
    kt: array [nmax,nmax] of boolean;
    fi: text;

procedure addnew(u,v: longint);
  var p,o: sty;
  begin
      new(p);
      p^.v:=v;
      p^.next:=a[u];
      a[u]:=p;

      new(o);
      o^.v:=u;
      o^.next:=a[v];
      a[v]:=o;

      kt[u,v]:=false;
      kt[v,u]:=kt[u,v];
  end;

function find: boolean;
  var first,last,u: longint;
      q: array [nmax] of longint;
      p: sty;
  begin
      fillchar(trace,sizeof(trace),0);
      first:=1; last:=1;
      q[1]:=1;
      trace[1]:=n+1;

      repeat
          u:=q[first]; inc(first);

          p:=a[u];
          while p<>nil do
            begin
                if (trace[p^.v] = 0) and (c[u , p^.v] > f[u , p^.v]) then
                  begin
                      trace[p^.v]:=u;
                      if p^.v = n then exit(true);
                      inc(last); q[last]:=p^.v;
                  end;
                p:=p^.next;
            end;
      until first > last;

      exit(false);
  end;

procedure incmax;
  var u,smin: int64;
      q: sty;
  begin
      smin:=oo;

      u:=n;
      repeat
          smin:= min(smin , c[trace[u],u] - f[trace[u],u]);
          u:=trace[u];
      until u=1;

      u:=n;
      repeat
          inc(f[trace[u],u] , smin);
          dec(f[u,trace[u]] , smin);
          u:=trace[u];
      until u=1;
  end;

function out: int64;
  var p: sty;
  begin
      p:=a[1]; out:=0;
      while p<>nil do
        begin
            inc(out , f[1 , p^.v]);
            p:=p^.next;
        end;
  end;

BEGIN
    assign(fi,''); reset(fi);
    read(fi,n,m);

    fillchar(kt,sizeof(kt),true);
    for i:=1 to m do
      begin
          read(fi,u,v,x);
          if kt[u,v] then
            begin
                addnew(u,v);
                c[u,v]:=x; c[v,u]:=x;
            end
          else begin
                   inc(c[u,v],x);
                   inc(c[v,u],x);
               end;
      end;

    while find do incmax;

    writeln(out);
END.
