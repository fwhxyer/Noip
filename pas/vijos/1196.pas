program p1196;
const
 num:set of byte=([2,3,7,8]);
var
 strin:ansistring;
 code,i,num1,num2:integer;
begin
 for i:=1 to 10 do
 begin
  readln(strin);
  val(strin[pos(' ',strin)-1],num1,code);
  val(strin[length(strin)],num2,code);
  if (num1 in num)and(num2 in num) then
   writeln('Shadow')
   else writeln('Matrix67');
 end;
end.
