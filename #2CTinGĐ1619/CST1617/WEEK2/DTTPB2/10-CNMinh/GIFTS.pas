Const fi='GIFTS.INP';
	fo='GIFTS.OUT';
Var k:Byte;
	p,q,u,v:Int64;
	f:Text;

Function cong(a,b:String):String;
Var nho,i:Byte;
Begin
        While(length(b)>length(a)) do a:='0'+a;
   		While(length(b)<length(a)) do b:='0'+b;
        nho:=0;
        cong:='';
        For i:=length(a) downto 1 do
        begin
                nho:=Ord(a[i])+Ord(b[i])-96+nho;
                cong:=Chr(nho mod 10+48)+cong;
                nho:=nho div 10;
        end;
        If(nho=1) then cong:='1'+cong;
End;

Function Tru(x,y:string):string;
 var  nho,i:byte;
 begin
  While(length(y)>length(x)) do x:='0'+x;
        While(length(y)<length(x)) do y:='0'+y;
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
Function nhan(c:byte;x:String):String;
Var mem,i:Byte;
Begin
	mem:=0;
	For i:=length(x) downto 1 do
	begin
		mem:=c*(ord(x[i])-48)+mem;
		x[i]:=chr(48+mem mod 10);
		mem:=mem div 10;
	end;
	If(mem>0) then x:=chr(48+mem)+x;
	Exit(x);
End;
Function solve(x,y:int64):String;
Var h:Int64;
	i:Byte;
	g,z:String;
Begin
 z:='1';
 g:='1';
 h:=1;
 For i:=1 to k do h:=h*2;
 For i:=1 to k do
  begin
   h:=h div 2;
   If(x<h) and(y<h) then begin y:=h-y-1;z:=tru(cong(g,'1'),z);end else
   If(x<h) and(y>=h) then begin y:=y-h;z:=cong(nhan(3,g),z);end else
   If(x>=h) and(y<h) then begin x:=2*h-x-1;y:=h-y-1;z:=cong(g,z);end else
   If(x>=h) and(y>=h) then begin x:=2*h-x-1;y:=y-h;z:=tru(cong(nhan(3,g),'1'),z);end;
   If(i<k) then g:=nhan(4,g);
  end;
Exit(z);
End;
BEGIN
	Assign(f,fi);Reset(f);
	Readln(f,k,p,q,u,v);
	Close(f);
	Assign(f,fo);Rewrite(f);
	Writeln(f,solve(p,q),' ',solve(u,v));
	Close(f);
END.

