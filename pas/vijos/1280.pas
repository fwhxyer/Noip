program p1280;
var
 n,i,j,k:integer;
 wakeas:array[0..60,0..60]of integer;
 bool:array[0..60,0..60,-5000..5000]of boolean;
begin
 readln(n);
 for i:=1 to 2*n-1 do
  for j:=1 to n-abs(n-i) do
   read(wakeas[i,j]);
 fillchar(bool,sizeof(bool),0);
 bool[1,1,wakeas[1,1]]:=true;
 bool[1,1,-wakeas[1,1]]:=true;
 for i:=1 to 2*n-2 do
  for j:=1 to n-abs(n-i) do
   for k:=-50*(i+1) to 50*(i+1) do
   if bool[i,j,k]then
   begin
    if i<n then
    begin
     bool[i+1,j,k+wakeas[i+1,j]]:=true;
     bool[i+1,j,k-wakeas[i+1,j]]:=true;
     bool[i+1,j+1,k+wakeas[i+1,j+1]]:=true;
     bool[i+1,j+1,k-wakeas[i+1,j+1]]:=true;
    end else
    begin
     if j<>1 then
     begin
      bool[i+1,j-1,k+wakeas[i+1,j-1]]:=true;
      bool[i+1,j-1,k-wakeas[i+1,j-1]]:=true;
     end;
     if j<>n-abs(n-i) then
     begin
      bool[i+1,j,k+wakeas[i+1,j]]:=true;
      bool[i+1,j,k-wakeas[i+1,j]]:=true;
     end;
    end;
   end;
 for i:=0 downto -5000 do
  if bool[2*n-1,1,i] then break;
 for j:=0 to 5000 do
  if bool[2*n-1,1,j] then break;
 if abs(i)>j then write(j) else write(-i);
 for i:=1 to 1000 do

end.



























end.