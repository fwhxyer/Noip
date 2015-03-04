program p1033;
var
 nt3,n:integer;
 a:array[0..1000]of integer;
procedure c3;
var
 i:integer;
begin
 for i:=1 to a[0] do
  a[i]:=a[i]*3;
 for i:=1 to a[0] do
  begin
   inc(a[i+1],a[i] div 10);
   a[i]:=a[i] mod 10;
  end;
 while a[a[0]+1]<>0 do
  begin
   inc(a[0]);
   inc(a[a[0]+1],a[a[0]] div 10);
   a[a[0]]:=a[a[0]] mod 10;
  end;
end;
begin
 readln(n);fillchar(a,sizeof(a),0);a[0]:=1;
if n=1 then begin writeln('1');halt; end else
begin
 if n mod 3=1 then begin nt3:=(n div 3)-1;a[1]:=4; end;
 if n mod 3=2 then begin nt3:=n div 3;a[1]:=2; end;
 if n mod 3=0 then begin nt3:=n div 3;a[1]:=1; end;
 for n:=1 to nt3 do
  c3;
 for n:=a[0] downto 1 do
 write(a[n]);
end;
end.