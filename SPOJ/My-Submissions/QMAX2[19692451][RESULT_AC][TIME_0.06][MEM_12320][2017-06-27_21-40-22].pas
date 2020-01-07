uses math;

var a,v,lp: array [1..1000000] of longint;
    n,m,i,j,l,r,x,u,uu,k: longint;

procedure down(i: longint);
  var t: longint;
  begin
      t:=lp[i];

      inc(lp[2*i],lp[i]);
      inc(v[2*i],lp[i]);

      inc(lp[2*i+1],lp[i]);
      inc(v[2*i+1],lp[i]);

      lp[i]:=0;
  end;

procedure update(i,l,r: longint);
  var mid: longint;
  begin
      if (r < u) or (uu < l) then exit;
      if (u <= l) and (r <= uu) then
        begin
            inc(lp[i],k);
            inc(v[i],k);
            exit;
        end;

      down(i);

      mid:=(l+r) div 2;
      update(2*i,l,mid);
      update(2*i+1,mid+1,r);

      v[i]:=max(v[2*i],v[2*i+1]);
  end;

function tinh(i,u,uu: longint): longint;
  var mid: longint;
  begin
      if (uu < l) or (r < u) then exit(0);
      if (l <= u) and (uu <= r) then exit(v[i]);

      down(i);
      mid:=(u+uu) div 2;
      exit(max(tinh(2*i, u, mid), tinh(2*i+1, mid+1, uu)));
  end;

BEGIN
    fillchar(lp,sizeof(lp),0);

    read(n,m);

    for i:=1 to m do
      begin
          read(x);
          if x=0 then
            begin
                read(u,uu,k);
                update(1,1,n);
            end
          else begin
                   read(l,r);
                   writeln(tinh(1,1,n));
               end;
      end;
END.