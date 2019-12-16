program sdf;
uses crt;
type Arr=array[0..1001,0..1001] of char;
var A:arr;
    f:text;
    m,n,i,j,S,k:integer;
Procedure ReceiveData;
    Begin
        clrscr;
        assign(f,'C:\Users\Administrator\Desktop\doithong.txt');
        reset(f);
        readln(f,m,n);
        for i:=1 to m do
            Begin
                j:=0;
                While not eoln(f) do
                    Begin
                        j:=j+1;
                        Read(f,A[i,j]);
                    End;
                Readln(f);
            End;
    End;
Function Test(y,x:integer):Boolean;
var i,j,k,mduoi,mtren,dolech,goc,than,ngon,trai,phai:integer;
Begin
    Test:=True;
	i:=y;j:=x;goc:=i;than:=i-1;mduoi:=0;mtren:=0;trai:=0;phai:=0;
		for i:=y downto 0 do
		If A[i-1,j]<>'@' then
			Begin
				ngon:=i;
				Break;
			End;
	If (A[ngon,j-1]<>'@') and (A[ngon,j+1]<>'@') then
		Begin
			If (ngon=goc-1) then Test:=True
				Else
					Begin
						For k:=j downto 0 do
							If A[than,k]='@' then mduoi:=mduoi+1 Else Break;
						For k:=j to n do
							If A[than,k]='@' then phai:=phai+1 Else Break;
						If mduoi=phai then
							Begin
								For k:=j downto 0 do
									If A[than-1,k]='@' then mtren:=mtren+1 Else Break;
								DoLech:=abs(mduoi-mtren);
								For i:=than-1 downto ngon do
									Begin
                                        trai:=0;phai:=0;
										For k:=j downto 0 do
											If A[i,k]='@' then trai:=trai+1 Else Break;
										If trai=mduoi-Dolech then
											Begin
                                                mduoi:=trai;
												For k:=j to n do
													If A[i,k]='@' then phai:=phai+1 Else Break;
												If phai<>trai then Test:=False;
											End
										Else Test:=False;
									End;
							End
						Else Test:=False;
					End;
		End;
End;
Begin
    Receivedata;
    Writeln;
	S:=0;
	For i:=1 to m do
		For j:=1 to n do
			If (A[i,j]='@') and (A[i+1,j]<>'@') and (A[i,j-1]<>'@') and (A[i,j+1]<>'@') and (A[i-1,j]='@') then
                If Test(i,j)=True then S:=S+1;
	Write('So cay trong anh la: ',S);
	Readln
End.

