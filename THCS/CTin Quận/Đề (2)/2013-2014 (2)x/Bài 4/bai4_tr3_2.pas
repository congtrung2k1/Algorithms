program bai4_tr3_2;
var fi,fo: text;
    m,n,h,c,tang,pt,max: longint;
    A: array [1..100,1..100] of longint;

    function ktt(h,c,hh,cc,t:longint): boolean;
      var i,j,g: longint;
          B: array [1..10000] of longint;
      begin      {*************}
       pt:=0;
       if (t+1) mod 2=0 then ktt:=false else
         begin
           for i:=h to hh do
            for j:=c to cc do
              begin
               inc(pt);
               B[pt]:=A[i,j];
              end;

           for i:=1 to pt-1 do
            for j:=i+1 to pt do
             if B[i]> B[j] then
               begin
                g:=B[i];
                B[i]:=B[j];
                B[j]:=g;
               end;

           if (B [(pt div 2)+1] <> B [n div 2] )
                and (B [(n div 2)+1] <> B [(n div 2)+2]) then ktt:=true
                                                         else ktt:=false;
         end;       {**************}
      end;

    function sm(h,c:longint): longint;
      var tang,cd: longint;
      begin
       if (m-h) > (n-c) then cd:=n-c else cd:=m-h;
       if cd>=2 then
         begin
           for tang:= 2 to cd do
             begin
              sm:=0;
              if ktt(h,c,h+tang,c+tang,tang)=true then
               if pt>sm then sm:=pt;
             end;
         end;
      end;

BEGIN
assign (fi,'DTT.INP'); reset(fi);
assign (fo,'DTT.OUT'); rewrite(fo);
read (fi,m,n);

for h:=1 to m do
 for c:=1 to n do read (fi,A[h,c]);

max:=0;
for h:=1 to m do
 for c:=1 to n do
  if sm(h,c)>max then max:=sm(h,c);

write (fo,max);
close(fi); close(fo);
END.
