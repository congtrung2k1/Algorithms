const fin='dulich.inp';
      fout='dulich.out';
var f,g:text;
    m,n,i,t,t1,min,flag,flag1:longint;
    a:array[1..200,1..200] of longint;
    luu,trace:array[1..200] of longint;
    free:array[1..200] of boolean;

procedure kt(s:longint);
var i:longint;
begin
        if min>s then
        begin
                flag1:=flag;
                min:=s;
                for i:=1 to flag do
                        luu[i]:=trace[i];
        end;
end;

procedure dfs(x,dem,s:longint);
var j:longint;
begin
        if dem>3 then free[i]:=true
        else free[i]:=false;
        for j:=1 to n do
                if free[j] and (a[x,j]>0) then
                begin
                        free[j]:=false;
                        trace[dem]:=x;
                        if (j=i) and (dem>3) then
                        begin
                                flag:=dem;
                                kt(s+a[x,j]);
                        end
                        else dfs(j,dem+1,s+a[x,j]);
                        if dem>3 then free[i]:=true
                        else free[i]:=false;
                        trace[dem]:=0;
                        free[j]:=true;
                end;

end;

begin
        fillchar(a,sizeof(a),0);
        assign(f,fin);reset(f);
        assign(g,fout);rewrite(g);
        read(f,n,m);
        for i:=1 to m do
        begin
                read(f,t,t1,a[t,t1]);
                a[t1,t]:=a[t,t1];
        end;

        for i:=1 to n do
          begin
            for min:=1 to n do
              write(a[i,min],#32);
            writeln
          end;

        min:=maxlongint;
        for i:=1 to n do
        begin
                flag:=0;
                fillchar(free,sizeof(free),true);
                free[i]:=false;
                dfs(i,1,0);
        end;
        if flag>0 then
        begin
                writeln(g,1);
                writeln(g,min);
                writeln(g,flag1);
                for i:=1 to flag1 do
                        writeln(g,luu[i]);
        end
        else write(g,0);


        close(f);
        close(g);
end.
