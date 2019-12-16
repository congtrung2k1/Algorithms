CONST FI='TDEPTH.INP';
      FO='TDEPTH.OUT';

VAR N: Int64;
    F: TEXT;

Procedure Init;
 Begin
 Assign(f,fi); Reset(F);
 Readln(f,n);
 Close(F);
 End;

Function Log2(N: int64):Longint;
 Begin
 Exit(Trunc(ln(N)/Ln(2)));
 End;

Procedure Try;
 Var Level,i: Longint;
     Start,TEnd,Vitri,Tmp: Int64;
     Trai:Boolean;
 Begin
 Assign(f,fo); Rewrite(F);
 If N=0 Then Begin {Writeln(f,0);} Writeln(f,1,' ',2); Close(F); Exit; End;
 Level:=Log2(N+1);
 Start:=0; tmp:=1;
 For i:=1 to Level do Tmp:=Tmp*2;
 Start:=Tmp-1; Tend:=Tmp*2-2;
 If (Start+Tend) Div 2<N Then Trai:=False Else Trai:=True;
// If Trai then Writeln(f,Trunc(N div 2)) Else Writeln(f,Trunc(N Div 2)-1);
 If Trai then Vitri:=(N-Start)*2 Else Vitri:=(N-(Start+Start div 2+1))*2+1;
 Tmp:=Tend+Vitri+1;
 Writeln(f,tmp,' ',Tmp+Start+1);
 Close(F);
 End;


Begin
 Init;
 try;
end.
