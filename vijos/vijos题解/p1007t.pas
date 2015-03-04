program p1107t;
type
 node=record
  x,y,n:longint;
  end;
var
 c,r,i,j:longint;
 q:array[0..900000{0}]of longint;
 map:array[0..3000,0..3000]of boolean;
begin
 readln(c,r);
 for i:=1 to r do
 begin
  readln(tp);
  for j:=1 to c do
   if tp[j]='#' then map[i,j]:=false else begin map[1,j]:=true;bx:=i,by:=j; end;
 end;
 open:=1;closed:=0;q[1].x:=bx;q[1].y:=by;
 repeat
  inc(closed);
  f:=q[closed];
  for i:=1 to n do
   if f.
end.