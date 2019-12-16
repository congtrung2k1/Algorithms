type hs = record
       ten,lop,sdt,dtb: string[50];
     end;

     Plist = ^data;
     data = record
       x: hs;
       ne: Plist;
       kt: boolean;
     end;

var first, newp, last: Plist;
    n,s,i: longint;

procedure caua;
  var i: longint;
  begin
    write('Nhap so hoc sinh: '); readln(n); writeln;

    for i:=1 to n do
      begin
        writeln('STT: ',i);
        new(newp);
        with newp^.x do
          begin
            write('Ten: '); readln(ten);
            write('Lop: '); readln(lop);
            write('SDT: '); readln(sdt);
            write('Diem trung binh: '); readln(dtb);
          end;
        writeln;
        if first=nil then
                first:=newp
        else last^.ne:=newp;
        last:=newp; last^.ne:=nil;
      end;
  end;

procedure caub;
  var i: longint; s: string;
  begin
    writeln('Danh sach xep loai');
    writeln('-------------');

    writeln('STT':5, ' | ', 'Ho va ten':20, ' | ', 'Xep loai': 10, ' | ');
    for i:=1 to 50 do write('-'); writeln;

    newp:=first; i:=0;
    while newp<>nil do
      with newp^.x do
        begin
          inc(i); s:='';
          if dtb='10' then s:='Xuat sac' else
          case dtb of
            '0'..'2.4': s:='Kem';
            '2.5'..'4.9': s:='Yeu';
            '5'..'6.4': s:='Trung binh';
            '6.5'..'8.4': s:='Kha';
            '8.5'..'9.9': s:='Gioi';
            else s:='Error';
          end;
          writeln(i:5,' | ', ten: 20, ' | ', s: 10);
          newp := newp^.ne;
        end;
    writeln; writeln;
  end;

procedure cauc;
  var i: longint;
  begin
    newp := first;
    writeln('STT':5, ' | ', 'Ho va ten': 20,' | ', 'Lop' : 10,' | ', 'SDT': 15, ' | ', 'Diem trung binh': 5);
    for i:= 1 to 80 do write('-'); writeln;
    i := 0;
    while newp <> nil do
      with newp^.x do
        begin
          if newp^.kt = false then
          begin
            inc(i);
            writeln(i:5,' | ', ten: 20, ' | ', lop: 10, ' | ', sdt: 15, ' | ', dtb: 5);
          end else newp^.kt:=false;
          newp := newp^.ne;
        end;
    writeln; writeln;
  end;

procedure caud;
  var s,c: string;
      kq: boolean;
  begin
    writeln('Tim kiem');
    writeln('-----------------');
    write('Nhap ten: '); readln(s);
    write('Nhap lop: '); readln(c);

    kq:=false;
    newp:=first;
    while newp<>nil do
      begin
        with newp^.x do
          if ten=s then
            if lop=c then kq:=true;
        if kq=true then break;
        newp:=newp^.ne;
      end;
    if kq=true then
      begin
        writeln('Dung thong tin');
        with newp^.x do
          writeln('SDT: ',sdt);
      end
    else writeln('Sai thong tin');
    writeln;
  end;

procedure caue;
  begin
    writeln('Bo sung hoc sinh moi');
    writeln('-----------------------------');

    new(newp);
    with newp^.x do
      begin
        write('Ten: '); readln(ten);
        write('Lop: '); readln(lop);
        write('SDT: '); readln(sdt);
        write('Diem trung binh: '); readln(dtb);
      end;
    newp^.ne:=nil;
    last^.ne:=newp;
    last:=newp;
    cauc;
  end;

procedure cauff;
  var s: string;
      temp: plist;
  begin
    writeln('Xoa danh sach lop');
    writeln('-----------------------------');

    write('Nhap lop: '); readln(s);

    newp:=first^.ne; last:=first;
    with last^.x do
      if lop = s then
        begin
          first:=first^.ne;
          dispose(last);
          last:=first;
          newp:=first^.ne;
        end;
    while newp<>nil do
      with newp^.x do
        if lop=s then
          begin
            temp:=newp^.ne;
            dispose(newp);
            last^.ne:=temp;
            newp:=temp;
          end
        else
          begin
            newp:=newp^.ne;
            last:=last^.ne;
          end;
    cauc;
  end;


procedure cauf;
  var s: string;
      temp: plist;
  begin
    writeln('Xoa danh sach lop');
    writeln('-----------------------------');

    write('Nhap lop: '); readln(s);

    newp:=first;
    while newp<>nil do
      with newp^.x do
        begin
          if lop=s then newp^.kt:=true;
          newp:=newp^.ne;
        end;
    cauc;
  end;

procedure caug;
  var i,j: plist;
      t: hs;
  begin
    writeln('Sap xep');
    writeln('------------------------------');

    i:=first;
    while i^.ne<>nil do
      begin
        j:=i;
        while j<>nil do
          begin
            j:=j^.ne;
            if (i^.x.dtb < j^.x.dtb) and (j <> nil) then
              begin
                t:=i^.x; i^.x:=j^.x; j^.x:=t;
                //t:=i^.ne; i^.ne:=j^.ne; j^.ne:=t;
              end;
          end;
        if i^.ne<>nil then i:=i^.ne;
      end;
    cauc;
    writeln;
  end;

BEGIN
  caua;
  caub;
  writeln('Danh sach thong tin');
  writeln('-------------');
  cauc;
  caud;
  caue;
  cauf;
  caug;




  readln
END.