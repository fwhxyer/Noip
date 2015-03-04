{$S-}
program p1146;
var
 map:array[1..25]of boolean;
 bool:array[1..25,1..25]of boolean;
 ans:array[1..25]of integer;
 i:integer;
procedure tongji;
var
 time,s,i:integer;bt1,bt2:boolean;
 heng:array[0..4]of boolean;
 shu:array[0..4]of boolean;
begin
 s:=0;time:=0;bt1:=true;bt2:=true;
 fillchar(heng,sizeof(heng),true);
 fillchar(shu,sizeof(shu),true);
 for i:=1 to 25 do
  if map[i] then inc(s);
 if s<>0 then
 begin
  for i:=1 to 25 do
  begin
   if not map[i] then
   begin
    heng[(i-1) div 5]:=false;
    shu[i mod 5]:=false;
    if (i mod 6)=1 then bt1:=false;
    if (i mod 4)=1 then bt2:=false;
   end;
  end;
  for i:=0 to 4 do
  begin
   if heng[i] then inc(time);
   if shu[i] then inc(time);
  end;
  if bt1 then inc(time);
  if bt2 then inc(time);
  if time<>0  then
   if not bool[s,time] then
   begin
    inc(ans[s],time);
    bool[s,time]:=true;
   end;
 end;
end;
procedure fang(n:integer);
begin
 if n>=26 then tongji else
 begin
  map[n]:=false;
  fang(n+1);
  map[n]:=true;
  fang(n+1);
 end;
end;
begin
assign(output,'c:\aa.txt');
rewrite(output);
 fillchar(ans,sizeof(ans),0);
 fillchar(map,sizeof(map),0);
 fillchar(bool,sizeof(bool),0);
 fang(1);
 write('ans=(');
 for i:=5 to 25 do
  write(ans[i],',');
 writeln(')');
close(output);
end.
