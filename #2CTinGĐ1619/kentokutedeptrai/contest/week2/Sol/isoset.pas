const fi = 'isoset.inp';
      fo = 'isoset.out';

var f,g: text;
    tmp,s,ss: string;
    i: longint;

procedure check;
  var k: array [1..50,1..50] of boolean;
      i,j: longint;
  begin
      fillchar(k,sizeof(k),false);
      for i:=1 to length(s)-1 do
        for j:=i+1 to length(s) do
          if s[i]=s[j] then k[i,j]:=true;
      for i:=1 to length(ss)-1 do
        for j:=i+1 to length(ss) do
          if (ss[i]=ss[j]) and (k[i,j]=false) or (ss[i]<>ss[j]) and k[i,j] then begin writeln(g,'NO'); halt; end;
      writeln(g,'YES');
  end;

procedure check2;
  var ans: array [1..10] of int64=(9,81,648,4536,27216,136080,544320,1632960,3265920,3265920);
      k: array ['0'..'9'] of boolean;
      n: longint;
  begin
      n:=0;
      fillchar(k,sizeof(k),false);
      for i:=1 to length(s) do
        if k[s[i]]=false then
          begin k[s[i]]:=true; inc(n); end;
      writeln(ans[n]);
  end;

BEGIN
    assign(f,fi); reset(f);
    assign(g,fo); rewrite(g);

    while not(eof(f)) do
      begin
          readln(f,tmp);
          if tmp[1]='V' then
            begin
                s:=''; SS:='';

                i:=2; while tmp[i]=' ' do inc(i);
                for i:=i to length(tmp) do
                  begin
                      if tmp[i]=' ' then break;
                      s:=s + tmp[i];
                  end;

                while tmp[i]=' ' do inc(i);
                for i:=i to length(tmp) do ss:=ss + tmp[i];
                check;
            end
          else
            begin
                s:='';
                i:=2; while tmp[i]=' ' do inc(i);
                for i:=i to length(tmp) do s:=s + tmp[i];
                check2;
            end;
      end;

    close(g);
END.