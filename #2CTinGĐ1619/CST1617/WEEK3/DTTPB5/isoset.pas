CONST FI='ISOSET.INP';
      FO='ISOSET.OUT';
      res:array[1..10] of longint=(9,81,648,4536,27216,136080,
                               544320,1632960,3265920,3265920);


var q:array[1..100,1..100] of byte;
    b:array['0'..'9'] of boolean;
    f,g:text;
    n,i,j,k:byte;
    test:byte;

Function ansV(x,y:string):string;
var i,j:byte;
begin
 if length(x)<>length(y) then exit('NO');
 n:=length(x);
 fillchar(q,sizeof(q),0);
 for i:=1 to n-1 do
  for j:=i+1 to n do if x[i]=x[j] then q[i,j]:=1;
 for i:=1 to n-1 do
  for j:=i+1 to n do
   if y[i]=y[j] then if q[i,j]=0 then exit('NO') else
   else if q[i,j]=1 then exit('NO');
 exit('YES');
end;

Function ansS(x:string):longint;
begin
 n:=length(x);
 fillchar(b,sizeof(b),true);
 k:=0;
 for i:=1 to n do
  if b[x[i]] then
   begin inc(k);b[x[i]]:=false;
   end;
 exit(res[k]);
end;

procedure Init;
var ch:char;
    x,y:string;

begin
 assign(f,fi); reset(f);
 assign(g,fo); rewrite(g);
 while not seekeof(f) do
  begin
   repeat read(f,ch);until ch in['S','V'];
   if ch='V' then
    begin
     i:=0;
     x:='';y:='';
     while not eoln(f) do
      begin
       read(f,ch);
       if ch in['0'..'9'] then if i=0 then x:=x+ch else y:=y+ch
        else if x<>'' then i:=1;
      end;
     writeln(g,ansV(x,y));
    end
   else
    begin
     i:=0;
     x:='';
     while not eoln(f) do
      begin
       read(f,ch);
       if ch in['0'..'9'] then if i=0 then x:=x+ch else
        else if x<>'' then i:=1;
      end;
     writeln(g,ansS(x));
    end;
   readln(f);
  end;
 close(f);
 close(g);
end;

Begin
 Init;
End.
