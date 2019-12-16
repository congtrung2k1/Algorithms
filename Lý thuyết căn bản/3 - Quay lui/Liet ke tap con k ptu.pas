const max = 10000;
var n,k: longint;
    A: array [0..max] of longint;
    kt: array [0..max] of boolean;

procedure print;
  var i: integer;
  begin
    for i:=1 to k do write(A[i],#32);
    writeln;
  end;

procedure try(i: longint);
  var j: longint;
  begin
    for j:=A[i-1]+1 to n-k+i do		//duyet tu gtri ke tiep den gioi han
      begin
        A[i]:=j;
        if i=k then
                print
        else
                begin
                  kt[j]:=FALSE;
                  try(i+1);
                  kt[j]:=TRUE;
                end;
      end;
  end;

BEGIN
  write ('Nhap n: '); readln(n);
  write ('Nhap k: '); readln(k);

  fillchar (kt,sizeof(kt),TRUE);
  A[0]:=0;
  try(1);

  readln
END.
