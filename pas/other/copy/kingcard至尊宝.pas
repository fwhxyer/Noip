
function getzhizunbao:integer;{&&&&&&&&&&&&&&&&&&&&&&&&&function&&&&&&&&&&&&&}
var tmp1:integer;
begin
if tmp=0 then begin
 tmp1:=21;
 repeat  inc(tmp1);
 until not bool[tmp1]; if tmp1=26 then tmp1:=13;
 bool[tmp1]:=true;
end
else begin
 repeat
  tmp1:=random(5251) mod 52;
 until not bool[tmp1];
 bool[tmp1]:=true;  end;
 exit(tmp1);
end;