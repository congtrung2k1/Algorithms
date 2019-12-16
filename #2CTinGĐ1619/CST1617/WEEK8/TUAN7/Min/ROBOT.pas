Const FI='robot.inp';
      Fo='Robot.out';

Var a: array [1..100,1..100] of char;
    d: array [1..4] of longint = (-1,0,1,0);   //cung chieu kim dong ho.
    c: array [1..4] of longint = (0,1,0,-1);
    visit,dg: array [1..100,1..100,1..4,1..10] of boolean;
    i,j,n,k,kq,m,h,tmp: longint;
    s: string;
    f: text;

Procedure Init;
 Begin
 Assign(f,FI); reset(F);
 Readln(f,n,m,k);
 tmp:=0;
 For n:=1 to n do begin
  For m:=1 to m do begin read(f,a[n,m]); if a[n,m]<>'#' then inc(tmp); end;
  Readln(F);
  end;
 Readln(f,s);
 Close(F);
 End;

Function check(x,y:longint):boolean;
 Begin
 Exit((x>=1) and (x<=n) and (y>=1) and (y<=m));
 End;

Function DFS(u,v,h,i:longint): boolean;
 Begin
 IF i>k then i:=i-k;
 if visit[u,v,h,i] then begin exit(dg[u,v,h,i]); end;
 If a[u,v]='E' then begin dg[u,v,h,i]:=true; exit(true); end;
 visit[u,v,h,i]:=true;
 If a[u,v]='#' then exit(false);
 Case s[i] of
  'F': begin // if i>=k then i:=0;
              If check(u+d[h],v+c[h]) and (a[u+d[h],v+c[h]]<>'#') then
              begin
               dg[u,v,h,i]:=dfs(u+d[h],v+c[h],h,i+1);
                 dfs:=dg[u,v,h,i]; end
                else dg[u,v,h,i]:=dfs(u,v,h,i+1); dfs:=dg[u,v,h,i]; end;

  'L': begin
      // if i>=k then i:=0;
       if h=1 then dg[u,v,h,i]:=dfs(u,v,4,i+1)
        else dg[u,v,h,i]:=dfs(u,v,h-1,i+1);
       dfs:=dg[u,v,h,i];        end;
  'R': begin
       //if i>=k then i:=0;
       If h=4 then dg[u,v,h,i]:=dfs(u,v,1,i+1)
               else dg[u,v,h,i]:=dfs(u,v,h+1,i+1);
       dfs:=dg[u,v,h,i];        end;
       end;
 End;

Procedure Try;
 Begin
 Assign(f,FO); rewrite(F);
 h:=1; kq:=0;
 Fillchar(dg,sizeof(dg),false);
 fillchar(visit,sizeof(visit),false);
 For i:=1 to n do
  For j:=1 to m do
   if a[i,j]='.' then begin
                            h:=1;
                            if dfs(i,j,h,1) then inc(kq); end;
 IF tmp=kq+1 then writeln(f,'YES') else Writeln(f,kq+1);
 Close(F);
 End;

Begin
 Init;
 Try;
End.
