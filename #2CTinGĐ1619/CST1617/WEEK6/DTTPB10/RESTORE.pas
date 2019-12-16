const FI='RESTORE.INP';
      FO='RESTORE.OUT';

var f:text;
    n,i,j,m,mm,k:integer;
    c,a:array[1..300,1..300] of longint;
    kt:boolean;

procedure doc;
begin
        assign(f,FI);
        reset(f);
        readln(f,n);
        for i:=1 to n do
        begin
                for j:=1 to n do read(f,a[i,j]);
                readln(f);
        end;
        close(f);
end;

procedure ghi;
begin
        assign(f,FO);
        rewrite(f);
        {if mm>m then writeln(f,'NO')
        else begin writeln(f,'YES'); }
                for i:=1 to n-1 do
                        for j:=i+1 to n do
                                if c[i,j]<>0 then writeln(f,i,' ',j,' ',c[i,j]);
              //  end;
        close(f);


end;

BEGIN
        doc;
        mm:=0;
        fillchar(c,sizeof(c),0);
        for i:=1 to n do
                for j:=i+1 to n do
                begin
                        kt:=false;
                        for k:=1 to n do
                                if (k<>i) and (k<>j) then
                                        if (c[i,k]+c[k,j])=a[i,j] then begin kt:=true; break; end
                                        else
                                        if (a[i,k]+a[k,j])=a[i,j] then
                                        begin
                                                if c[i,j]<>0 then dec(mm);
                                                c[i,j]:=0;
                                                c[i,k]:=a[i,k]; c[k,j]:=a[k,j];
                                                c[k,i]:=c[i,k]; c[k,j]:=c[j,k];
                                                inc(mm);
                                                kt:=true;
                                        end;
                        if kt=false then begin inc(mm); c[i,j]:=a[i,j]; end;
                        c[j,i]:=c[i,j];
                end;

        ghi;

END.
