uses math;
type mang = array [1..40001] of int64;
var heap,a,b: mang;
    m,n,k,i,j,top: longint;

procedure qsort(var a: mang; l,r: longint);
  var i,j,x,t: longint;
  begin
      i:=l; j:=r; x:=a[(l+r) div 2];
      repeat
          while a[i] < x do inc(i);
          while a[j] > x do dec(j);
          if not(i>j) then
            begin
                t:=a[i]; a[i]:=a[j]; a[j]:=t;
                inc(i); dec(j);
            end;
      until i>j;
      if l<j then qsort(a,l,j);
      if i<r then qsort(a,i,r);
  end;

procedure init;
  var i: longint;
  begin
      read(m,n,k);
      for i:=1 to m do read(a[i]);
      for i:=1 to n do read(b[i]);
      qsort(a,1,m); qsort(b,1,n);
  end;

procedure push(x: longint);
  var i,j: longint;
  begin
      inc(top); heap[top]:=x;

      i:=top;
      while i div 2 >= 1 do
        begin
            j:=i div 2;
            if heap[j] > x then break;
            heap[i]:=heap[j];
            i:=j;
        end;
      heap[i]:=x;
  end;

procedure pop;
  var i,j,x: longint;
  begin
      heap[1]:=heap[top];
      dec(top);

      i:=1; x:=heap[1];
      while i*2 <= top do
        begin
            j:=i*2;
            if (heap[j] > heap[j+1]) and (j<top) then inc(j);
            if heap[j] > x then break;
            heap[i]:=heap[j];
            i:=j;
        end;
      heap[i]:=x;
  end;

BEGIN
    init;

    top:=0;
    for i:=1 to m do
      begin
          if (top = k) and (a[i]+b[1] >= heap[1]) then break;

          for j:=1 to n do
            if (top = k) then
                if (a[i] + b[j] >= heap[1]) then break
                else begin push(a[i]+b[j]); pop; end
            else push(a[i]+b[j]);
      end;

    qsort(heap,1,top);
    for i:=1 to k do writeln(heap[i]);
END.