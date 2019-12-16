//Pham Minh Duc
Program KOL;
Uses math;
Const
    fi='KOL.INP';
    fo='KOL.OUT';
    inf=1000000000;
Var
    g,f : Text;
    N,i,j,M,C,gt,tmp,s,t,tong,test : LongInt;
    Fx,Lazy : Array[0..9000001] of LongInt;

Procedure Update (x,l,r,u,v : LongInt);
    Var mid : LongInt;
    Begin
        inc(Fx[x],Lazy[x]);
        inc(Lazy[x+x],Lazy[x]);
        inc(Lazy[x+x+1],Lazy[x]);
        Lazy[x]:=0;
        if (u>r) or (v<l) then exit;
        if (u<=l) and (r<=v) then
            Begin
                inc(Lazy[x+x],gt);
                inc(Lazy[x+x+1],gt);
                inc(Fx[x],gt);
                exit;
            End;
        mid:=(l+r) div 2;
        Update(x+x,l,mid,u,v);
        Update(x+x+1,mid+1,r,u,v);
        Fx[x]:=max(Fx[x+x],Fx[x+x+1]);
    End;

Procedure Get (x,l,r,u,v : LongInt);
    Var mid : LongInt;
    Begin
        inc(Fx[x],Lazy[x]);
        inc(Lazy[x+x],Lazy[x]);
        inc(Lazy[x+x+1],Lazy[x]);
        Lazy[x]:=0;
        if (u>r) or (v<l) then exit;
        if (u<=l) and (r<=v) then
            Begin
                tmp:=max(tmp,Fx[x]);
                exit;
            End;
        mid:=(l+r) div 2;
        Get(x+x,l,mid,u,v);
        Get(x+x+1,mid+1,r,u,v);
        Fx[x]:=max(Fx[x+x],Fx[x+x+1]);
    End;

Begin
    Assign(f,fi); Reset(f);
    Assign(g,fo); Rewrite(g);
    //--------------//
    Readln(f,N,tong,test);
    For test:=1 to test do
        Begin
            Readln(f,s,t,gt);
            tmp:=0;
            if s=t then
                Begin
                        Writeln(g,'T');
                        continue;
                End;
            Get(1,1,N,s,t-1);
            tmp:=tong-tmp;
            if tmp<gt then
                Begin
                    Writeln(g,'N');
                    continue;
                End;
            Writeln(g,'T');
            if s=t then continue;
            Update(1,1,N,s,t-1);
        End;
    //--------------//
    Close(f);
    Close(g);
End.
