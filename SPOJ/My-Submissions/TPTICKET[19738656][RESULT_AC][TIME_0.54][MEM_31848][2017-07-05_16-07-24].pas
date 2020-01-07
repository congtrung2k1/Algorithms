uses math;

var it,lp: array [0..4*1000000] of longint;
    m,k,n,u,v,i: longint;

procedure up(i,l,r: longint);
  var mid: longint;
  begin
      if (r < u) or (v < l) then exit;
      if (u <= l) and (r <= v) then
        begin
            inc(it[i]);
            inc(lp[2*i]);
            inc(lp[2*i+1]);
            exit;
        end;

      mid:=(l+r) div 2;
      up(2*i, l, mid);
      up(2*i+1, mid+1, r);
      it[i]:=max(it[2*i], it[2*i+1]);
  end;

function update(i,l,r: longint): longint;
  var mid: longint;
  begin
      if lp[i]<>0 then
        begin
            inc(it[i],lp[i]);
            if l<>r then
              begin
                  inc(lp[2*i],lp[i]);
                  inc(lp[2*i+1],lp[i]);
              end;
            lp[i]:=0;
        end;

      if (r < u) or (v < l) then exit(0);
      if (u <= l) and (r <= v) then exit(it[i]+1);

      mid:=(l+r) div 2;
      exit(max(update(2*i, l, mid) , update(2*i+1, mid+1, r)));
  end;

BEGIN
    read(n,k,m);

    if n=1 then
      begin
          for i:=1 to m do writeln(1);
          exit; 
      end;

    fillchar(lp,sizeof(lp),0);
    for i:=1 to m do
      begin
          read(u,v); dec(v);
          if update(1,0,n-1) > k then writeln(0)
          else begin
                   writeln(1);
                   up(1,0,n-1);
               end;
      end;
END.