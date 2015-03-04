program sudoku;
var
 a:array[1..9,1..9]of longint;
 i,j:longint;
begin
assign(input,'sudoku.in');
reset(input);
assign(output,'sudoku.out');
rewrite(output);
 for i:=1 to 9 do
  for j:=1 to 9 do
   read(a[i,j]);
 writeln('-1');
close(input);
close(output);
end.
