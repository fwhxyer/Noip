program ddtang;
const
 beginf=93;f70b=2.9;f60b=2.4;f30du=1.4;
 ding30:array[-1..21]of real=(0,0,14,20,24.7,28.7,32.3,35.7,38.8,41.8,44.7,47.5,50.2,52.8,55.3,57.9,60.3,62.7,65.7,67.5,69.8,72.1,74.4);
 ding65:array[-1..21]of real=(0,0,13,20,24,30,35,40,44,48,51,55,58,61,64,67,70,74,76,79,82,85,88);
 ding50:array[-1..21]of real=(0,0,14.1,20.1,24.8,28.8,32.5,35.9,39.0,42.0,44.9,47.7,50.4,53.0,55.6,58.1,60.6,63.0,65.4,67.8,70.2,72.5,74.8);
 bian70:array[-1..21]of real=(0,0,18.5,26.4,32.6,37.9,42.7,47.2,51.3,55.3,59.1,62.8,66.3,69.8,73.1,76.5,79.7,82.9,86.1,89.2,92.3,95.3,98.4);
 bian60:array[-1..21]of real=(0,0,15.5,22.1,27.3,31.7,35.7,39.5,42.9,46.3,49.4,52.5,55.5,58.4,61.2,64.0,66.7,69.4,72.0,74.6,77.2,79.7,82.1);
var
 f,ft,s,oi,oi0,oii,oit,savenum1,savenum2,tmp1,rl1,rl2,rl:real; x:string; code,i,rh:integer;bt,boolruler,boolget:boolean;
procedure ruler(rh:integer; var rl:real);
var
 i,p,code:integer; rl1,rl2,a,b,c,d:real; x1:string;
 procedure get(a,b:real);
 begin
  if a/b*10>=30 then begin boolget:=false;ruler(rh-1,rl); end else begin
   if boolruler then savenum2:=a/b*10 else savenum1:=a/b*10;
   write('������������������������ľ���',(a/b*10):6:2,'�Ѿ����벢���浽��¼');
   if boolruler then writeln('����������������������') else writeln('һ��������������������');
   s:=a/b*10;
  end;
 end;
begin
 for i:=1 to 37 do write(' ');write('');for i:=0 to 19 do write('��');writeln;
 for i:=1 to 37 do write(' ');for i:=0 to 19 do if i=10 then write(chr(29),'0') else write((i mod 10):2);writeln;
 for i:=1 to rh do writeln;writeln('����������ݱ�߶�ȡ����ȷ��ʽ��Ŀ�����(x��y������)������(x`��y`����ʡ��)����');
 if not boolget then writeln('����������������������������������ݶ��룬���볬��Χ��������������������������');
 readln(x1);if x1='*' then exit;
 if (copy(x1,1,2)='rl')or(copy(x1,1,9)='rulerlong') then begin delete(x1,1,pos(' ',x1));
   val(copy(x1,1,pos(' ',x1)-1),rl1,code);delete(x1,1,pos(' ',x1));val(x1,rl2,code);rl:=abs(rl1-rl2);if (rl<=0)or(rl>30) then rl:=4.9;
   writeln('����������������������������ȡ���೤��ֵΪ������',rl:6:2,'������������������������');readln;ruler(rh,rl);exit;end;
 p:=pos(' ',x1);
 if p=0 then begin val(x1,a,code);
     if code=0 then begin get(abs(a),rl);exit;
    end else begin ruler(rh,rl);exit; end;
  end;
 val(copy(x1,1,p-1),a,code);if code<>0 then begin ruler(rh,rl);exit; end;
 delete(x1,1,p);
 p:=pos(' ',x1);
 if p=0 then begin
   if length(x1)=0 then begin ruler(rh,rl);exit; end;
   val(x1,b,code);
   if code<>0 then begin ruler(rh,rl);exit; end;
   get(abs(a-b),rl);
  end else begin
   val(copy(x1,1,p-1),b,code);if code<>0 then begin ruler(rh,rl);exit; end;delete(x1,1,p);
   p:=pos(' ',x1);if p=0 then begin ruler(rh,rl);exit; end;
   val(copy(x1,1,p-1),c,code);if code<>0 then begin ruler(rh,rl);exit; end;delete(x1,1,p);
   if length(x1)=0 then begin ruler(rh,rl);exit; end;
   val(x1,d,code);
   if (code<>0)or(c=d) then begin ruler(rh,rl);exit; end;
   rl:=abs(c-d);
   get(abs(a-b),abs(c-d));
  end;
end;
procedure countzhanj;
var
 a,b,c,code,p:integer;ans,ans1:real;
begin
if length(x)>4 then
begin
 delete(x,1,4);   c:=0;
 p:=pos(' ',x);
 val(copy(x,1,p-1),a,code);
 if (length(x)>p)and(p>0) then begin delete(x,1,p);
 p:=pos(' ',x);
 val(copy(x,1,p-1),b,code);
 delete(x,1,p);if p=0 then x:='';
 if x[length(x)]=')' then delete(x,length(x),1);val(x,c,code);ans:=(a/(a+b))*100;ans1:=100*(a+c)/(a+b+c);
 writeln('��������������������������ǰʤ��Ϊ',ans:6:2,'%������ʤ��',c:2,'��ʤ��Ϊ',ans1:6:2,'%����������'); end;
end;
end;
procedure printhigh;
var i:integer;
begin
 oi:=(oi0-s+f*2);
 oit:=oi-round(oi);ft:=4*oit;
 write('�p�e���e�e���e����');for i:=1 to 30 do write('��');writeln;
 write('���e�����e�����������ר����ר����Ȩ�׼ȷ�Ȩ���������');
 if bt then write('�� -1�� -1�� -1��') else
 write('��',180-round(oi):3,'��',round(oi):3,'��',round(beginf-ft):3,'��');
 if bt then writeln('*******','��') else begin
 if beginf-ft-round(beginf-ft)>0.2 then writeln('+++++++','��') else
  if beginf-ft-round(beginf-ft)<-0.2 then writeln('-------','��') else writeln('=======','��');end;
 write('  ���e�e���e����');for i:=1 to 31 do write('��');writeln;
end;
procedure printmid;
var i:integer;
begin
 write('�p�e���e�e���e����');for i:=1 to 30 do write('��');writeln;
 write('���e�����e�����������������ר����Ȩ�׼ȷ�� ����������');
 if bt then write('������ -1�� -1��') else
 write('������',round(90-0.5*(90-oi0)-s*2+2*f):3,'�� ',61,'��');
 if bt then writeln('*******','��') else  writeln('=======','��');
 write('  ���e�e���e����');for i:=1 to 31 do write('��');writeln;
end;
procedure print65d(s,f:real);
var i,st:integer;stt:real;b:boolean;
begin
 if s>=20.5 then begin s:=0;b:=true;end else b:=false;if bt then b:=true;
 write('�p�e���e�e���e����');for i:=1 to 30 do write('��');writeln;
 write('���e�����e��������������65�������Ȩ�׼ȷ�Ȩ���');
 f:=2*f;
 st:=round(s);if s-st>0 then stt:=ding65[st]+(s-st)*(ding65[st+1]-ding65[st])-f
  else stt:=ding65[st]+(s-st)*(ding65[st]-ding65[st-1])-f;
 if not b then write('����',65:2,'������������',round(stt):3,'��') else write('����65������������ -1��');
 if not b then begin
 if stt-round(stt)>0.2 then writeln('+++++++','��') else
  if stt-round(stt)<-0.2 then writeln('-------','��') else writeln('=======','��');
 end else writeln('*******','��');
 write('  ���e�e���e����');for i:=1 to 31 do write('��');writeln;
end;
procedure print30d(s,f:real);
var i,st:integer;stt:real;b:boolean;
begin
 if s>=20.5 then begin s:=0;b:=true;end else b:=false;if bt then b:=true;
 write('�p�e���e�e���e����');for i:=1 to 30 do write('��');writeln;
 write('���e�����e��������������30�������Ȩ�׼ȷ�Ȩ���');
 if s>10.99 then f:=f30du*f;
 st:=round(s);if s-st>0 then stt:=ding30[st]+(s-st)*(ding30[st+1]-ding30[st])-f
  else stt:=ding30[st]+(s-st)*(ding30[st]-ding30[st-1])-f;
 if not b then write('����',30:2,'������������',round(stt):3,'��') else write('����30������������ -1��');
 if not b then begin
 if stt-round(stt)>0.2 then writeln('+++++++','��') else
  if stt-round(stt)<-0.2 then writeln('-------','��') else writeln('=======','��');
 end else writeln('*******','��');
 write('  ���e�e���e����');for i:=1 to 31 do write('��');writeln;
end;
procedure print70b(s,f:real);
var i,st:integer;stt,ft:real;b:boolean;
begin
 if s>=20.5 then begin s:=0;b:=true;end else b:=false;if bt then b:=true;
 write('�p�e���e�e���e����');for i:=1 to 30 do write('��');writeln;
 write('���e�����e��������������70�䨀���Ȩ�׼ȷ�� ����');
 f:=2*f;st:=round(s);ft:=round(f);
 if s-st>0 then stt:=bian70[st]+(s-st)*(bian70[st+1]-bian70[st])+(ft-f)*f70b
  else stt:=bian70[st]+(s-st)*(bian70[st]-bian70[st-1])+(ft-f)*f70b;
 if not b then write('������������',round(70+f):3,'��',stt:3:0,'��') else write('������������ -1�� -1��');
 if not b then begin
 if stt-round(stt)>0.2 then writeln('+++++++','��') else
  if stt-round(stt)<-0.2 then writeln('-------','��') else writeln('=======','��');
 end else writeln('*******','��');
 write('  ���e�e���e����');for i:=1 to 31 do write('��');writeln;
end;
procedure print60b(s,f:real);
var i,st:integer;stt,ft:real;b:boolean;
begin
 if s>=20.5 then begin s:=0;b:=true;end else b:=false;if bt then b:=true;
 write('�p�e���e�e���e����');for i:=1 to 30 do write('��');writeln;
 write('���e�����e��������������60�䨀���Ȩ�׼ȷ�� ����');
 f:=2*f;st:=round(s);ft:=round(f);
 if s-st>0 then stt:=bian60[st]+(s-st)*(bian60[st+1]-bian60[st])+(ft-f)*f60b
  else stt:=bian60[st]+(s-st)*(bian60[st]-bian60[st-1])+(ft-f)*f60b;
 if not b then write('������������',round(60+f):3,'��',stt:3:0,'��') else write('������������ -1�� -1��');
 if not b then begin
 if stt-round(stt)>0.2 then writeln('+++++++','��') else
  if stt-round(stt)<-0.2 then writeln('-------','��') else writeln('=======','��');
 end else writeln('*******','��');
 write('  ���e�e���e����');for i:=1 to 31 do write('��');writeln;
end;
procedure print50d(s,f:real);
var i,st:integer;stt:real;b:boolean;
begin
 if s>=20.5 then begin s:=0;b:=true;end else b:=false;if bt then b:=true;
 write('�p�e���e�e���e����');for i:=1 to 30 do write('��');writeln;
 write('���e�����e��������������50�������Ȩ�׼ȷ�Ȩ���');
 f:=1.2*f;st:=round(s);
 if s-st>0 then stt:=ding50[st]+(s-st)*(ding50[st+1]-ding50[st])-f*(ding50[st]+(s-st)*(ding50[st+1]-ding50[st]))/47.7
  else stt:=ding50[st]+(s-st)*(ding50[st]-ding50[st-1])-f*(ding50[st]+(s-st)*(ding50[st+1]-ding50[st]))/47.7;
 if not b then write('����',50,'������������',round(stt):3,'��') else write('����50������������ -1��');
 if not b then begin
 if stt-round(stt)>0.2 then writeln('+++++++','��') else
  if stt-round(stt)<-0.2 then writeln('-------','��') else writeln('=======','��');
 end else writeln('*******','��');
 write('  ���e�e���e����');for i:=1 to 31 do write('��');writeln;
end;
procedure helpy;
var i:integer;
begin
 for i:=1 to 4 do writeln;
 writeln('������');
 writeln('������������������������������������������������������������������������������');
  writeln(chr(15),'�����ʽ��');
  writeln('1����������:����(10/�������۴������)+�������+����(0���ʡ�ԣ�����+/-)��');
  writeln('2����׼�������ʽ��10.1+3��8-1.3��*��*3.1��-1.3�ȣ��Ϸ���ʽ13#$%-1.5�ȡ�');
  writeln('3����̻��Զ���¼������*/+/-������ϻغ���̣�����f�ɲ鿴��ǰ���ֵ��');
  readln;
  writeln(chr(15),'�����ʽ��');
  writeln('4���������Ϊ�ǶȺ����ȣ�������"+++++"/"-----"����ʵ�ʽ����������С/��');
  writeln('5������Ϊ+++++���Լ�0.5��������Ϊ-----���Լ�0.5��������Ϊ=====��ʾ�����ȷ��');
  readln;
  writeln(chr(15),'����ͳ�ƣ�');
  writeln('6���������ݼ�������鿴����f��fq��fw����������help��');
  writeln('7����������qq��ww����ȡ����q��w��');
  writeln('8��ϵͳ�������������ݴ浵���ֱ�Ϊq��w����ʹ������������ж�ȡ��');
  writeln('9��ս������get(ʤ�����ܳ�����ʤ����)(�Կո����)��������Ϊ��ʤ����ʤ���ʡ�');
  readln;
  writeln(chr(15),'��߹��ܣ�');
  writeln('10��ʹ�ñ��֮ǰ�������ʾ��߶ȣ�����Ϊ��rh(rulerhigh) �߶�(ϵͳĬ��Ϊ52)��');
  writeln('11���鿴�߶ȵķ������򿪳��򡪱��������Ҽ������ԡ����֡����ڴ�С���߶ȡ�');
  writeln('12��ʹ�ñ�߹��ܵ�����Ϊr1(�ɼ�дΪr)��r2����ʾʹ��һ�����¼�ⶨ����ֵ��');
  writeln('13����߹��ܵ������ʽΪ���������Ŀ�������꣬����Ļ������Ļ�����ꡣ');
  writeln('14�������Կո����������Ļ������Ļ�����ʡ�ԣ�ʡ�Ժ��Ϊ�ϴ������Ĭ�����ꡣ');
  writeln('15����ȷ�������ʽ��1.1 2 3.3 5��  11 13 19 8��  12 18;  6 19  �ȡ�');
  writeln('16����ȡ�������꾭������Զ���¼�ڼ�¼һ�����ͬʱ���ǵ�ǰ�����¼ֵ��');
  writeln('17����߳�������Ҳ��ʹ�ã�rl(rulerlong) ����(ϵͳĬ��Ϊ4.9) ��');
  writeln('17���鿴��߳��Ȼ���ʾ��߶ȵ�����Ϊ��fl��fh��');
  readln;
  writeln(chr(15),'������');
  writeln('��������������0-29.99�ھ�ȷ(���ڰ��׼������ʵ)����ע�����������׼ȷ�ȡ�');
  writeln('�������������ש�������������������죬���������ӻ���');
  writeln('�����������ߡ���');
  writeln('     �ķ�ף�����������daybreak��  QQ:381998720��Email:fwhxyer@163.com');
  writeln('     ���������κδ����Ա��������κν��飬����ϵ�ң�');

 writeln('������������������������������������������������������������������������������');
end;
begin{***************************************************main******************************************}
s:=0;rh:=52-4;rl:=4.9;
while true do
begin
 writeln('������������������������������������������������������������������������������');
 writeln('����help��ȡ������Ϣ�������������ݺ󰴻س�����ý����');
 readln(x);f:=0;bt:=false;
if x='help' then helpy else
if x='f' then writeln('�����������������������������ڵ���̼�¼ֵΪ����',s:6:2,'������������������������') else
if x='fq' then writeln('��������������������������¼һ��������ֵΪ����',savenum1:6:2,'������������������������') else
if x='qq' then begin savenum1:=s;writeln('������������������������������',s:6:2,'�ѱ��浽��¼һ��������������������������') end else
if x='q' then begin s:=savenum1;writeln('��������������������������¼һ���ֵ',s:6:2,'�Ѿ�����ȡ��������������������������') end else
if x='fw' then writeln('��������������������������¼����������ֵΪ����',savenum2:6:2,'������������������������') else
if x='ww' then begin savenum2:=s;writeln('������������������������������',s:6:2,'�ѱ��浽��¼����������������������������') end else
if x='w' then begin s:=savenum2;writeln('��������������������������¼�����ֵ',s:6:2,'�Ѿ�����ȡ��������������������������') end else
if x='fh' then begin writeln('����������������������������ǰ��Ļ�߶�ֵΪ������',(rh+4):4,'��������������������������'); end else
if x='fl' then begin writeln('����������������������������ǰ���೤��ֵΪ������',rl:6:2,'������������������������'); end else
if copy(x,1,3)='get' then countzhanj else
if (copy(x,1,2)='rl')or(copy(x,1,9)='rulerlong') then begin delete(x,1,pos(' ',x));
   val(copy(x,1,pos(' ',x)-1),rl1,code);delete(x,1,pos(' ',x));val(x,rl2,code);rl:=abs(rl1-rl2);if (rl<=0)or(rl>30) then rl:=4.9;
   writeln('����������������������������ȡ���೤��ֵΪ������',rl:6:2,'������������������������'); end else
if (copy(x,1,2)='rh')or(copy(x,1,9)='rulerhigh') then begin delete(x,1,pos(' ',x));
   val(x,rh,code);if rh=0 then rh:=52;rh:=rh-4;
   writeln('����������������������������ȡ��Ļ�߶�ֵΪ������',(rh+4):4,'��������������������������'); end else
if x[1]='r' then begin delete(x,1,1);if x[1]='2' then boolruler:=true else boolruler:=false;boolget:=true;ruler(rh,rl);x:='0'; end else
begin
if length(x)<>0 then
begin
 if (x[1]='+')or(x[1]='-')or(x[1]='*') then begin
  while ((x[1]<'0')or(x[1]>'9'))and((x[1]<>'.')and(x[1]<>'-')) do
   if length(x)>0 then delete(x,1,1) else break;
  val(x,f,code); if (f>10)or(f<-10) then f:=0;
 end else
begin
 for i:=1 to length(x)+1 do
 begin
  if ((x[i]<'0')or(x[i]>'9'))and((x[i]<>'.')and(x[i]<>'-')) then break;
  if (x[i]='-') then begin insert('-',x,i);break; end;
 end;
 tmp1:=s;val(copy(x,1,i-1),s,code);if code<>0 then s:=tmp1; if s>=30 then begin s:=tmp1;bt:=true; end;
 delete(x,1,i);
 while ((x[1]<'0')or(x[1]>'9'))and((x[1]<>'.')and(x[1]<>'-')) do
  if length(x)>0 then delete(x,1,1) else break;
 val(copy(x,1,length(x)),f,code); if (f>10)or(f<-10) then f:=0;
end;
 writeln('������������������������������������������������������������������������������');
 oii:=arctan((10*s/sqr(0.127*beginf+5.289))/(sqrt(1-sqr(10*s/sqr(0.127*beginf+5.289))))); oii:=oii/pi*180;
 oi0:=s+0.5*(180-oii);
{ if s-trunc(s)<=trunc(s)+1-s then begin st:=s-trunc(s);ss:=trunc(s); end else
 begin  st:=-(1-s+trunc(s));ss:=trunc(s)+1; end;
 if 2*f-trunc(2*f)<=trunc(2*f)+1-2*f then begin ft:=-2*f+trunc(2*f);ff:=trunc(2*f); end else
 begin  ft:=(1-2*f+trunc(2*f));ff:=trunc(2*f)+1; end;
 ansf:=beginf+st/0.5*2+ft/0.2*2;       10*s/sqr(0.127*beginf+5.289)               }
{ writeln;
 write('��ĸ��׽Ƕ�Ϊ  ','(���� ',180-round(oi):3,')  ',chr(15),' ',round(oi),'      ����Ϊ    ',chr(15),' ',round(beginf-ft));
 if beginf-ft-round(beginf-ft)>0.2 then writeln('   +++') else
  if beginf-ft-round(beginf-ft)<-0.2 then writeln('   ---') else writeln;
 writeln;}
{0.5����=2����}{0.2����=2����}
{ writeln('��İ��׽Ƕ�Ϊ              ',chr(15),' ',(oi0-s*2+2*f):0:0,'      ����Ϊ    ',chr(15),' ',61);
 writeln;}
{ writeln('30���ǵ�����Ϊ       ');}
 printhigh;
{ printmid;     }
 print70b(s,f);
{ print65d(s,f);}
 print60b(s,f);
 print50d(s,f);
 print30d(s,f);
{ writeln;}
{ writeln('������������������������������������������������������������������������������');     }
end;
end;
end;
end.
