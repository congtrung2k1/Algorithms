const max = 1000;
var A,B,C: array [0..max] of longint;
    x: array [0..max] of string;
    cuoib,daua,cuoic: longint;
    s: string;
    n,i,int: longint;

procedure print(int: longint);
  var i: longint;
  begin
    for i:=1 to int do write(x[i],' ');
  end;

procedure xuly(i: longint);
  var gtri: longint;
  begin
    val(s[i],gtri);
    if A[daua]=gtri then
      begin
        inc(cuoic);
        C[cuoic]:=A[daua];
        inc(daua);
        inc(int); x[int]:='A->C';
        if cuoic<n then xuly(i+1) else begin print(int); readln; halt; end;
      end
    else if B[cuoib]=gtri then
           begin
             inc(cuoic);
             C[cuoic]:=B[cuoib];
             dec(cuoib);
             inc(int); x[int]:='B->C';
             if cuoic<n then xuly(i+1) else begin print(int); readln; halt; end;
           end
         else
           begin
             while (A[daua] <> gtri) and (daua<=n) do
               begin
                 inc(cuoib);
                 B[cuoib]:=A[daua];
                 inc(daua);
                 inc(int); x[int]:='A->B';
               end;
             if daua<=n then begin inc(cuoic); C[cuoic]:=A[daua]; inc(daua); inc(int); x[int]:='A->C'; end
             else
               begin writeln ('Khong co phuong an dich chuyen'); readln; halt; end;
             if cuoic<n then xuly(i+1);
           end;
  end;

BEGIN
  writeln('Bai 2');
  write('Nhap n: '); readln(n);
  write('Nhap hoan vi: '); readln(s);
  while pos(' ',s)<>0 do delete(s,pos(' ',s),1);

  daua:=1; cuoib:=0; B[cuoib]:=0; cuoic:=0; C[cuoic]:=0;
  int:=0;
  for i:=1 to n do A[i]:=i;

  xuly(1);

  writeln('cc'); readln;
END.
