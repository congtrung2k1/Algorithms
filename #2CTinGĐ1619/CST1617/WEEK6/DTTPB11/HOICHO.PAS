const nmax=100;
      fi='HOICHO.INP';
      fo='HOICHO.OUT';
      infi=TRUNC(10E5);
var
      d,dd,c:array[0..nmax,0..nmax] of Longint;
      g:array [0..nmax] of longint;
      n: longint;
      f:text;

procedure Init;
 var  i,j:longint;
 begin
  assign(f,fi);reset(f);
  readln(f,n);
  for i:=1 to n do
   begin
    g[i]:=i;
    for j:=1 to n do read(f,d[i,j]);readln(f);
   end;
  close(f);
  dd:=d;
  fillchar(c,sizeof(c),0);
 end;

function cungphong(p,q:longint):boolean;
 begin
   while p<>g[p] do p:=g[p];
   while q<>g[q] do q:=g[q];
   exit(p=q);
 end;

function ke(p,q:longint;var h:longint):boolean;
 var i,hh:integer;
 begin
   h:=infi;
   if cungphong(p,q) then exit(false);
   for i:=1 to n do
     if not (cungphong(i,p) or cungphong(i,q)) then
       begin
         hh:=d[i,p]-d[i,q];
         if h=maxint then h:=hh else if h<>hh then exit(false);
       end;
   exit(true);
 end;

procedure timke(var p,q,h:longint);
 var i,j:longint;
 begin
   p:=0;
   for i:=1 to n-1 do
    for j:=i+1 to n do if ke(i,j,h) then
      begin
        p:=i;q:=j;exit;
      end;
 end;

procedure inkq;
 var i,j:longint;
 begin
  assign(f,fo);rewrite(f);
  for i:=1 to n do
   begin
    for j:=1 to n do write(f,dd[i,j]-c[i,j],' ');
    writeln(f);
   end;
  close(f);
 end;

procedure Try;
 var p,q,i,k,h,zp:longint;
 begin
   data;
   repeat
     timke(p,q,h);
     if h=infi then
      begin
       for i:=1 to n do if cungphong(i,p) then
        for k:=1 to n do if cungphong(k,q) then
         begin
          inc(c[i,k]);c[k,i]:=c[i,k];
         end;
       break;
      end;
     zp:=(h+d[p,q]) div 2;
     for i:=1 to n do if cungphong(i,p) then
      for k:=1 to n do if not cungphong(k,p) then
       begin
        inc(c[i,k]);c[k,i]:=c[i,k];
        d[i,k]:=d[i,k]-zp;d[k,i]:=d[i,k];
       end;
     for i:=1 to n do if cungphong(i,q) then
       for k:=1 to n do if not cungphong(k,q) then
        begin
         inc(c[i,k]);c[k,i]:=c[i,k];
         d[i,k]:=d[i,k]-zp+h;d[k,i]:=d[i,k];
        end;
     if p<q then g[q]:=p else g[p]:=q;
  until h=infi;
  inkq;
 end;

BEgin
 Init;
 Try;
End.
