label bd,kt,l2,l3,l4,l5;
const max = 10000;
var n,k: longint;
    cc: char;
    A: array [0..max] of longint;
    bo: array [0..max] of boolean;
    x: array [1..max] of boolean;
    B: array [2..2*max] of boolean;
    C: array [1-max..max-1] of boolean;

procedure print(k: longint);
  var i: longint;
  begin
    for i:=1 to k do write(A[i],#32);
    writeln;
  end;

procedure pr;
  var j: longint;
  begin
    for j:=1 to n do write ('(',j,',',A[j],')',#32);
    writeln;
  end;

procedure p1(i: longint);
  var j: longint;
  begin
    for j:=0 to 1 do
      begin
        A[i]:=j;
        if i = k then print(k) else p1(i+1);
      end;
  end;

procedure p2(i: longint);
  var j: longint;
  begin
    for j:=A[i-1]+1 to n-k+i do
      begin
        A[i]:=j;
        if i=k then print(k) else p2(i+1);
      end;
  end;

procedure p3(i: longint);
  var j: longint;
  begin
     for j:=1 to n do
       if bo[j]=FALSE then
         begin
           A[i]:=j;
           bo[j]:=TRUE;
           if i=k then print(k) else p3(i+1);
           bo[j]:=FALSE;
         end;

  end;

procedure p4(i: longint);
  var j,x: longint;
  begin
    print(i);
    x:=A[i];
    for j:= A[i-1] to x div 2 do
      begin
        A[i]:=j;
        A[i+1]:=x-j;
        p4(i+1);
      end;
  end;

procedure p5(i: longint);
  var j: longint;
  begin
    for j:=1 to n do
      if (x[j]=false) and (B[i+j]=false) and (C[i-j]=false) then
        begin
          A[i]:=j;
          if i=n then pr
          else begin
                 x[j]:=true; B[i+j]:=true; C[i-j]:=true;
                 p5(i+1);
                 x[j]:=false; B[i+j]:=false; C[i-j]:=false;
               end;
        end;
  end;

BEGIN
  writeln('Bai 1');
bd:
  writeln('Chon');
  writeln('1.Liet ke hoan vi n ptu.');
  writeln('2.Liet ke cac tap con k ptu.');
  writeln('3.Liet ke cac chinh hop khong lap.');
  writeln('4.Bai toan phan tich.');
  writeln('5.Bai toan xep hau.');
  readln(cc);

  if cc = '2' then goto l2
    else if cc = '3' then goto l3
      else if cc = '4' then goto l4
        else if cc = '5' then  goto l5
          else if cc <> '1' then goto bd;

  writeln ('Liet ke hoan vi n ptu');
  write ('n: '); readln(n);
  if n=0 then exit;
  k:=n;
  p1(1);
  goto kt;

l2:
  writeln('Liet ke cac tap con k ptu');
  write ('n: '); readln(n);
  write ('k: '); readln(k);
  if (n=0) or (k=0) then exit;
  A[0]:=0;
  p2(1);
  goto kt;

l3:
  writeln('Liet ke cac chinh hop khong lap');
  write ('n: '); readln(n);
  write ('k: '); readln(k);
  if (n=0) or (k=0) then exit;
  p3(1);
  goto kt;

l4:
  writeln('Bai toan phan tich so');
  write ('n: '); readln(n);
  if n=0 then exit;
  A[0]:=1;
  A[1]:=n;
  p4(1);
  goto kt;

l5:
  writeln('Bai toan xep hau');
  write ('n: '); readln(n);
  if n = 0 then exit;
  p5(1);
  goto kt;

kt:
  readln
END.
