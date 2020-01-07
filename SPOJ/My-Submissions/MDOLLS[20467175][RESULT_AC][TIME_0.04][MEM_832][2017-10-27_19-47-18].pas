uses math;
const fi = '';
      fo = '';
var bit: array [1..20001] of longint;
    a,b: array [1..20000] of longint;
    n,ans,i,t,p: longint;
    f,g: text;

procedure sort(l,r: longint);
  var i,j,x,y,t: longint;
  begin
      i:=l; j:=r; x:=a[(l+r) div 2]; y:=b[(l+r) div 2];
      repeat
          while (a[i] < x) or ((a[i]=x) and (b[i] > y)) do inc(i);
          while (x < a[j]) or ((x=a[j]) and (y > b[j])) do dec(j);
          if not (i>j) then
            begin
                t:=a[i]; a[i]:=a[j]; a[j]:=t;
                t:=b[i]; b[i]:=b[j]; b[j]:=t;
                inc(i); dec(j);
            end;
      until i>j;
      if l<j then sort(l,j);
      if i<r then sort(i,r);
  end;

function get(x: longint): longint;
  begin
      get:=0;
      while x > 0 do
        begin
            get:=max(get,bit[x]);
            x:=x - (x and (-x));
        end;
  end;

procedure update(x,v: longint);
  begin
      while x <= 10001 do
        begin
            bit[x]:=max(bit[x],v);
            x:=x + (x and (-x));
        end;
  end;

BEGIN
    assign(f,fi); reset(f);
    assign(g,fo); rewrite(g);

    read(f,t);
    while t>0 do
      begin
          dec(t);

          read(f,n);
          for i:=1 to n do read(f,a[i],b[i]);
          sort(1,n);
          ans:=0;
          fillchar(bit,sizeof(bit),0);
          for i:=n downto 1 do
            begin
                p:=get(b[i])+1;
                ans:=max(ans,p);
                update(b[i],p)
            end;
          writeln(g,ans);
      end;
    close(g);
END.

