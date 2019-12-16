var a: array [1..2000,1..2000] of longint;
    diem, sc, dem: array [1..1000] of longint;
    i, j, tam, max, hang, N, K, B: longint;
    f: text;

BEGIN
	assign(input,'HSG.INP'); reset(input);
	assign(output,'HSG.OUT'); rewrite(output);
  	read(N, K, B); 
  	for i:=1 to N do
		for j:=1 to K do read(f, a[i, j]);

  	for i:=1 to K do begin
      	tam:=0; 
      	for j:=1 to N do 
      		if a[j, i]=0 then inc(tam); 
      	diem[i]:=tam; 
    end;
  	
  	tam:=0; 
  	for i:=1 to N do begin 
  		tam:=0;
		for j:=1 to K do 
			if a[i, j]=1 then begin
                sc[i]:=sc[i] + diem[j]; inc(tam); 
            end;
			dem[i]:= tam;
		end;

  	max:=sc[1]; hang:=1;
  	for i:=1 to N do
    	if i<>B then begin
        	if (sc[i]>sc[B]) then inc(hang);
        	if (sc[i]=sc[B]) and (dem[i]>dem[B]) then inc(hang);
        	if (sc[i]=sc[B]) and (dem[i]=dem[B]) and (i<B) then inc(hang); 
		end;

	write(hang); close(f); 
END.