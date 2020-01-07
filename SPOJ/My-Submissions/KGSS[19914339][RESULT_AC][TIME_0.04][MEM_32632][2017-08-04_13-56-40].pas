uses math;
type mang = record
          maxNum, secondNum: longint;
     end;

var it: array [1..4*1000000] of mang;
    leaf,a: array [1..100000] of longint;
    n,t,i,u,v: longint;
    tmp: mang;
    c: char;

procedure build(i,l,r: longint);
  var mid: longint;
  begin
      if l=r then
        begin
            leaf[l]:=i;
            it[i].maxNum:=a[l];
            it[i].secondNum:=-1;
            exit;
        end;
      mid:=(l+r) div 2;
      build(2*i,l,mid); build(2*i+1,mid+1,r);
      it[i].maxNum:=max(it[2*i].maxNum , it[2*i+1].maxNum);
      it[i].secondNum:=min(max(it[2*i].maxNum , it[2*i+1].secondNum) , max(it[2*i].secondNum , it[2*i+1].maxNum));
  end;

function tinh(i,l,r: longint): mang;
  var mid: longint; re,left,right: mang;
  begin
      re.maxNum:=-1; re.secondNum:=-1;
      if (v < l) or (u > r) then exit(re);
      if (u <= l) and (r <= v) then exit(it[i]);

      mid:=(l+r) div 2;
      left:=tinh(2*i,l,mid); right:=tinh(2*i+1,mid+1,r);
      re.maxNum:=max(left.maxNum , right.maxNum);
      re.secondNum:=min(max(left.maxNum , right.secondNum) , max(left.secondNum , right.maxNum));
      exit(re);
  end;

procedure update(i: longint);
  begin
      it[i].maxNum:=max(it[2*i].maxNum , it[2*i+1].maxNum);
      it[i].secondNum:=min(max(it[2*i].maxNum , it[2*i+1].secondNum) , max(it[2*i].secondNum , it[2*i+1].maxNum));
      if i>1 then update(i div 2);
  end;

BEGIN
    read(n);
    for i:=1 to n do read(A[i]);
    build(1,1,n);

    readln(t);
    while t>0 do
      begin
          dec(t);
          read(c);
          if c='Q' then
            begin
                read(c);
                read(u); readln(v);
                tmp:=tinh(1,1,n);
                writeln(tmp.maxNum + tmp.secondNum);
            end
          else
            begin
                read(c);
                read(i); readln(v);
                a[i]:=v;
                it[leaf[i]].maxNum:=v;
                update(leaf[i] div 2);
            end;
      end;
END.