program spy;
var
 st1,st2,ans:string;
 st1a,st2a:array[1..500]of longint;
 a:array[1..50]of longint;
 i:longint;
procedure errorout;
begin
 writeln('Failed');
 halt;
end;
begin
assign(input,'spy.in');
reset(input);
assign(output,'spy.out');
rewrite(output);
 fillchar(a,sizeof(a),0);
 readln(st1);
 for i:=1 to length(st1) do
  st1a[i]:=ord(st1[i])-ord('A')+1;
 readln(st2);
 for i:=1 to length(st1) do
  st2a[i]:=ord(st2[i])-ord('A')+1;
 readln(ans);
 for i:=1 to length(st1) do
  if a[st1a[i]]=0 then a[st1a[i]]:=st2a[i]
  else if a[st1a[i]]<>st2a[i] then errorout;
 for i:=1 to 26 do
  if a[i]=0 then errorout;
 for i:=1 to length(ans) do
  ans[i]:=chr(a[ord(ans[i])-ord('A')+1]+ord('A')-1);
 writeln(ans);
close(input);
close(output);
end.
