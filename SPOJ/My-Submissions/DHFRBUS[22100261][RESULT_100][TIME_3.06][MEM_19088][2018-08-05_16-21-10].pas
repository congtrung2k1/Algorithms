const fi = '';
      oo = 2000000000000;
type sty = record
         v,g,link: int64;
     end;
     mang = record
          q,w: int64;
     end;

var a: array [0..2*100000] of sty;
    heap: array [0..2*100000] of mang;
    head: array [0..2*100000] of int64;
    d,pos: array [0..100000,0..5] of int64;
    n,k,s,t,nheap: longint;

procedure hv(var a,b: int64);
  var t: int64;
  begin
      t:=a; a:=b; b:=t;
  end;

procedure up(i: longint);
  begin
      if (i<=1) or (d[heap[i div 2].q, heap[i div 2].w] <= d[heap[i].q, heap[i].w]) then exit;
      hv(heap[i div 2].q , heap[i].q);
      hv(heap[i div 2].w , heap[i].w);
      hv(pos[heap[i div 2].q , heap[i div 2].w] , pos[heap[i].q , heap[i].w]);
      if i div 2 > 1 then up(i div 2);
  end;

procedure down(i: longint);
  var j: longint;
  begin
      j:=2*i;
      if j > nheap then exit;
      if j < nheap then
        if d[heap[j].q , heap[j].w] > d[heap[j+1].q , heap[j+1].w] then inc(j);
      if d[heap[j].q , heap[j].w] >= d[heap[i].q , heap[i].w] then exit;
      hv(heap[i].q , heap[j].q);
      hv(heap[i].w , heap[j].w);
      hv(pos[heap[i].q , heap[i].w] , pos[heap[j].q , heap[j].w]);
      down(j);
  end;

procedure update(u,x: longint);
  var p: longint;
  begin
      p:=pos[u,x];
      if p = 0 then
        begin
            inc(nheap);
            heap[nheap].q:=u;
            heap[nheap].w:=x;
            pos[u,x]:=nheap;
            p:=nheap;
        end;
      up(p);
  end;

procedure getmin(var u,x: longint);
  begin
      if nheap=0 then begin
                         u:=0; x:=0;
                         exit;
                     end;
      u:=heap[1].q; x:=heap[1].w;
      heap[1]:=heap[nheap];
      pos[u,x]:=1;
      dec(nheap);
      down(1);
  end;

procedure dij;
  var u,x,i,v,val: longint;
      ans: int64;
  begin
      fillchar(pos,sizeof(pos),0);
      for u:=1 to n do
        for x:=0 to k do d[u,x]:=oo;

      nheap:=0;
      d[s,0]:=0;
      update(s,0);
      repeat
          getmin(u,x);
          if u=0 then break;
          i:=head[u];
          while i<>0 do
            begin
                v:=a[i].v; val:=a[i].g;
                if d[v,x] > d[u,x] + val then
                  begin
                      d[v,x]:=d[u,x] + val;
                      update(v,x);
                  end;

                if (x<k) and (d[v,x + 1] > d[u,x]) then
                  begin
                      d[v,x + 1]:=d[u,x];
                      update(v,x+1);
                  end;

                i:=a[i].link;
            end;
      until nheap=0;

      ans:=oo;
      for x:=0 to k do
        if d[t,x]<ans then ans:=d[t,x];
      writeln(ans);
  end;

procedure hadd(i,u,v,x: int64);
  begin
      a[i].v:=v;
      a[i].g:=x;
      a[i].link:=head[u];
      head[u]:=i;
  end;

procedure init;
  var i,m,c,u,v,x: longint;
      f: text;
  begin
      assign(f,fi); reset(f);
      read(f,n,m,k,s,t);
      c:=0;
      for i:=1 to m do
        begin
            read(f,u,v,x);
            hadd(c+1,u,v,x);
            hadd(c+2,v,u,x);
            inc(c,2);
        end;
  end;

BEGIN
    init;
    dij;
END.
