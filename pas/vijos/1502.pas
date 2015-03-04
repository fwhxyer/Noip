program p1502;
var
 o,n,m,t,i,j,k:integer;
 map,mapt:array[1..30,1..30,1..30]of int64;
begin
 readln(o,n,m);
 map[m,1,1]:=1;
 t:=0;
 while t<o do
 begin
  inc(t);
  fillchar(mapt,sizeof(mapt),0);
  for i:=1 to n do
   for j:=1 to n do
    for k:=1 to n do
     if map[i,j,k]<>0 then
     begin
      if ((i=1)and(j=1)and(k=1)) then
      begin
       mapt[i+1,j,k]:=map[i,j,k]+mapt[i+1,j,k];
       mapt[i,j+1,k]:=map[i,j,k]+mapt[i,j+1,k];
       mapt[i,j,k+1]:=map[i,j,k]+mapt[i,j,k+1];

      end else
      if ((i=n)and(j=1)and(k=1)) then
      begin
       mapt[i-1,j,k]:=map[i,j,k]+mapt[i-1,j,k];
       mapt[i,j+1,k]:=map[i,j,k]+mapt[i,j+1,k];
       mapt[i,j,k+1]:=map[i,j,k]+mapt[i,j,k+1];

      end else
      if ((i=1)and(j=n)and(k=1)) then
      begin
       mapt[i+1,j,k]:=map[i,j,k]+mapt[i+1,j,k];
       mapt[i,j-1,k]:=map[i,j,k]+mapt[i,j-1,k];
       mapt[i,j,k+1]:=map[i,j,k]+mapt[i,j,k+1];

      end else
      if ((i=1)and(j=1)and(k=n)) then
      begin
       mapt[i+1,j,k]:=map[i,j,k]+mapt[i+1,j,k];
       mapt[i,j+1,k]:=map[i,j,k]+mapt[i,j+1,k];
       mapt[i,j,k-1]:=map[i,j,k]+mapt[i,j,k-1];

      end else
      if ((i=n)and(j=n)and(k=1)) then
      begin
       mapt[i-1,j,k]:=map[i,j,k]+mapt[i-1,j,k];
       mapt[i,j-1,k]:=map[i,j,k]+mapt[i,j-1,k];
       mapt[i,j,k+1]:=map[i,j,k]+mapt[i,j,k+1];

      end else
      if ((i=n)and(j=1)and(k=n)) then
      begin
       mapt[i-1,j,k]:=map[i,j,k]+mapt[i-1,j,k];
       mapt[i,j+1,k]:=map[i,j,k]+mapt[i,j+1,k];
       mapt[i,j,k-1]:=map[i,j,k]+mapt[i,j,k-1];

      end else
      if ((i=1)and(j=n)and(k=n)) then
      begin
       mapt[i+1,j,k]:=map[i,j,k]+mapt[i+1,j,k];
       mapt[i,j-1,k]:=map[i,j,k]+mapt[i,j-1,k];
       mapt[i,j,k-1]:=map[i,j,k]+mapt[i,j,k-1];

      end else
      if ((i=n)and(j=n)and(k=n)) then
      begin
       mapt[i-1,j,k]:=map[i,j,k]+mapt[i-1,j,k];
       mapt[i,j-1,k]:=map[i,j,k]+mapt[i,j-1,k];
       mapt[i,j,k-1]:=map[i,j,k]+mapt[i,j,k-1];

      end else
      begin
       if (i=1)and(j=1) then
       begin
        mapt[i,j,k+1]:=map[i,j,k]+mapt[i,j,k+1];
        mapt[i,j,k-1]:=map[i,j,k]+mapt[i,j,k-1];

       end else
       if (i=1)and(j=n) then
       begin
        mapt[i,j,k+1]:=map[i,j,k]+mapt[i,j,k+1];
        mapt[i,j,k-1]:=map[i,j,k]+mapt[i,j,k-1];

       end else
       if (i=n)and(j=1) then
       begin
        mapt[i,j,k+1]:=map[i,j,k]+mapt[i,j,k+1];
        mapt[i,j,k-1]:=map[i,j,k]+mapt[i,j,k-1];

       end else
       if (i=n)and(j=n) then
       begin
        mapt[i,j,k+1]:=map[i,j,k]+mapt[i,j,k+1];
        mapt[i,j,k-1]:=map[i,j,k]+mapt[i,j,k-1];

       end else
       if (i=n)and(k=n) then
       begin
        mapt[i,j+1,k]:=map[i,j,k]+mapt[i,j+1,k];
        mapt[i,j-1,k]:=map[i,j,k]+mapt[i,j-1,k];

       end else
       if (i=1)and(k=n) then
       begin
        mapt[i,j+1,k]:=map[i,j,k]+mapt[i,j+1,k];
        mapt[i,j-1,k]:=map[i,j,k]+mapt[i,j-1,k];

       end else
       if (i=1)and(k=1) then
       begin
        mapt[i,j+1,k]:=map[i,j,k]+mapt[i,j+1,k];
        mapt[i,j-1,k]:=map[i,j,k]+mapt[i,j-1,k];

       end else
       if (i=n)and(k=1) then
       begin
        mapt[i,j+1,k]:=map[i,j,k]+mapt[i,j+1,k];
        mapt[i,j-1,k]:=map[i,j,k]+mapt[i,j-1,k];

       end else
       if (j=n)and(k=1) then
       begin
        mapt[i-1,j,k]:=map[i,j,k]+mapt[i-1,j,k];
        mapt[i+1,j,k]:=map[i,j,k]+mapt[i+1,j,k];

       end else
       if (j=n)and(k=n) then
       begin
        mapt[i-1,j,k]:=map[i,j,k]+mapt[i-1,j,k];
        mapt[i+1,j,k]:=map[i,j,k]+mapt[i+1,j,k];

       end else
       if (j=1)and(k=n) then
       begin
        mapt[i-1,j,k]:=map[i,j,k]+mapt[i-1,j,k];
        mapt[i+1,j,k]:=map[i,j,k]+mapt[i+1,j,k];

       end else
       if (j=1)and(k=1) then
       begin
        mapt[i-1,j,k]:=map[i,j,k]+mapt[i-1,j,k];
        mapt[i+1,j,k]:=map[i,j,k]+mapt[i+1,j,k];

       end;
      end;
     end;
  for i:=1 to n do
   for j:=1 to n do
    for k:=1 to n do
     map[i,j,k]:=mapt[i,j,k];
 end;
 writeln(map[m,1,1]);
end.


































