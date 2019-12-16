var A: array [1..10000] of longint;
    n,r,i,t: longint;

procedure Adjust(root, endnode: longint);
  var key,c: longint;
  begin
    key:= A[root];
    while root*2 <= endnode do
      begin
        c:=root*2;
        if (c < endnode) and (A[c] < A[c+1]) then inc(c);
        if A[c] <= key  then break;
        A[root]:=A[c]; root:=c;
      end;
    A[root]:=key;
  end;

BEGIN
  randomize;
  readln(n);
  for i:=1 to n do A[i]:=random(9)+1;

  for r:=n div 2 downto 1 do Adjust(r,n);
  for i:=n downto 2 do
    begin
      t:=A[1]; A[1]:=A[i]; A[i]:=t;
      Adjust(1,i-1);
    end;

  for i:=1 to n do writeln(A[i]);
END.
