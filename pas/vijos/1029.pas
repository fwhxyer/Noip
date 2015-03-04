program p1029;
type
 ss=string[9];
var
 i,j,p,pt,tmp,step,head,tail:longint;
 s,outdata,outdatat:ss;  ok:boolean;
 link:array[1..400000]of ss;
 num:array[1..400000]of integer;
 hash:array[0..400000]of boolean;
function hashnum(st:ss):longint;
var
 i,j,ans,num:longint;
begin
 ans:=0;
 for i:=1 to 8 do
  begin
  num:=0;
  for j:=i+1 to 9 do if st[i]>st[j] then inc(num);
  ans:=(ans+num)*(9-i);
  end;
 hashnum:=ans;
end;
function change(st:ss;a,b:integer):ss;
var temp:string[1];
begin
 temp[0]:=chr(1);
 temp[1]:=st[a];
 st[a]:=st[b];
 st[b]:=temp[1];
 change:=st;
end;
function destin(st:ss):boolean;
var
 i,j,s:integer;
 c:array[1..9]of integer;
begin
 for i:=1 to 9 do
  c[i]:=ord(st[i])-48;
 for i:=0 to 2 do
 begin
  s:=0;
  for j:=1 to 3 do
  begin
   s:=s+c[i*3+j];
  end;
  if s<>15 then exit(false);
  s:=0;
  for j:=1 to 3 do
  begin
   s:=s+c[j*3-2+i];
  end;
  if s<>15 then exit(false);
 end;
 if (c[1]+c[5]+c[9]<>15)or(c[3]+c[5]+c[7]<>15)then exit(false);
 destin:=true;
end;
begin{main}
for j:=1 to 50 do
begin
 fillchar(hash,sizeof(hash),0);s:='';outdata:='';ok:=false;
 for i:=1 to 3 do
 begin
 readln(outdata);
 s:=s+outdata[1]+outdata[3]+outdata[5];
 end;
 if destin(s) then
 begin
  writeln('0');
 end
 else begin
  tail:=0;head:=1;hash[hashnum(s)]:=true;
  link[head]:=s;num[head]:=0;
  repeat
   inc(tail);
   outdata:=link[tail];
   step:=num[tail]+1;
   for i:=1 to 12 do
   begin
    case i of
     1:begin p:=1;pt:=2; end;
     2:begin p:=2;pt:=3; end;
     3:begin p:=4;pt:=5; end;
     4:begin p:=5;pt:=6; end;
     5:begin p:=7;pt:=8; end;
     6:begin p:=8;pt:=9; end;
     7:begin p:=1;pt:=4; end;
     8:begin p:=2;pt:=5; end;
     9:begin p:=3;pt:=6; end;
     10:begin p:=4;pt:=7; end;
     11:begin p:=5;pt:=8; end;
     12:begin p:=6;pt:=9; end;
    end;
    outdatat:=change(outdata,p,pt);
    tmp:=hashnum(outdatat);
    if not(hash[tmp]) then
    begin
     inc(head);
     link[head]:=outdatat;
     num[head]:=step;
     hash[tmp]:=true;
     if destin(link[head]) then
     begin
      writeln(num[head]);
      ok:=true;
     end;
    end;
    if ok then break;
   end;
  until (tail>=head)or ok;
  if not ok then writeln(-1);
 end;
end;
 for i:=1 to 1000000 do
end.
