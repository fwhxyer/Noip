program ddtang;
const
 beginf=93;
var
 ansf,st,ft,s,f:real; x:string; ss,ff,code,i:integer;
begin
while true do
begin
 writeln('********************************************************************');
 writeln('���������ݣ�����+�������+����(0���ʡ�ԣ���������+/-)�����س�����');
 readln(x);s:=0;f:=0;
if length(x)<>0 then
begin
 for i:=1 to length(x)+1 do
 begin
  if ((x[i]<'0')or(x[i]>'9'))and((x[i]<>'.')and(x[i]<>'-')) then break;
  if (x[i]='-') then begin insert('-',x,i);break; end;
 end;
 val(copy(x,1,i-1),s,code);
 delete(x,1,i);
 while ((x[1]<'0')or(x[1]>'9'))and((x[1]<>'.')and(x[1]<>'-')) do
  if length(x)>0 then delete(x,1,1) else break;
 val(copy(x,1,length(x)),f,code);
 writeln('********************************************************************');
 if s-trunc(s)<=trunc(s)+1-s then begin st:=s-trunc(s);ss:=trunc(s); end else
 begin  st:=-(1-s+trunc(s));ss:=trunc(s)+1; end;
 if 2*f-trunc(2*f)<=trunc(2*f)+1-2*f then begin ft:=-2*f+trunc(2*f);ff:=trunc(2*f); end else
 begin  ft:=(1-2*f+trunc(2*f));ff:=trunc(2*f)+1; end;
 ansf:=beginf+st/0.5*2+ft/0.2*2;
 writeln;
 writeln('�ϴ���ĸ��׽Ƕ�Ϊ     ',chr(15),' ',90-ss+ff,'      ����Ϊ    ',chr(15),' ',ansf:0:0);
 writeln;
{0.5����=2����}
{0.2����=2����}
 writeln('�ϴ���İ��׽Ƕ�Ϊ     ',chr(15),' ',(90-s*2+2*f):0:0,'      ����Ϊ    ',chr(15),' ',61);
 writeln;
 writeln('30��������Ϊ                     ');
 writeln;
 writeln('********************************************************************');
end;
end;
end.