var light: array [1..4*100000] of boolean;
    sl: array [1..4*100000] of longint;
    n,m,i,x,u,v: longint;

procedure update(i,l,r: longint);
  var mid: longint;
  begin
      if l>r then exit;

      if light[i] then
        begin
            sl[i]:=abs(r-l+1 - sl[i]);
            if l<>r then
              begin
                  light[2*i]:=not light[2*i];
                  light[2*i+1]:=not light[2*i+1];
              end;
            light[i]:=false;
        end;

      if (r < u) or (v < l) then exit;
      if (u <= l) and (r <= v) then
        begin
            sl[i]:=abs(r-l+1 - sl[i]);
            if l<>r then
              begin
                  light[2*i]:=not light[2*i];
                  light[2*i+1]:=not light[2*i+1];
              end;
            exit;
        end;

      mid:=(l+r) div 2;
      update(2*i, l, mid);
      update(2*i+1, mid+1, r);

      sl[i]:=sl[2*i] + sl[2*i+1];
  end;

function get(i,l,r: longint): longint;
  var  mid: longint;
  begin
      if l>r then exit(0);

      if light[i] then
        begin
            sl[i]:=abs(r-l+1 - sl[i]);
            if l<>r then
              begin
                  if light[2*i]<>true then light[2*i]:=true else light[2*i]:=false;
                  if light[2*i+1]<>true then light[2*i+1]:=true else light[2*i+1]:=false;
              end;
            light[i]:=false;
        end;

      if (r < u) or (v < l) then exit(0);
      if (u <= l) and (r <= v) then exit(sl[i]);

      mid:=(l+r) div 2;
      exit(get(2*i,l,mid) + get(2*i+1, mid+1, r));
end;

BEGIN
    read(n,m);
    fillchar(light,sizeof(light),false);
    fillchar(sl,sizeof(sl),0);

    for i:=1 to m do
      begin
          read(x);
          if x=0 then
            begin
                read(u,v);
                update(1,1,n);
            end
          else begin
                   read(u,v);
                   writeln(get(1,1,n));
               end;
      end;
END.