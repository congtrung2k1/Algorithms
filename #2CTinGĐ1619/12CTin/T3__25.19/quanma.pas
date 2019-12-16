const mang1:array[1..8] of integer=(1,2,2,1,-1,-2,-2,-1);
      mang2:array[1..8] of integer=(-2,-1,1,2,2,1,-1,-2);

var i,n,m,xstart,xend,ystart,yend,rear,front,x,y:longint;
    a,b,bac:array[1..1000000]of longint;
    free:array[1..1000,1..1000] of boolean;

BEGIN
    assign(input,'quanma.inp'); reset(input);
    assign(output,'quanma.out'); rewrite(output);

    read(n,m,xstart, ystart,xend,yend);

    fillchar(free,sizeof(free),true);
    a[1]:=xstart;
    b[1]:=ystart;
    bac[1]:=0;
    front:=1;
    rear:=1;
    free[xstart,ystart]:=false;
    x:=xstart; 
    y:=ystart;

    while front <= rear do begin
        for i:=1 to 8 do begin
            if (x + mang1[i] > 0) and (x + mang1[i] <= m) and (y + mang2[i] > 0) and (y + mang2[i] <= n)
            and (free[x + mang1[i] , y + mang2[i]]) then begin
                inc(rear);
                a[rear]:=x + mang1[i];
                b[rear]:=y + mang2[i];
                free[a[rear] , b[rear]]:= false;
                bac[rear]:= bac[front] + 1;

                if (a[rear] = xend) and (b[rear] = yend) then begin
                    write(bac[rear]);
                    exit;
                end;
            end;
        end;

        inc(front);
        x:=a[front];
        y:=b[front];
    end;

    write(-1);

END.
