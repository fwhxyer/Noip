uses graph,readbmp,crt;
{�������}
var
b:TBMPInfoHeader;
p:pointer;
st:string;
gd,gm:integer;
i,j:integer;
f:text;
m,n:integer;
begin

readln(st);
readln(m,n);
gd:=detect;
initgraph(gd,gm,'');
{����BMP}
LoadBMP(st+'.bmp',b,p);
assign(f,st+'.poi');
rewrite(f);

{��ʾBMP}
DrawBMP(p, 0, 0, b.biWidth, b.biHeight, 0, 0, b.biWidth, b.biHeight, 16);
writeln(f,b.biWidth,' ',b.biHeight);
for j:=0 to m-1 do
begin
     for i:=0 to n-1 do
     write(f,getpixel(i,j):3);
     writeln(f);
end;
readkey;
end.
