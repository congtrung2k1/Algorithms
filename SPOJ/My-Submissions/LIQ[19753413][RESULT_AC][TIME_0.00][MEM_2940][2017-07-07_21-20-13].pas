uses math;

var a,b,c,new,f,t: array [1..100000] of longint;
    n,i,ans: longint;

procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l; j:=r;
         x:=b[(l+r) div 2];
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

function get(x: longint): longint;
  var re: longint;
  begin
      re:=0;
      if x=0 then exit(0);
      while x>0 do
        begin
            re:=max(re,T[x]);
            x:=x - (x and -x);
        end;
      exit(re);
  end;

procedure update(x,val: longint);
  begin
      while x<=n do
        begin
            T[x]:=max(T[x], val);
            x:= x + (x and -x);
        end;
  end;

BEGIN
    read(n);
    for i:=1 to n do read(A[i]);
    for i:=1 to n do b[i]:=a[i];
    for i:=1 to n do c[i]:=i;

    sort(1,n);
    ans:=1; new[c[1]]:=ans;
    for i:=2 to n do
      begin
          if b[i-1] < b[i] then inc(ans);
          new[c[i]]:=ans;
      end;

    ans:=0;
    for i:=1 to n do
      begin
          f[i]:=get(new[i]-1) + 1;
          update(new[i], f[i]);
          ans:=max(ans,f[i]);
      end;

    writeln(ans);
END.