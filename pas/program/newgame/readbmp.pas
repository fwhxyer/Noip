unit Readbmp;

interface

type
TBMPFileHeader=record
                 bfType:word;
                 bfSize:longint;
                 bfReserved1:word;
                 bfReserved2:word;
                 bfOffBits:longint;
                end;

TBMPInfoHeader=record
                 bfSize:longint;
                 biWidth:longint;
                 biHeight:longint;
                 biPlanes:word;
                 biBitCount:word;
                 biCompression:longint;
                 biSizeImage:longint;
                 biXPelsPerMeter:longint;
                 biYPelsPerMeter:longint;
                 biClrUsed:longint;
                 biClrImportant:longint;
                end;
TRGBQUAD=record
          b:byte;
          g:byte;
          r:BYTE;
          res:byte;
         end;

procedure LoadBMP(fname:string;var bi:TBMPInfoHeader;var Image:Pointer);
procedure DrawBMP(Image:Pointer;x,y,w,h,x1,y1,x2,y2:longint;keycolor:byte);

implementation
uses Graph;
type
  pbyte=^byte;
  bf=file of byte;
procedure ReadBuf(var f:bf;p:pbyte;size:longint);
var
  i:longint;
  c:byte;
begin
  for i:=0 to size-1 do
  begin
   read(f,c);
   pbyte(longint(p)+i)^:=c;
  end;
end;
function conv(k:byte):byte;
begin
  conv:=k;
  case k of
   1:conv:=4;
   3:conv:=6;
   4:conv:=1;
   6:conv:=3;
   9:conv:=12;
   11:conv:=14;
   12:conv:=9;
   14:conv:=11;
  end;
end;

procedure LoadBMP(fname:string;var bi:TBMPInfoHeader;var Image:Pointer);
var
  fin:bf;
  bh:TBMPFileHeader;
  numq,width,h:longint;
  i,j:longint;
  t:byte;
  tms:longint;
  kw,imgw,memsize:word;
  k,p,q,img:Pointer;
  pal:array [0..15] of TRGBQUAD;
begin
  assign(fin,fname);
  reset(fin);
  ReadBuf(fin,@bh,sizeof(bh));
  ReadBuf(fin,@bi,sizeof(bi));
  {seek(fin,sizeof(bi)+sizeof(bh)+((1 shl bi.biBitCount)*4));}
  numq:=1 shl bi.biBitCount;
  for i:= 0 to numq-1 do
   ReadBuf(fin,@pal[i],sizeof(TRGBQUAD));
  tms:=bh.bfSize-bh.bfOffBits;
  tms:=tms shr 10;
  if tms=0 then memsize:=1
  else memsize:=tms+1;
  GetMem(k,bh.bfSize-bh.bfOffBits);
  GetMem(Image,(bh.bfSize-bh.bfOffBits)*2);
  ReadBuf(fin,pbyte(k),bh.bfSize-bh.bfOffBits);
  close(fin);
  width:=(bi.biWidth*bi.biBitCount+31)shr 5 shl 2;
  h:=bi.biHeight-1;
  for i:=0 to h div 2 do
   for j:=0 to width-1 do
   begin
    p:=k;
    inc(longint(p),i*width+j);
    t:=pbyte(p)^;
    q:=k;
    inc(longint(q),(h-i)*width+j);
    pbyte(p)^:=pbyte(q)^;
    pbyte(q)^:=t;
   end;
   for i:=0 to h  do
    for j:=0 to width-1  do
     begin
      p:=k;
      inc(longint(p),i*width+j);
      q:=Image;
      inc(longint(q),(i*width+j)*2);
      pbyte(q)^:=conv(pbyte(p)^ div 16);
      inc(longint(q));
      pbyte(q)^:=conv(pbyte(p)^ mod 16);
     end;
dispose(k);
end;

procedure DrawBMP(Image:Pointer;x,y,w,h,x1,y1,x2,y2:longint;keycolor:byte);
var
  i,j:longint;
  c:byte;
begin
  w:=(w*4+31)shr 5 shl 3;
  for i:=y1 to y2 do
  begin
   for j:=x1 to x2 do
   begin
     c:=pbyte(longint(Image)+w*i+j)^;
     if (keycolor>15)or(c<>keycolor) then PutPixel(x+j-x1,y+i-y1,c);
   end;
  end;
end;
end.


