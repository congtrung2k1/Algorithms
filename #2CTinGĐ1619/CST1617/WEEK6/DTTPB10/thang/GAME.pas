Const fi='GAME.INP';
        fo='GAME.OUT';
Type ly=record x,y,z:Integer;d:Longint;end;
Var dd:Array[0..250,0..250,0..250] Of Boolean;
        q:Array[1..250*250*250] Of ly;
        a,b,c:Integer;
        ans:Longint;
        f,g:Text;
Procedure Data;
Begin
        Assign(f,fi);Reset(f);
        Assign(g,fo);Rewrite(g);
        Readln(f,a,b,c);
End;
Procedure Solve;
Var u,v,k:Integer;
        cnt,first,last:Longint;
Begin
        q[1].x:=a;q[1].y:=b;q[1].z:=c;first:=1;last:=1;
        Fillchar(dd,sizeof(dd),True);
        dd[a,b,c]:=False;
        ans:=0;
        Repeat
                u:=q[first].x;v:=q[first].y;k:=q[first].z;cnt:=q[first].d;inc(first);
                If u>v then
                begin
                        If(dd[u-v,v,k]) then
                        begin
                                inc(last);
                                q[last].x:=u-v;q[last].y:=v;q[last].z:=k;q[last].d:=cnt+1;
                                dd[q[last].x,q[last].y,q[last].z]:=False;
                                If (q[last].x=q[last].y)and (q[last].y=q[last].z) then begin ans:=cnt+1;break;end;
                        end;
                end;
                If(u<v) then
                begin
                        If(dd[u,v-u,k]) then
                        begin
                                inc(last);
                                q[last].x:=u;q[last].y:=v-u;q[last].z:=k;q[last].d:=cnt+1;
                                dd[q[last].x,q[last].y,q[last].z]:=False;
                                If (q[last].x=q[last].y)and (q[last].y=q[last].z) then begin ans:=cnt+1;break;end;
                        end;
                end;
                If(u>k) then
                begin
                        If(dd[u-k,v,k]) then
                        begin
                                inc(last);
                                q[last].x:=u-k;q[last].y:=v;q[last].z:=k;q[last].d:=cnt+1;
                                dd[q[last].x,q[last].y,q[last].z]:=False;
                                If (q[last].x=q[last].y)and (q[last].y=q[last].z) then begin ans:=cnt+1;break;end;
                        end;
                end;
                If(u<k) then
                begin
                        If(dd[u,v,k-u]) then
                        begin
                                inc(last);
                                q[last].x:=u;q[last].y:=v;q[last].z:=k-u;q[last].d:=cnt+1;
                                dd[q[last].x,q[last].y,q[last].z]:=False;
                                If (q[last].x=q[last].y)and (q[last].y=q[last].z) then begin ans:=cnt+1;break;end;
                        end;
                end;
                If(v>k) then
                begin
                        If(dd[u,v-k,k]) then
                        begin
                                inc(last);
                                q[last].x:=u;q[last].y:=v-k;q[last].z:=k;q[last].d:=cnt+1;
                                dd[q[last].x,q[last].y,q[last].z]:=False;
                                If (q[last].x=q[last].y)and (q[last].y=q[last].z) then begin ans:=cnt+1;break;end;
                        end;
                end;
                If(v<k) then
                begin
                        If(dd[u,v,k-v]) then
                        begin
                                inc(last);
                                q[last].x:=u;q[last].y:=v;q[last].z:=k-v;q[last].d:=cnt+1;
                                dd[q[last].x,q[last].y,q[last].z]:=False;
                                If (q[last].x=q[last].y)and (q[last].y=q[last].z) then begin ans:=cnt+1;break;end;
                        end;
                end;
        Until first>last;
        Writeln(g,ans);
End;
BEGIN
        Data;
        Solve;
        Close(f);Close(g);
END.