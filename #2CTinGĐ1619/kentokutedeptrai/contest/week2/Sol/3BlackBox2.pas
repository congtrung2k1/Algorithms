const fin='';
        fout='';
var f,g:text;
        i,n,m,k,j:longint;
        a,b,c:array[1..30000] of longint;
procedure sort(l,r: longint);
      var
         i,j,x,y,x1: longint;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2];
         repeat
           while (a[i]<x)  do
            inc(i);
           while (x<a[j])  do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                y:=c[i];
                c[i]:=c[j];
                c[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;

begin
        assign(f,fin);reset(F);
        assign(G,fout);rewrite(G);
        read(F,n,m);
        for i:=1 to n do
        begin
                read(F,a[i]);
                c[i]:=i;
        end;
        for i:=1 to m do
                read(f,b[i]);
        n:=b[m];
        sort(1,n);
        for i:=1 to m do
        begin
                k:=0;
                for j:=1 to n do
                begin
                        if c[j]<=b[i] then inc(k);
                        if k=i then break;
                end;
                writeln(g,a[j]);
        end;
        close(f);
        close(G);
end.