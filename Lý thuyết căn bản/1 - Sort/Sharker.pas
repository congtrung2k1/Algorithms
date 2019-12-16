var A: array [1..100000] of longint;
    n,i,k,t,left,right: longint;

BEGIN
  readln(n);
  for i:=1 to n do readln(A[i]);

  left:=1; right:=n; k:=n;                                          // khoi tao
  while left<right do
    begin                                                           // duyet tu cuoi mang
      for i:= right downto left+1 do                                // dua so nho len dau
        if A[i]<A[i-1] then
          begin
            t:=A[i]; A[i]:=A[i-1]; A[i-1]:=t;
            k:=i;                                                   // luu vi tri
          end;
      left:=k;                                                      // thu hep gioi han

      for i:=left to right-1 do                                     // duyet tu dau mang
        if A[i]>A[i+1] then                                         // dua so to ve cuoi
          begin
            t:=A[i]; A[i]:=A[i+1]; A[i+1]:=t;
            k:=i;
          end;
      right:=k;                                                     // thu hep gioi han
    end;

  for i:=1 to n do writeln(A[i]);
END.
