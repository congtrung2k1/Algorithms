const max = 1000;
type mang = array [0..max] of longint;
var A,B,C: mang;
    x: array [1..max] of string;
    daua,daub,cuoib,cuoic,int: longint;
    s: string;
    n,i: longint;

procedure print(int: longint);
  var i: longint;
  begin
    for i:=1 to int do write(x[i],' ');
    writeln;
    readln;
  end;

procedure xuly(i: longint);
  var gtri: longint;
  begin
    val(s[i],gtri);
    if A[daua]=gtri then
      begin
        inc(cuoic); C[cuoic]:=A[daua];
        inc(daua);
        inc(int); x[int]:='A->C';
        if cuoic<n then xuly(i+1) else begin print(int); halt end;
      end
    else if B[daub]=gtri then
           begin
             inc(cuoic); C[cuoic]:=B[daub];
             inc(daub);
             inc(int); x[int]:='B->C';
             if cuoic<n then xuly(i+1) else begin print(int); halt end;
           end
         else
           begin
             while (daua<=n) and (A[daua]<>gtri) do
               begin
                 inc(cuoib); B[cuoib]:=A[daua];
                 inc(daua);
                 inc(int); x[int]:='A->B';
               end;
             if daua<=n then
               begin inc(cuoic); C[cuoic]:=A[daua]; inc(daua); inc(int); x[int]:='A->C'; end
             else
               begin writeln('Khong co phuong an dich chuyen'); halt end;
             if cuoic<n then xuly(i+1);
           end;
  end;

BEGIN
  writeln('Bai 2c');
  write('Nhap n: '); readln(n);
  write('Nhap hoan vi: '); readln(s);
  while pos(' ',s)<>0 do delete(s,pos(' ',s),1);

  daua:=1; daub:=1; cuoib:=0; cuoic:=0; int:=0;
  for i:=1 to n do A[i]:=i;

  xuly(1);

  readln;
END.
