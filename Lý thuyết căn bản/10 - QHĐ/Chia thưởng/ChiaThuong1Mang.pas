var m,n,i,j: longint;
    c: array [0..100000] of longint;

BEGIN
  readln(m,n);

  c[0]:=1;                                        // 0 hoc sinh voi 0 vat se co 1 cach chia
  for i:=1 to m do c[i]:=0;                       // 0 hoc sinh voi 1..vat se khong co cach chia

  for j:=1 to n do                                // so hs chay tu 1..n
    for i:=j to m do c[i]:=c[i]+c[i-j];           // so cach chia vat tu j..m vat

  writeln(c[m]);
  readln;
END.
