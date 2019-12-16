Uses Math;
Const fi='';
	fo='';
Var r:Array[1..10001] Of Real;
	n:integer;
	sum:extended;
	f,g:Text;
Procedure Data;
Begin
	Assign(f,fi);Reset(f);
	Assign(g,fo);Rewrite(g);
	Readln(f,n);
        sum:=0;
	For n:=1 to n do begin Read(f,r[n]);sum:=sum+r[n];end;
	r[n+1]:=r[1];
End;
Function tinh(ro:extended):extended;
Var a,b,c,arc:extended;
	i:Integer;
Begin
	tinh:=0;
	For i:=1 to n do
	begin
		a:=r[i]+r[i+1];b:=ro+r[i];c:=ro+r[i+1];
		arc:=(b*b+c*c-a*a)/(2*b*c);
		arc:=arccos(arc);
		tinh:=tinh+arc;
	end;
End;
Procedure Solve;
Var d,c,goc,m,pi:extended;
Begin
	d:=0;c:=sum;
        m:=(d+c)/2;
	Repeat
		goc:=tinh(m)*10000000000;
                pi:=arccos(-1)*10000000000;
		If int(goc)=int(2*pi) then begin Writeln(g,m:0:3);Exit;end
		Else If int(goc)>int(2*pi) then d:=m Else c:=m;
                m:=(d+c)/2;
	Until (m=d)or(m=c);
End;
BEGIN
	Data;
	Solve;
	Close(f);Close(g);
END.
