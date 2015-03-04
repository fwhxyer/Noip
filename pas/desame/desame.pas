program desame;
var
 num,s,hash,tmp,auc:string;
 input1,output1,f1,f2:text;
begin
assign(f2,'F:\信息学\pas\desame\p.txt');
reset(f2);
while not eof(f2) do
begin
 readln(f2,num);
 assign(f1,'F:\信息学\pas\desame\input.in');
 reset(f1);
 readln(f1,hash);
 readln(f1,tmp);
 close(f1);
 assign(f1,'F:\信息学\pas\desame\lastin.txt');
 reset(f1);
 readln(f1,auc);
 close(f1);
 hash:=hash+'p'+num+tmp;
 assign(input1,hash);
 reset(input1);
 s:='F:\信息学\pas\desame\test\p'+num+tmp;
 assign(output1,s);
 rewrite(output1);
 while not eof(input1) do
 begin
  readln(input1,tmp);
  writeln(output1,tmp+'{'+auc+'}');
 end;
 close(input1);
 close(output1);
end;
close(f2);
end.
