program backsentenseprogram;
var
 n:string;
 function backsent(n:string):boolean;
 var i,j:integer;
 begin
  i:=1;j:=length(n);
  while i<j do begin
   if n[i]<>n[j] then exit(false);inc(i);dec(j); end;
  exit(true);
 end;
begin
 readln(n);
 writeln(backsent(n));
end.