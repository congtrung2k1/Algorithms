Uses Math;
Const fi='ONE4EVER.Inp';
	fo='ONE4EVER.Out';
Type matrix=Array[0..1,0..1] Of ansistring;
Var a:matrix;
	b:matrix;
	p:Array[0..1,0..1] Of ansistring;
	t:Longint;
	x,y,m,l:Int64;
	i,j,k:Byte;
	du:ansistring;
	res:matrix;
	f,g:Text;
Function Cmp(a,b:ansiString):Boolean;
Begin
        If(Length(a)=Length(b)) then Exit(a>=b)
        Else Exit(length(a)>Length(b));
End;
Function add(a,b:ansiString):ansiString;
Var nho:Byte;
        i:Longint;
Begin
        While(length(b)>length(a)) do a:='0'+a;
        While(length(b)<length(a)) do b:='0'+b;
        nho:=0;
        add:='';
        For i:=length(a) downto 1 do
        begin
                nho:=Ord(a[i])+Ord(b[i])-96+nho;
                add:=Chr(nho mod 10+48)+add;
                nho:=nho div 10;
        end;
        If(nho=1) then add:='1'+add;
End;
function Nhan(x,y:ansistring):ansistring;
var
        z:ansiString;
        tmp,k,i:Longint;
begin
        z:=x+y; tmp:=0;
        for k:=length(z) downto 1 do
        begin
                for i:=max(1,k-length(y)) to min(k-1,length(x)) do
                tmp:=tmp+(ord(x[i])-48)*(ord(y[k-i])-48);
                z[k]:=chr(48+tmp mod 10);
                tmp:=tmp div 10;
        end;
        if tmp>0 then z[k]:=chr(tmp+48);
        while (z[1]='0') and (length(z)>1) do delete(z,1,1);
        exit(Z);
end;
Function Tru(x,y:ansistring):ansistring;
 var  nho:byte;
        i:Longint;
 begin
  while length(x)>length(y) do y:='0'+y;
  nho:=0;
  for i:=length(x) downto 1 do
   begin
    nho:=10+ord(x[i])-ord(y[i])-nho;
    x[i]:=chr(48+(nho mod 10));
    nho:=1-nho div 10;
   end;
  while (x[1]='0')and(length(x)>1) do delete(x,1,1);
  exit(x);
 end;
Function bigmod(x,y:ansistring):ansistring;
Var hold:ansistring;
	kb:Array[0..10] Of ansistring;
	i,k:Longint;
Begin
	kb[0]:='0';
	For i:=1 to 10 do kb[i]:=add(kb[i-1],y);
	hold:='';
	For i:=1 to length(x) do
	begin
		hold:=hold+x[i];
		k:=1;
		While cmp(hold,kb[k]) do inc(k);
		hold:=tru(hold,kb[k-1]);
	end;
	bigmod:=hold;
End;
operator *(a,b:matrix) c:matrix;
Var i,j,k:Byte;
Begin
	Fillchar(c,sizeof(c),0);
	For i:=0 to 1 do
		For j:=0 to 1 do
		begin
			c[i,j]:='0';
			for k:=0 to 1 do
				c[i,j]:=bigmod(add(c[i,j],nhan(a[i,k],b[k,j])),du);
		end;
End;
Function power(n:int64):matrix;
Var temp:matrix;
Begin
	If n=1 then Exit(a);
	temp:=power(n div 2);
	temp:=temp*temp;
	If odd(n) then temp:=temp*a;
	Exit(temp);
End;
Procedure mktest(a,b,m,k,t:int64)   ;
Begin
        Assign(f,fi+chr(t+48));Rewrite(f);
        Writeln(f,a,#32,b,#32,m,#32,k);
        Close(f);
End;
BEGIN
        {mktest(trunc(1e9),124552,trunc(1e10),trunc(1e9)*2,5);
        mktest(trunc(1e10),123456789,987654321,trunc(1e10)+15248,6);
        mktest(trunc(1e11),123487602589,9125487654321,trunc(1e12)+1414678,7);
        mktest(trunc(1e13),123456548789,987654351221,trunc(1e14)+25553,8);
        mktest(trunc(1e15),1234567852529,96855587654321,trunc(1e15)+15248,9);  }
        //For t:=5 to 9 do
        begin
	Assign(f,fi);Reset(f);
	Assign(g,fo);rewrite(g);
	While not eof(f) do
	begin
		Readln(f,x,y,m,l);
		If (l=1) then writeln(g,y mod m)
		Else
		begin
			str(m,du);
			a[0,0]:='1';a[0,1]:='0';a[1,0]:='1';str(x,a[1,1]);
			res:=power(l-1);str(y,b[0,0]);str(y mod m,b[1,0]);
			For i:=0 to 1 do
				For j:=0 to 1 do
				begin
					p[i,j]:='0';
					For k:=0 to 1 do
						p[i,j]:=bigmod(add(p[i,j],nhan(res[i,k],b[k,j])),du);
				end;
			Writeln(g,p[1,0]);
		end;
	end;
        Close(f);Close(g);
        end;
END.
