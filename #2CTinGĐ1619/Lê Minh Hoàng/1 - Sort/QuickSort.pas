var A: array [1..10000] of longint;
    n,i: longint;

procedure sort(l,r: longint);
  var i,j,t,mid: longint;
  begin
    i:=l; j:=r;
    mid:=random(r)+l;                                                   // chon chot chia mang

    while i<j do
      begin
        while A[i]<A[mid] do inc(i);                                   // tim vi tri khong phu hop
        while A[j]>A[mid] do dec(j);

        if not(i>j) then                                               // khong thoa yeu cau
          begin
            t:=A[i]; A[i]:=A[j]; A[j]:=t;                              // doi cho phan tu khong phu hop
            inc(i); dec(j);
          end;
      end;
      if l<j then sort(l,j);                                           // sap xep phan truoc chot
      if i<r then sort(i,r);                                           // sap xep phan sau chot
  end;

BEGIN
  readln(n);
  for i:=1 to n do readln(A[i]);

  sort(1,n);
END.