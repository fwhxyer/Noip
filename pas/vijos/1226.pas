program p1226;
var
 map:array[0..201,0..201]of char;
 x,y,i,j,k,l,m,n,tt,w,c:integer;
 num:integer;
 st:string;
begin
 readln(y,x);
 for j:=1 to y do
 begin
  for i:=1 to x-1 do
   read(map[i,j]);
  readln(map[x,j]);
 end;
 readln(n);
 for i:=1 to n do
 begin
  readln(st);
  if st='NORTH' then num:=1
   else if st='SOUTH' then num:=2
   else if st='WEST' then num:=3
   else if st='EAST' then num:=4;
  case num of
   1:begin
      for k:=1 to x do
      begin
      tt:=y;
      while tt>1 do
      begin
       j:=tt;
       while (j<>0)and(map[k,j]<>'*') do dec(j);
       if j<>0 then
       begin
        map[k,j]:='.';
        dec(j);
        l:=j;
        while (l<>0)and(map[k,l]<>'X') do dec(l);
        inc(l);
        for m:=l to j do
         map[k,m]:='*';
       end;
       if j<>0 then tt:=l-1 else tt:=1;
      end;
      end;
     end;
   2:begin
      for k:=1 to x do
      begin
      tt:=1;
      while tt<y do
      begin
       j:=tt;
       while (j<>y+1)and(map[k,j]<>'*') do inc(j);
       if j<>y+1 then
       begin
        map[k,j]:='.';
        inc(j);
        l:=j;
        while (l<>y+1)and(map[k,l]<>'X') do inc(l);
        dec(l);
        for m:=j to l do
         map[k,m]:='*';
       end;
       if j<>y+1 then tt:=l+1 else tt:=y;
      end;
      end;
     end;
   3:begin
      for k:=1 to y do
      begin
      tt:=x;
      while tt>1 do
      begin
       j:=tt;
       while (j<>0)and(map[j,k]<>'*') do dec(j);
       if j<>0 then
       begin
        map[j,k]:='.';
        dec(j);
        l:=j;
        while (l<>0)and(map[l,k]<>'X') do dec(l);
        inc(l);
        for m:=l to j do
         map[m,k]:='*';
       end;
       if j<>0 then tt:=l-1 else tt:=1;
      end;
      end;
     end;
   4:begin
      for k:=1 to y do
      begin
      tt:=1;
      while tt<x do
      begin
       j:=tt;
       while (j<>x+1)and(map[j,k]<>'*') do inc(j);
       if j<>x+1 then
       begin
        map[j,k]:='.';
        inc(j);
        l:=j;
        while (l<>x+1)and(map[l,k]<>'X') do inc(l);
        dec(l);
        for m:=j to l do
         map[m,k]:='*';
       end;
       if j<>x+1 then tt:=l+1 else tt:=x;
      end;
      end;
     end;
  end;
 for w:=1 to y do
 begin
  for c:=1 to x do
   write(map[c,w]);
  writeln;
 end;
 end;
 for i:=1 to y do
 begin
  for j:=1 to x do
   write(map[j,i]);
  writeln;
 end;
end.
