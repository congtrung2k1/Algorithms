const fi = 'stone.inp';
      fo = 'stone.out';
type mang = array [1..400] of longint;
var f: text;
    sl,ans: mang;
    leaf: array [1..400,1..400] of longint;
    n: longint;

procedure qsort(var a : mang; max: longint);
    procedure sort(l,r: longint);
      var i,j,x,y: longint;
      begin
         i:=l; j:=r; x:=a[(l+r) div 2];
         repeat
           while a[i]>x do inc(i);
           while x>a[j] do dec(j);
           if not(i>j) then
             begin
                y:=a[i]; a[i]:=a[j]; a[j]:=y;
                inc(i); j:=j-1;
             end;
         until i>j;
         if l<j then sort(l,j);
         if i<r then sort(i,r);
      end;
    begin sort(1,max); end;

procedure init;
  var i,j,x: longint;
  begin
      assign(f,fi); reset(f);
      read(f,n);
      for i:=1 to n do
        begin
            read(f,x,sl[x]);
            for j:=1 to sl[x] do read(f,leaf[x,j]);
        end;
      close(f);
  end;

procedure out;
  begin
      assign(f,fo); rewrite(f); writeln(f,ans[1]); close(f);
  end;

procedure dfs(u: longint);
  var m,v,now,tmp,i: longint;
      soi: mang;
  begin
      m:=sl[u];
      if m=0 then begin ans[u]:=1; exit; end;
      for v:=1 to m do dfs(leaf[u,v]);
      for v:=1 to m do soi[v]:=ans[leaf[u,v]];
      qsort(soi,m);

      tmp:=0; now:=0;
      for i:=1 to m do
        if now<soi[i] then
          begin
              tmp:=tmp + (soi[v]-now); now:=soi[v]-1;
          end
        else dec(now);
      ans[u]:=tmp;
  end;

BEGIN
    init;
    dfs(1);
    out;
END.