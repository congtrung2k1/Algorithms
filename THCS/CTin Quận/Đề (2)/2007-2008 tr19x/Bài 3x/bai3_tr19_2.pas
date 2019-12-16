program ba3_tr19_2;
var fi,fo: text;
    A: array [1..100,1..100] of char;
    m,n,h,c,max: longint;

    function kt(vao:string): boolean;
      var i,j: longint;
      begin
       for i:=1 to length(vao)-1 do
        for j:=i+1 to length(vao) do
         if vao[i]=vao[j] then exit(false) else kt:=true;
      end;

    procedure chay(h,c:longint);
      var cc,hh,i,j,dt: longint;
          chuoi: string;
      begin
        for cc:=c to m do
         for hh:=h to n do
           begin
            chuoi:='';
            for i:=h to hh do
             for j:=c to cc do chuoi:=chuoi+A[i,j];
            if kt(chuoi)=true then dt:= (cc-c+1)*(hh-h+1)
                              else begin dt:=0; end;
            if dt>max then max:=dt;
           end;
      end;
BEGIN
assign (fi,'DIENTICH.INP'); reset(fi);
assign (fo,'DIENTICH.OUT'); rewrite(fo);
read (fi,m,n);

for h:=1 to m do
 for c:=1 to n do
  read (fi,A[h,c]);

max:=0;
for h:=1 to m do
 for c:=1 to n do
  chay(h,c);

writeln (fo,max);
close(fi); close(fo);
END.