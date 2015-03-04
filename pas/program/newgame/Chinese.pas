Unit Chinese;

interface

Uses Graph;
procedure OutChinese(x,y:integer;s:string;blank:integer);

implementation

function inttostr(n:integer):string;
var
  s:string;
begin
    s:='';
    repeat
       s:=chr(ord('0')+n mod 10)+s;
       n:=n div 10;
    until n=0;
    inttostr:=s;
end;


procedure putone(x,y:integer;s:string);
type
    chinesep=array[1..32] of byte;
var
    a:chinesep;
    f:file of chinesep;
    i,j,x0,y0:integer;
    k:byte;
    q,w:longint;
    color:byte;

begin
    color:=getcolor;
    q:=ord(s[1])-160;
    w:=ord(s[2])-160;
    q:=(q-1)*94+(w-1);
    assign(f,'HZK16');
    reset(f);
    if (q<0) or (q>=filesize(f)) then
      begin
         close(f);
         exit;
      end;
    seek(f,q);
    read(f,a);
    close(f);
    y0:=y;
    for i:=1 to 32 do
     begin
       k:=a[i];
       if i mod 2=1 then
         begin
           x0:=7+x;
           y0:=y0+1;
         end
        else
              x0:=15+x;
       for j:=1 to 8 do
        begin
           if k and 1 =1 then putpixel(x0,y0,color);
            x0:=x0-1;
            k:=k shr 1;
        end;
     end;
end;

procedure putletter(x,y:integer;s:char);
type
   letterp=array[1..16] of byte;
var
   a:letterp;
   f:file of letterp;
   i,j,x0,y0:integer;
   q:longint;
   k:byte;
   color:byte;
begin
   color:=getcolor;
   q:=ord(s);
   assign(f,'ASC16');
   reset(f);
   seek(f,q);
   read(f,a);
   close(f);
   y0:=y;
   for i:=1 to 16 do
    begin
      k:=a[i];
      x0:=7+x;
      y0:=y0+1;
      for j:=1 to 8 do
       begin
          if k and 1 =1 then putpixel(x0,y0,color);
           x0:=x0-1;
           k:=k shr 1;
       end;
    end;
end;

procedure outchinese(x,y:integer;s:string;blank:integer);
var
   temps:string[2];
   k:integer;
   long:integer;
begin
   k:=1;
   long:=0;
   while k<=length(s) do
    begin
      if s[k]>#160 then begin
       temps:=s[k]; k:=k+1;
       temps:=temps+s[k]; k:=k+1;
       putone(x+long,y,temps);
       long:=long+16+blank;
      end else begin
       putletter(x+long,y,s[k]);
       k:=k+1;
       if (s[k]=#32)or(ord(s[k])>160) then
        long:=long+8+blank
       else
        long:=long+8;
      end;
    end;
end;

End.