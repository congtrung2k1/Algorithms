uses math;

var tr,ph,vma,vmi,a: array [0..1000000] of longint;
    n,m,r,l,i: longint;

procedure build(i,l,r: longint);
  var mid: longint;
  begin
      tr[i]:=l; ph[i]:=r;
      if l=r then
        begin
            vmi[i]:=a[l]; vma[i]:=a[l];
        end
      else begin
               mid:= (l+r) shr 1;
               build(2*i,l,mid);
               build(2*i+1,mid+1,r);
               vma[i]:=max(vma[2*i], vma[2*i+1]);
               vmi[i]:=min(vmi[2*i], vmi[2*i+1]);
           end;
  end;

function tinh(i: longint): int64;
  begin
      if (tr[i]>r) or (ph[i]<l) then exit(-100000000000000);
      if (tr[i]>=l) and (ph[i]<=r) then exit(vma[i]);
      tinh:=max(tinh(2*i), tinh(2*i+1));
      exit(tinh);
  end;

function tinh2(i: longint): int64;
  begin
      if (tr[i]>r) or (ph[i]<l) then exit(1000000000000000);
      if (tr[i]>=l) and (ph[i]<=r) then exit(vmi[i]);
      tinh2:=min(tinh2(2*i), tinh2(2*i+1));
      exit(tinh2);
  end;

BEGIN
    read(n,m);
    for i:=1 to n do read(A[i]);

    build(1,1,n);

    for i:=1 to m do
      begin
          read(l,r);
          writeln(tinh(1) - tinh2(1));
      end;
END.