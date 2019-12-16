const fi = 'input.inp';

var i: char;
    fa: text;
    s: string;
    q,j: longint;
    n,m,ans: int64;
    x: array [1..100] of char;
    f: array [0..101,0..101,'\'..'z',boolean] of int64;

function tinh(i,j: longint; c: char; ok: boolean): int64;
  var re: int64; q: char;
  begin
      if F[i,j,c,ok]<>-1 then exit(F[i,j,c,ok]);
      if i>n then
        if c=s[length(s)] then
          begin
              F[i,j,c,ok]:=1;
              exit(1);
          end
        else exit(0);

      re:=0;
      if ok then
        begin
            re:=1;
            for j:=i to n do re:=(re * 26) mod m;
        end
      else
      for q:='a' to 'z' do
        begin
            x[i]:=q;
            if q=s[j] then re:= (re + tinh(i+1, j+1, q, j=length(s)) mod m) mod m;
            if q=s[1] then re:= (re + tinh(i+1, 2  , q, length(s)=1) mod m) mod m
                      else re:= (re + tinh(i+1, 1  ,'\', false    ) mod m) mod m;
        end;

      F[i,j,c,ok]:=re;
      exit(re);
  end;

BEGIN
    assign(fa,fi); reset(fa);

    read(fa,q);
    while q>0 do
      begin
          dec(q);

          readln(fa,n,m);
          readln(fa,s);

          fillchar(f,sizeof(f),255);
          ans:= tinh(1,1,'\',false) mod m;
          writeln(ans);
      end;
END.