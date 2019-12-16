uses math;
const fi = 'codam.inp';
      fo = '';
var hang: array [1..4] of longint=(-1,-1, 1,1);
    cot : array [1..4] of longint=(-1, 1,-1,1);
    h   : array [1..4] of longint=(-2,-2, 2,2);
    c   : array [1..4] of longint=(-2, 2,-2,2);
    a: array [1..10,1..10] of char;
    tmp: char;
    f,g: text;
    q,i,j,x,y,smax: longint;

function dfs(x,y,v,d: longint): longint;
  var i,tmp: longint;
  begin
      for i:=1 to 4 do
        if (x+hang[i]>0) and (x+hang[i]<=10) and (y+cot[i]>0) and (y+cot[i]<=10) and (a[x+hang[i],y+cot[i]]='B') and (a[x+h[i],y+c[i]]<>'B')
        then begin
                 smax:=max(d+1,smax);   inc(tmp);
                 a[x+hang[i],y+cot[i]]:='#';
                 tmp:=tmp + dfs(x+h[i],y+c[i],i,d+1);
                 a[x+hang[i],y+cot[i]]:='B';
             end;
  end;

BEGIN
    assign(f,fi); reset(f); readln(f,q);
    assign(g,fo); rewrite(g);
    while q>0 do
      begin
          dec(q);
          readln(f,tmp);
          for i:=1 to 10 do
            begin
                for j:=1 to 10 do
                  begin
                      read(f,a[i,j]);
                      if a[i,j]='W' then begin x:=i; y:=j; end;
                  end;
                readln(f,tmp);
            end;
          smax:=0;
          for i:=1 to 4 do
            if (x+hang[i]>0) and (x+hang[i]<=10) and (y+cot[i]>0) and (y+cot[i]<=10) and (a[x+hang[i],y+cot[i]]='B') and (a[x+h[i],y+c[i]]<>'B')
            then begin
                     smax:=max(1,smax);
                     a[x+hang[i],y+cot[i]]:='#';
                     dfs(x+h[i],y+c[i],i,1);
                     a[x+hang[i],y+cot[i]]:='B';
                 end;
          writeln(g,smax);
      end;
    close(g);
END.