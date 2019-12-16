program bai3_tr13_4;
var fi,fo: text;
    k,kk,gt,ketqua: longint;
    chuoi: string;

    function kt(gt:longint): boolean;
      var i: longint;
      begin
       for i:=2 to trunc(gt/2) do
        if gt mod i = 0 then exit(false) else kt:=true;
      end;

    function cap_ngto(var gt:longint): boolean;
      begin
        cap_ngto:=false;
        while cap_ngto=false do
          begin
           inc(gt);
           if kt(gt)=true then exit(true) else cap_ngto:=false;
          end;
      end;

    procedure timso(var gt:longint);
      var l:byte; ss:string;
      begin
       l:=0;
       while l<>2 do
          if cap_ngto(gt)=true then
            begin
              inc(l);
              str(gt,ss);
              chuoi:=chuoi+ss;
            end;
      end;

BEGIN
assign (fi,'Input.inp'); reset(fi);
assign (fo,'Output.out'); rewrite (fo);
read (fi,k);

kk:=k;
gt:=1;

while kk>0 do
  begin
    chuoi:='';
    timso(gt);
    val(chuoi,ketqua);
    if kt(ketqua)=true then begin dec(kk); writeln(ketqua,' ',kk); end;
  end;

writeln (fo,ketqua);
close(fi); close(fo);      readln;
END.
