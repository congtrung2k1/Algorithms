program bai1_tr33_4;
var fi,fo: text;
    s2,s3,s: string;
    i,j,so,pt: longint;
    A,B: array [1..10000000] of longint;

    function doi(vao:string; so:longint): longint;
      var  gt,i,soo: longint;
      begin
        gt:=1; doi:=0;
        for i:=length(vao) downto 1 do
          begin
            if i<>length(vao) then gt:=gt*so;
            val(vao[i],soo);
            doi:=doi+gt*soo;
          end;
      end;


BEGIN
assign (fi,'DIGIT.INP'); reset(fi);
assign (fo,'DIGIT.OUT'); rewrite(fo);
readln (fi,s2);  readln(fi,s3);

for i:=1 to length(s2) do
  begin
    s:=s2;
    val(s[i],so); delete(s,i,1);
    if (so=1) then insert ('0',s,i) else insert ('1',s,i);
    A[i]:=doi(s,2);
  end;

pt:=0;
for i:=1 to length(s3) do
  begin
    s:=s3;
    val(s[i],so); delete(s,i,1);
    case so of
      0: begin
           inc(pt); insert ('1',s,i);
           B[pt]:=doi(s,3);
           delete(s,i,1);

           inc(pt); insert ('2',s,i);
           B[pt]:=doi(s,3);
         end;
      1: begin
           inc(pt); insert ('0',s,i);
           B[pt]:=doi(s,3);
           delete(s,i,1);

           inc(pt); insert ('2',s,i);
           B[pt]:=doi(s,3);
         end;
      2: begin
           inc(pt); insert ('0',s,i);
           B[pt]:=doi(s,3);
           delete(s,i,1);

           inc(pt); insert ('1',s,i);
           B[pt]:=doi(s,3);
         end;
      end;
  end;

for i:=1 to length(s2) do
  for j:=1 to pt do
    if A[i]=B[j] then
      begin
        writeln (fo,A[i]); close(fo); exit;
      end;
close(fi);
END.