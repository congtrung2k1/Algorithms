const dd = 1000000007;
var a,b,c,t,sl: array [1..4*1000000] of int64;
    n,count,val,max: int64;
    i: longint;

procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l; j:=r; x:=b[(l+r) div 2];
         repeat
           while b[i]<x do inc(i);
           while x<b[j] do dec(j);
           if not(i>j) then
             begin
                y:=b[i]; b[i]:=b[j]; b[j]:=y;
                y:=c[i]; c[i]:=c[j]; c[j]:=y;
                inc(i); dec(j);
             end;
         until i>j;
         if l<j then sort(l,j);
         if i<r then sort(i,r);
      end;


procedure get(x: longint);
  begin
      count:=0; val:=0;
      if x=0 then exit;
      while x>0 do
        begin
            if val<T[x] then
              begin
                  val:=T[x];
                  count:=sl[x];
              end
            else if val=t[x] then count:=(count + sl[x] mod dd) mod dd;

            x:= x - (x and -x);
        end;
  end;

procedure update(x,v,l: longint);
  begin
      while x<=4*n do
        begin
            if v > t[x] then
              begin
                  t[x]:=v; sl[x]:=l;
              end
            else if v=t[x] then sl[x]:=(sl[x] + l) mod dd;
            if sl[x]>max then max:=sl[x];
            x:=x + (x and -x);
        end;
  end;

BEGIN
    read(n);
    for i:=1 to n do read(b[i]);
    for i:=1 to n do c[i]:=i;

    sort(1,n);
    count:=1; a[c[1]]:=1;
    for i:=2 to n do
      begin
           if b[i-1]<b[i] then inc(count);
           a[c[i]]:=count;
      end;

    max:=0;
    for i:=1 to n do
      begin
          get(a[i]-1);
          inc(val);
          if count=0 then inc(count);
          update(a[i], val, count);
      end;

    writeln(max);
END.