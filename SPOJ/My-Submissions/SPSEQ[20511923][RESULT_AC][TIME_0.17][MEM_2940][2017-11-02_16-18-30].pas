uses math;
const fi = '';
      fo = '';
      nmax = 100001;
var a,b,c,q,w,h: array [1..nmax] of longint;
    n,m,i,cnt,l,r,ans: longint;
    f: text;

procedure sort(l,r: longint);
  var i,j,x,t: longint;
  begin
      i:=l; j:=r; x:=a[(l+r) div 2];
      repeat
          while a[i] < x do inc(i);
          while x < a[j] do dec(j);
          if not(i>j) then
            begin
                t:=a[i]; a[i]:=a[j]; a[j]:=t;
                t:=b[i]; b[i]:=b[j]; b[j]:=t;
                inc(i); dec(j);
            end;
      until i>j;
      if l<j then sort(l,j);
      if i<r then sort(i,r);
  end;

BEGIN
    assign(f,fi); reset(f);
    read(f,n);
    for i:=1 to n do read(f,a[i]); close(f);
    for i:=1 to n do b[i]:=i;
    sort(1,n);
    c[b[1]]:=1; m:=1;
    for i:=2 to n do
       begin
           if a[i-1] < a[i] then inc(m);
           c[b[i]]:=m;
       end;

    cnt:=1; h[1]:=c[1]; q[1]:=1;
    for i:=2 to n do
      if h[cnt] < c[i] then begin inc(cnt); h[cnt]:=c[i]; q[i]:=cnt; end
      else begin
               l:=1; r:=cnt;
               while l<r do
                 begin
                     m:=(l+r) div 2;
                     if h[m] < c[i] then l:=m+1 else r:=m;
                 end;
               h[l]:=c[i]; q[i]:=l;
           end;

    for i:=1 to n div 2 do
      begin
          m:=c[i]; c[i]:=c[n-i+1]; c[n-i+1]:=m;
      end;

    cnt:=1; h[1]:=c[1]; w[1]:=1;
    for i:=2 to n do
      if h[cnt] < c[i] then begin inc(cnt); h[cnt]:=c[i]; w[i]:=cnt; end
      else begin
               l:=1; r:=cnt;
               while l<r do
                 begin
                     m:=(l+r) div 2;
                     if h[m] < c[i] then l:=m+1 else r:=m;
                 end;
               h[l]:=c[i]; w[i]:=l;
           end;

    ans:=0;
    for i:=1 to n do
      ans:=max(ans, 2*min(q[i],w[n-i+1])-1);

    assign(f,fo); rewrite(f); writeln(f,ans); close(f);
END.
