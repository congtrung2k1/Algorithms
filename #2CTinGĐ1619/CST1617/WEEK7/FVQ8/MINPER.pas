const fi='MINPER.inp';
      fo='MINPER.out';
      maxN=10010;

var     n,i,t,tmp:longint;
        flag:boolean;
        free:array[0..maxN] of boolean;
	a,pos:array[0..maxN] of longint;
        F: TEXT;


Procedure Init;
 Begin
 Assign(F,fI); Reset(F);
 Readln(F,n);
 For i:=1 to n do
  begin
  read(F,a[i]); pos[a[i]]:=i;
  end;
 Close(F);
 End;

Procedure Try;
 Begin
 fillchar(free,sizeof(free),true);
 for i:=1 to n do
  if (pos[a[i]-1]>i) and (Free[i]) then
   begin
   t:=pos[a[i]-1];
   tmp:=a[t]; a[t]:=a[i]; a[i]:=tmp;
   Free[t]:=false;
   end;
 Assign(F,FO); Rewrite(F);
 For i:=1 to n do Write(F,a[i],' ');
 Close(F);
end;


Begin
 Init;
 TRy;
End.
