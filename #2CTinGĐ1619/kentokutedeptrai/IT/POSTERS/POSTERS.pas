uses math;
var a,b,c,d,it,lp: array [1..4*40000+7] of int64;
    free: array [1..4*40000+7] of boolean;
    t,n,i,dem,u,v: longint;

procedure sort(l,r: longint);
  var i,j,x,t: longint;
  begin
      i:=l; j:=r; x:=c[(l+r) div 2];
      repeat
          while c[i]<x do inc(i);
          while c[j]>x do dec(j);
          if i<=j then
            begin
                t:=c[i]; c[i]:=c[j]; c[j]:=t;
                t:=d[i]; d[i]:=d[j]; d[j]:=t;
                inc(i); dec(j);
            end;
      until i>j;
      if l<j then sort(l,j);
      if i<r then sort(i,r);
  end;

procedure input;
  var i,x,y: longint;
  begin
      read(n);
      for i:=1 to n do
        begin
            read(x,y);
            c[i]:=x; c[n+i]:=y;
            d[i]:=i; d[n+i]:=n+i;
        end;
      sort(1,2*n);

      dem:=1; a[d[1]]:=1;
      for i:=2 to 2*n do
        begin
            if c[i-1]<c[i] then inc(dem);
            if d[i]>n then b[d[i]-n]:=dem
                      else a[d[i]]:=dem;
        end;
  end;

procedure update(stt,i,l,r: longint);
  var mid: longint;
  begin
      if lp[i]<>0 then
        begin
            it[i]:=lp[i];
            if l<>r then
              begin
                  lp[2*i]:=lp[i];
                  lp[2*i+1]:=lp[i];
              end;
            lp[i]:=0;
        end;

      if (r < u) or (v < l) then exit;
      if (u <= l) and (r <= v) then
        begin
            it[i]:=stt;
            if l<>r then begin lp[2*i]:=stt; lp[2*i+1]:=stt; end;
            exit;
        end;

      mid:=(l+r) div 2;
      update(stt,2*i, l, mid);
      update(stt,2*i+1, mid+1, r);
      it[i]:=stt;
  end;

procedure find(i,l,r: longint);
  var mid: longint;
  begin
      if lp[i]<>0 then
        begin
            it[i]:=lp[i];
            if l<>r then
              begin
                  lp[2*i]:=lp[i];
                  lp[2*i+1]:=lp[i];
              end;
            lp[i]:=0;
        end;

      if l=r then
        begin
            if free[it[i]] then begin free[it[i]]:=false; inc(n); end;
            exit;
        end;

      mid:=(l+r) div 2;
      find(2*i,l,mid);
      find(2*i+1,mid+1,r);
  end;

BEGIN
    read(t);

    while t>0 do
      begin
          dec(t);

          fillchar(a,sizeof(a),0);
          fillchar(b,sizeof(b),0);
          fillchar(lp,sizeof(lp),0);
          fillchar(it,sizeof(it),0);
          fillchar(free,sizeof(free),true);
          input;
          for i:=1 to n do
            begin
                u:=a[i]; v:=b[i];
                update(i,1,1,dem);
            end;

          n:=0;
          find(1,1,dem);
          writeln(n);
      end;
END.                     