var s,a: ansistring;
    aa,pow: array [0..1000000] of int64;
    i: longint;
    hashMain: int64;

function get(i,j: longint): int64;
  begin
      exit(aa[j] - aa[i-1]*pow[j-i+1]);
  end;

BEGIN
    readln(a);
    readln(s);

    hashMain:=0;
    for i:=1 to length(s) do
      hashMain:=hashMain*26 + ord(s[i])-96;

    aa[0]:=0;
    for i:=1 to length(a) do
      aa[i]:=aa[i-1]*26 + ord(a[i])-96;

    pow[0]:=1;
    for i:=1 to length(a) do
      pow[i]:=pow[i-1]*26;

    for i:=1 to length(a)-length(s)+1 do
      if hashMain = get(i,i+length(s)-1) then write(i,' ');         
END.