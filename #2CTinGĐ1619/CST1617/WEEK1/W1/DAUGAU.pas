Program DAUGAU;
Uses math;
Const
    fi='DAUGAU.INP';
    fo='DAUGAU.OUT';
Type
    List_data=record
        x1,x2,y1,y2,mini : LongInt; End;

Var
    g,f : Text;
    finishi,finishj,N,M,i,j,l,r,D,kq,maxi,maxi2 : LongInt;
    List: Array[0..501] of List_data;
    swap : List_data;
    dk  : Boolean;

Procedure DocFile;
    Begin
        Assign(f,fi);
        Reset(f);
        Readln(f,finishi,finishj);
        Readln(f,N);
        For i:=1 to N do
            Begin
                Readln(f,List[i].x1,List[i].y1,List[i].x2,List[i].y2);
                maxi:=max(abs(List[i].x1),abs(List[i].y1));
                maxi2:=max(abs(List[i].y2),abs(List[i].x2));
                List[i].mini:=min(maxi,maxi2);
            End;
        Close(f);
    End;

Procedure Sort;
    Begin
        For i:=1 to N-1 do
            For j:=i+1 to N do
                if List[i].mini>List[j].mini then
                    Begin
                        swap:=List[i];
                        List[i]:=List[j];
                        List[j]:=swap;
                    End;
    End;

Function Check (x : LongInt) : Boolean;
    Var xtren,xduoi,ytren,yduoi,xu,yu,xv,yv : LongInt;
        dk2,dk1 : Boolean;
    Begin
        xtren:=0-x;
        ytren:=x;
        xduoi:=x;
        yduoi:=0-x;
        For i:=1 to N do
            Begin
                xu:=List[i].x1;
                yu:=List[i].y1;
                xv:=List[i].x2;
                yv:=List[i].y2;
                dk1:=(xu>xtren) and (xu<xduoi) and (yu<ytren) and (yu>yduoi);
                dk2:=(xv>xtren) and (xv<xduoi) and (yv<ytren) and (yv>yduoi);
                if not dk1 and not dk2 then continue;
                if dk1 then
                    Begin
                        xu:=xv;
                        yu:=yv;
                    End;
                if xu<xtren then xtren:=xu;
                if xu>xduoi then xduoi:=xu;
                if yu>ytren then ytren:=yu;
                if yu<yduoi then yduoi:=yu;
            End;
        if (finishi>=xtren) and (finishi<=xduoi) and (finishj<=ytren) and (finishj>=yduoi) then exit(false);
        exit(true);
    End;

Procedure XuLy;
    Begin
        Sort;
        l:=1; r:=max(finishi,finishj);
        kq:=0;
        Repeat
            D:=(l+r) div 2;
            dk:=Check(D);
            if dk then
                Begin
                    kq:=D;
                    l:=D+1;
                End else r:=D-1;
        Until l>r;
    End;

Procedure GhiFile;
    Begin
        Assign(g,fo);
        Rewrite(g);
        Write(g,kq);
        Close(g);
    End;

Begin
    DocFile;
    XuLy;
    GhiFile;
End.





