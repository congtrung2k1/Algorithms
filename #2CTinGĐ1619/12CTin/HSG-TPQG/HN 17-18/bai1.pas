const fi = '';
      fo = '';
var t,h,a,b: string;
    f: text;

function cong(a,b: string): string;
  var i,du,x,tmp: longint;
      tong: string;
  begin
      while length(a) < length(b) do a:='0' + a;
      while length(b) < length(a) do b:='0' + b;
      du:=0; tong:='';
      i:=length(a);
      while i>0 do
        begin
            x:=ord(a[i])-48 + ord(b[i])-48 + du;
            tmp:=x mod 10;
            tong:=chr(tmp + 48) + tong;
            du:=x div 10;
            dec(i);
        end;
      if du<>0 then tong:='1'+tong;
      exit(tong);
  end;

function tru(a,b: string): string;
  var i,nho: longint;
  begin
      while length(a) < length(b) do a:='0' + a;
      while length(b) < length(a) do b:='0' + b;
      nho:=0; tru:='';
      i:=length(a);
      while i>0 do
        begin
            if a[i]<b[i] then
              begin
                  tru:= chr((10*(ord(a[i])-48) - (ord(b[i])-48 + nho)) + 48) + tru;
                  nho:=1;
              end
            else begin
                     tru:=chr((ord(a[i])-48 - (ord(b[i]) - 48 + nho)) + 48) + tru;
                     nho:=0;
                 end;
            dec(i);
        end;
  end;

function di(a: string): string;
  var i,du,tmp: longint;
  begin
      i:=1; du:=0; di:='';
      while i<=length(a) do
        begin
            tmp:=10*du + ord(a[i])-48;
            di:=di + chr(tmp div 2 + 48);
            du:=tmp mod 2;
            inc(i);
        end;
      while di[1]='0' do delete(di,1,1);
  end;

BEGIN
    assign(f,fi); reset(f); readln(f,t); readln(f,h); close(f);
    assign(f,fo); rewrite(f);
    a:=cong(t,h);
    b:=tru(t,h);
    writeln(f,di(a)); writeln(f,di(b));
END.