program chuli;
var
 code,i,j,a1,temp,sll:integer;
 a,b:array[0..10000]of integer;
 st:ansistring;
procedure found(a:integer);
var i:integer;
begin for i:=1 to j+10 do if b[i]=a then exit; write(a,' ');inc(sll); end;
procedure init;   var input:text;
begin
 sll:=0;
 assign(input,'F:\信息学\pas\chuli\other.txt');
 reset(input);
 readln(input,st);st:=st+'pp';
 temp:=length(st);j:=0;i:=1;
 while i<=temp-4 do
  begin
    a1:=ord(st[i]);
    if (a1<ord('0'))or(a1>ord('9')) then inc(i) else
     begin
      inc(i,4);
      val(copy(st,i-4,4),a[j],code);
      inc(j);
     end;
  end;
 a[0]:=j;
 close(input);
 assign(input,'F:\信息学\pas\chuli\own.txt');
 reset(input);
 readln(input,st);st:=st+'pp';
 temp:=length(st);j:=0;i:=1;
 while i<=temp-4 do
  begin
    a1:=ord(st[i]);
    if (a1<ord('0'))or(a1>ord('9')) then inc(i) else
     begin
      inc(i,4);
      val(copy(st,i-4,4),b[j],code);
      inc(j);
     end;
  end;
 b[0]:=j;
 close(input);
end;
begin
 init;
 for a1:=1 to a[0] do
  begin
   found(a[a1]);
  end;
 writeln;
 writeln('The All Number: ',sll);
 writeln('All others Number:',a[0],'.     ALL own Number:',b[0],'.');
 readln;
end.
