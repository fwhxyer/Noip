program p1078;
var
 i,j,e,n,m:longint;
 bool:array[1..200]of boolean;
begin
 fillchar(bool,sizeof(bool),0);
 readln(n);
 readln(m);
 for i:=1 to n do bool[i]:=true;
 e:=1;
 j:=0;
 while e<=m do
 begin
  i:=0;
  while (i<=(e*e*e)mod 5+1)and(j<n) do
  begin
   inc(j);
   if bool[j] then
   begin
    inc(i);
   end;
  end;
  if j=n then j:=0 else
  begin
   bool[j]:=false;
   inc(e);
  end;
 end;
 writeln(j);
end.
