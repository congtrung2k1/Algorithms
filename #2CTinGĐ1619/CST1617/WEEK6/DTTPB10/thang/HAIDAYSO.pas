Const fi='haidayso.INP';
	fo='haidayso.OUT';
Type mang1c=Array[1..50001] Of Longint;
Var a,b,c:mang1c;
	s:Longint;
	m,n,k,l:Longint;
	f,g:text;
Procedure sort(h,l:Longint;Var a:mang1c);
Var i,j,x,tg:Longint;
Begin
        i:=h;j:=l;
        x:=a[(h+l) div 2];
        Repeat
                While(a[i]<x) do inc(i);
                While(a[j]>x) do dec(j);
                If(i<=j) then
                begin
                        tg:=a[i];
                        a[i]:=a[j];
                        a[j]:=tg;
                        inc(i);dec(j);
                end;
        Until(i>j);
        If(h<j) then sort(h,j,a);
        If(i<l) then sort(i,l,a);
End;
Procedure Add(x:Longint);
Var p, t: Longint;
Begin
	inc(l); c[l]:=x;
	t:=l;
	While t>1 Do
	Begin
		p:=t Div 2;
		If c[p]>=x Then Break;
		c[t]:=c[p]; t:=p;
	End;
	c[t]:=x;
End;
Procedure Pop(Var x:Longint);
Var tmp:Longint;
	t,p:Longint;
Begin
	x:=c[1]; c[1]:=c[l];dec(l);
	p:=1;tmp:=c[1];
	While 2*p<=l Do
	Begin
		t:=p*2;
		If (t<l)and(c[t]<c[t+1]) Then inc(t);
		If c[t]<=tmp Then Break;
		c[p]:=c[t]; p:=t;
	End;
	c[p]:=tmp;
End;
Procedure Solve;
Var i,j,p:Longint;
Begin
	l:=0;
	For i:=1 to m do
	begin
		If(l=k) then
			If(a[i]+b[1]>=c[1]) then Break;
		For j:=1 to n do
		begin
			If(l=k) then
			begin
				If(a[i]+b[j]>=c[1]) then Break
				Else begin add(a[i]+b[j]);pop(s);end;
			end
			Else add(a[i]+b[j]);
		end;
	end;
	Sort(1,k,c);
        For k:=1 to k do
	Writeln(g,c[k],#32);
End;
BEGIN
	Assign(f,fi);Reset(f);
	Assign(g,fo);Rewrite(g);
	Readln(f,m,n,k);
	For m:=1 to m do Read(f,a[m]);
	For n:=1 to n do Read(f,b[n]);
	Sort(1,m,a);Sort(1,n,b);
	Solve;
	Close(f);Close(g);
END.

