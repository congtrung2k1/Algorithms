const fin='chiphi.inp';
      fout='chiphi.out';

var  f,g:text;
     c:array[1..250,1..250] of qword;
     trace,t:array[1..250] of longint;
     n,m,i,dau,cuoi,luu,a,b,l,r,max,j:longint;

procedure floyd;
var k,u,v:longint;
begin
     for k:=1 to n do
       for u:=1 to n do
        for v:=1 to n do
         begin
          if c[u,v]<>maxlongint then
          trace[v]:=u;
          if (c[u,k]+c[k,v]<c[u,v]) then
           begin
             trace[v]:=k;trace[k]:=u;
             c[u,v]:=c[u,k]+c[k,v];
           end;
         end;
end;

procedure solve;
begin
     assign(f,fin); reset(f);
     assign(g,fout); rewrite(g);
     readln(f,n,m,r);
     for i:=1 to n do readln(f,t[i]);
     for i:=1 to n do
       for j:=1 to n do c[i,j]:=maxlongint;
     for i:=1 to m do
       begin
         readln(f,a,b,l);
         if (l<c[a,b]) then
           begin
             c[a,b]:=l; c[b,a]:=l;
           end;
       end;
     floyd;
     for i:=1 to r do
       begin
         readln(f,dau,cuoi);
         luu:=cuoi;
         max:=t[cuoi];
         repeat
            if t[trace[luu]]>max then max:=t[trace[luu]];
            luu:=trace[luu];
         until luu=dau;
         if t[dau]>max then max:=t[dau];
         writeln(g,max+c[dau,cuoi]);
       end;
     close(f); close(g);
end;

begin
     solve;
end.
