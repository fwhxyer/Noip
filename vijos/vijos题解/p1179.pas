program p1179;
var
 ans,n,m,i:longint;
 biaoq:char;
 ansq,q:array[0..11]of longint;
function found(a:longint):longint;
var
 i,j:longint;
 f:array[0..50000]of boolean;
 g:array[0..50000]of integer;
begin
 fillchar(f,sizeof(f),0);
 fillchar(g,sizeof(g),0);
 i:=1;f[1]:=true;g[1]:=1;f[0]:=true;
 while i>0 do
 begin
  inc(i);
  for j:=1 to a do
  begin
   if (i-q[j]>=0)and(g[i-q[j]]<n) then
    if not f[i] then begin
     if (f[i-q[j]])then
      begin f[i]:=f[i-q[j]];g[i]:=g[i-q[j]]+1;end
    end else if g[i-q[j]]+1<g[i] then g[i]:=g[i-q[j]]+1;
  end;
  if not f[i] then exit(i);
 end;
end;
procedure try(a:longint);
var
 r,i:longint;
begin
 r:=found(a);if r-1>ans then begin ans:=r-1;for i:=1 to a do begin ansq[0]:=a;ansq[i]:=q[i]; end; end;
 if a<m then
  for i:=r downto q[a]+1 do
  begin
   q[a+1]:=i;
   try(a+1);
   q[a+1]:=0;
  end;
end;
begin
assign(input,'c:\tmp.txt');
reset(input);
readln(biaoq);
close(input);
assign(output,'c:\a1.pas');
rewrite(output);
writeln('program p1179;');writeln('var n,m:longint;');writeln('begin');writeln('readln(n,m);');
for n:=1 to 10 do
 for m:=1 to 10 do
  if m+n<=10 then
begin
 q[1]:=1;ans:=1;ansq[0]:=1;ansq[1]:=1;
 try(1);
 write('if (n=',n,')and(m=',m,') then begin writeln(',biaoq);
 for i:=1 to ansq[0] do write(ansq[i],' ');
 writeln(biaoq,');'); write('writeln(',biaoq);
 write('MAX=',ans); writeln(biaoq,'); end;');
end;
writeln('end.');
close(output);
end.




















