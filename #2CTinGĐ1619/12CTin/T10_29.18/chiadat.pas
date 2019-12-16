uses math;
var a: array [0..501,0..501] of longint;
    n,i,j,s1,s2,s3,s4,ans: longint;

BEGIN
	assign(input,'chiadat.inp'); reset(input);
	assign(output,'chiadat.out'); rewrite(output);

	read(n);
	for i:=1 to n do for j:=1 to n do begin
		read(a[i,j]);
		a[i,j]:= a[i,j] + a[i-1][j] + a[i][j-1] - a[i-1][j-1];
	end;

	ans:= 500 * 500;
	for i:=1 to n-1 do for j:=1 to n-1 do begin
		s1:= a[i][j];
		s2:= a[i][n] - a[i][j];
		s3:= a[n][j] - a[i][j];
		s4:= a[n][n] + a[i][j] - a[i][n] - a[n][j];
		ans:= min(ans, max(s1,max(s2,max(s3,s4))) - min(s1,min(s2,min(s3,s4))));
	end;
	writeln(ans);
END.
