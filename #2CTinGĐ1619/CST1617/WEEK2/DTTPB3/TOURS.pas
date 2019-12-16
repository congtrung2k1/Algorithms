Uses Math;
Const fi='TOURS.INP';
        fo='TOURS.OUT';
        maxm=1000000000;
Type list=^node;
        node=record
                v,s:Longint;link:List;end;
     queue=record
     	d,s:Longint;end;
Var a:ARray[1..10000] Of list;
        d,p,heap,pos:Array[1..10000] Of Longint;
        kt:Array[1..10000] Of Boolean;
        n,m,t,top:Longint;
        f,g:Text;
Function pop:longint;
Var p,c,v:Longint;
Begin
	pop:=heap[1];
	v:=heap[top];
	dec(top);p:=1;
	While 2*p<=top do
	begin
		c:=p*2;
		If (c<top) and(d[heap[c+1]]<d[heap[c]]) then inc(c);
		If d[v]<=d[heap[c]] then break;
		heap[p]:=heap[c];pos[heap[p]]:=p;p:=c;
	end;
	heap[p]:=v;pos[v]:=p;
End;
Procedure push(v,ts:Longint);
Var p,c:Longint;
	tmp:queue;
Begin
	c:=pos[v];
	If c=0 then
	begin
		inc(top);c:=top;
	end;
	p:=c div 2;
	While (p>0) and(d[heap[p]]>d[v]) do
	begin
		heap[c]:=heap[p];pos[heap[c]]:=c;c:=p;
		p:=c div 2;
	end;
	heap[c]:=v;
	pos[v]:=c;
End;
Function djt:Boolean;
Var minm,u,v:Longint;
        tmp:list;
Begin
        Repeat
        		u:=pop;
                kt[u]:=False;
                tmp:=a[u];
                While tmp<>nil do
                begin
                        If kt[tmp^.v]and(d[tmp^.v]>d[u]+tmp^.s) then
                        begin d[tmp^.v]:=d[u]+tmp^.s;push(tmp^.v,d[tmp^.v]);end;
                        tmp:=tmp^.link;
                end;
        Until top=0;
End;
Procedure Data;
Var u,v,ts:Longint;
        tmp:list;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,t);
        For t:=1 to t do
        begin
                Readln(f,n,m);
                For n:=1 to n do begin new(a[n]);a[n]:=nil;end;
                For m:=1 to m do
                begin
                        Readln(f,u,v,ts);
                        new(tmp);
                        tmp^.v:=v;tmp^.s:=ts;tmp^.link:=a[u];a[u]:=tmp;
                end;
                For u:=1 to n do
                begin
                        tmp:=a[u];top:=0;
                        For v:=1 to n do d[v]:=maxm;
                        Fillchar(heap,sizeof(heap),0);
                        Fillchar(pos,sizeof(pos),0);
                        Fillchar(kt,sizeof(kt),True);
                        While tmp<>nil do
                        begin
                        		If d[tmp^.v]>tmp^.s then
                        		begin
                                	d[tmp^.v]:=tmp^.s;
                                	push(tmp^.v,d[tmp^.v]);
                                end;
                                tmp:=tmp^.link;
                        end;
                        If top=0 then Writeln(g,-1) Else
                        begin
                        	djt;
                        	If d[u]=maxm then Writeln(g,-1) Else Writeln(g,d[u]);
                        end;
                end;
        end;
End;
BEGIN
        Data;
        Close(f);CLose(g);
END.
