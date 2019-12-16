var n,i,j,left,right,mid,key: longint;
    A: array [0..10] of longint;

BEGIN
  readln(n);
  for i:=1 to n do readln(A[i]);

  for i:=2 to n do
    begin
      key:=A[i];
      left:=1;
      right:=i-1;

      while left < right do                                          // tim vi tri thich hop
        begin
          mid:=(left+right) div 2;
          if key < A[mid] then right:=mid-1 else left:=mid+1;
        end;

      for j:=i-1 downto left do A[j+1]:=A[j];
      A[mid]:=key;                                                   // chen key
    end;

  writeln;
  for i:=1 to n do writeln(A[i]);
  readln
END.
