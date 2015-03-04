program p1107;
const t:array[1..2,1..4]of integer=((0,1,0,-1),(1,0,-1,0));
var
 tf:ansistring;
 m,n,i,j,ans,maxans,mx,my,mx1,my1:longint;
 map,mt:array[0..1010,0..1010]of boolean;
//---------------------------------------------------
procedure try1(a,b:integer);
var i,aa,bb:integer;
begin
 inc(ans);map[a,b]:=false;
 if ans>maxans then begin maxans:=ans;mx1:=a;my1:=b; end;
 for i:=1 to 4 do
 begin
  aa:=a+t[1,i];bb:=b+t[2,i];
  if (aa>0)and(aa<=n)and(bb>0)and(bb<=m)and(map[aa,bb]) then
   try1(aa,bb);
// map[a,b]:=false;
 end;
 dec(ans);
end;
//---------------------------------------------------
begin
 readln(m,n);
 for i:=1 to n do
  begin
   readln(tf);
   for j:=1 to m do
    if tf[j]='#' then map[i,j]:=false else begin map[i,j]:=true;mx:=i;my:=j;end;
  end;
//---------------------------------------------------
 ans:=0;
 mt:=map;
 try1(mx,my);
 ans:=0;
 map:=mt;
 try1(mx1,my1);
 writeln(maxans-1);
end.
