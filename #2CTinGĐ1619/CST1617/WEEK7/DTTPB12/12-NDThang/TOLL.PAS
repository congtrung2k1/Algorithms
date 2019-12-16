const
   fi='TOLL.INP';
   fo='TOLL.OUT';

var
   f,g: text;
   a: array[1..52,1..52] of byte;
   P,n,xp,kt,slx,test,qn: longint;
   Q,kc,tr,x: array[1..52] of longint;

procedure InitQ;
begin
   qn:=0;
end;

procedure Put(u: integer);
begin
   inc(qn);
   q[qn]:=u;
end;

function Get: integer;
var u,i: integer;
begin
   u:=1;
   for i:=2 to qn do
      if kc[q[i]]<kc[q[u]] then u:=i;
   Get:=q[u];
   q[u]:=q[qn];
   dec(qn);
end;

function Qempty: boolean;
begin
   Qempty:=(qn=0);
end;

function name(ch: char): integer;
begin
   case ch of
      'A'..'Z': name:=ord(ch)-64;
      'a'..'z': name:=ord(ch)-70;
   end;
end;


procedure Docdl;
var i,u,v: integer;
    ch: char;
begin
   fillchar(a,sizeof(a),0);
   readln(f,N);
   if N=-1 then exit;
   for i:=1 to N do
      begin
         repeat read(f,ch) until ch<>#32;
         u:=name(ch);
         repeat read(f,ch) until ch<>#32;
         v:=name(ch);
         readln(f);
         a[u,v]:=1;
         a[v,u]:=1;
      end;
   read(f,P);
   repeat read(f,ch) until ch<>#32;
   xp:=name(ch);
   repeat read(f,ch) until ch<>#32;
   kt:=name(ch);
   readln(f);
end;

function Thue(u,v: integer): longint;
var t,r,ans: longint;
begin
   case u of
      1..26  : begin
                For r:=19 downto 0 do
                 if (kc[u]-r) mod 19=0 then break;
                  t:=1+r+20*((kc[u]-r) div 19);
                  Thue:=t;
               end;
      27..52 : Thue:=kc[u]+1;
   end;
end;

procedure TimNguoc;
var u: integer;
begin
   slx:=0;
   u:=xp;
   repeat
      inc(slx);
      x[slx]:=u;
      u:=tr[u];
   until u=53;
end;

procedure Dijstra;
var u,v: integer;
    ll: longint;
begin
   InitQ;
   fillchar(Tr,sizeof(Tr),0);
   fillchar(kc,sizeof(kc),0);
   kc[kt]:=P;
   Put(kt);
   Tr[kt]:=-53;
   repeat
      u:=Get; Tr[u]:=-Tr[u];
      for v:=1 to 52 do
         if (a[u,v]=1) then
            begin
               ll:=Thue(u,v);
               if (Tr[v]<0) and (kc[v]>ll) then
                  begin
                     kc[v]:=ll;
                     Tr[v]:=-u;
                  end;
               if Tr[v]=0 then
                  begin
                     Put(v);
                     Tr[v]:=-u;
                     kc[v]:=ll;
                  end;
            end;
   until Qempty;
   TimNguoc;
end;

function chu(u: integer): char;
begin
   case u of
      1..26  : chu:=chr(u+64);
      27..52 : chu:=chr(u+70);
   end;
end;

procedure Inkq;
var i: integer;
begin
   writeln(g,'#',test);
   writeln(g,kc[xp]);
   for i:=1 to slx-1 do write(g,chu(x[i]),'-');
   writeln(g,chu(x[slx]));
end;

procedure Solve;
begin
   test:=0;
   while not seekeof(f) do
      begin
         inc(test);
         docdl;
         if n<>-1 then
            begin
               Dijstra;
               Timnguoc;
               Inkq;
            end;
      end;
end;

BEGIN
   assign(f,fi); reset(f);
   assign(g,fo); rewrite(g);
   Solve;
   close(f); close(g);
END.
