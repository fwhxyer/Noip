program richman;
type
 htype=record
  firname,lasname:string[10];   profession:byte;
  towords,pos,level,weapon,clothes:integer;hp,mp,hpnow,mpnow:longint;
  money,exp:int64;  playbool:boolean;
   end;
 mtype=record
   build,whose:integer;{whose:(integer mod 4)+1;level:(integer div 4)+1}
  end;
const
 mapnum=256;
 buildnum=7;
 arrntemp:array[0..buildnum]of integer=(255,3,4,2,1,2,6,5);

var
 boolhelp:boolean;
 h:array[1..5]of htype;
 gameway,playersnum:byte;
 arrtemp:array[0..buildnum]of integer;
 map:array[1..mapnum]of mtype;
 temp:integer;

procedure writehelp;{writelelp===============================================}
begin
 write('��Ϸ�ܹ���Ϊ����ģʽ���ֱ�Ϊ��richģʽ��killģʽ����ͬ����Ϸģʽ��ʤ���������ز���˾���ò�ͬ��richģʽΪ��ǮС��0ʧ�ܣ�killģʽΪhpС��0ʧ�ܣ���');readln;
 write('ÿ����Ϸ�߿�������ѡ������ְҵ�е�һ�֣��ֱ�����ʿ�͹����֣���ʿ�ķ�����������ֵԶԶ���ڹ����֡������ֵĹ����������ҪԶԶ������ʿ��������ֵ��ְҵװ�����֣�');readln;
 write('***********��Ϸ����������ϣ��밴�س�����ʼ��Ϸ��***********');readln;
end;
procedure init;{init=========================================================}
var
 i:integer;
 procedure humanchoose(a:integer);
 begin
  randomize;writeln('��������� ',a,' �����ϣ�');readln(h[a].firname);
  writeln('��������� ',a,' �����֣�');readln(h[a].lasname);
  while (h[a].profession<>1) and (h[a].profession<>2) do begin
  writeln('��������� ',a,' ��ְҵ�����롮1��ѡ����ʿ�����롮2��ѡ�񹭼��֣���')
  ;readln(h[a].profession); end;
  h[a].level:=1;h[a].money:=100;h[a].weapon:=1;h[a].clothes:=1;
  h[a].hp:=ord(h[a].profession=1)*1000+ord(h[a].profession=2)*500;
  h[a].hpnow:=h[a].hp;
  h[a].mp:=ord(h[a].profession=1)*100+ord(h[a].profession=2)*250;
  h[a].mpnow:=h[a].mp;
  h[a].towords:=-1+2*(random(1000)mod 2);
  write('��ϲ��һ������',h[a].firname,' ',h[a].lasname,'̤���˴��̽�������ѡ���ְҵ�ǣ�');
  if h[a].profession=1 then writeln('��ʿ��') else writeln('�������֣���');
 end;
begin {datainit==============================datainit=================}
 randomize;
 boolhelp:=true;
 writeln('��ӭ���ٴ��̽�����Ϸ��');readln;
 while boolhelp do {==============need help=========================}
 begin
  boolhelp:=false;
  writeln('�����롮y��ȡ����Ϸ������������Ѿ�������򣬿����롮n������������');
  readln(h[1].firname);
  if h[1].firname='y' then writehelp else
   if h[1].firname<>'n' then boolhelp:=true;
 end;          {=================need help end======================}
 {readlninit===========================}
 writeln('��������Ϸ�������������ڵ���1С�ڵ���4����');{number of players}
 readln(playersnum);
 for i:=1 to 5 do
  h[i].playbool:=false;
 for i:=1 to playersnum do
  h[i].playbool:=true;
 writeln('��������Ϸģʽ�����롮1��Ϊrichģʽ����2��Ϊkillģʽ����');{way kill or rich}
 readln(gameway);
 fillchar(arrtemp,sizeof(arrtemp),0);
 for i:=1 to playersnum do
  humanchoose(i);
 h[5].firname:='��';h[5].lasname:='��';h[5].profession:=2;h[5].playbool:=true;
 {build map============================}
 for i:=1 to mapnum do map[i].build:=-1;
 for i:=1 to mapnum do
  begin
   while map[i].build=-1 do
   begin
    temp:=random(buildnum);
    if arrtemp[temp]<arrntemp[temp] then
     begin
      map[i].build:=temp;
      map[i].whose:=0;
      inc(arrtemp[temp]);
     end;
   end;
  end;
end;{==============================init end==================================}
{================function====================================================}
function DEF(profes:byte;lv:integer):longint;
begin
 DEF:=trunc(lv*sqrt(lv)*10)+trunc(lv*sqrt(lv)*10*ord(profes=2));
end;
function ATK(profes:byte;lv:integer):longint;
begin
 ATK:=lv*lv*10+lv*lv*10*ord(profes=1);
end;
function expneed(lv:integer):int64;
begin
 expneed:=lv*lv*lv*lv;
end;
{================function end================================================}
{build deal BEGIN=====================}
procedure welcome(b:byte;a:integer);
begin
 case a of
  0:writeln('��ӭ',h[b].firname,' ',h[b].lasname,'���������꣡');
  1:writeln('��ӭ',h[b].firname,' ',h[b].lasname,'������װ�꣡');
  2:writeln('��ӭ',h[b].firname,' ',h[b].lasname,'������԰��');
  3:writeln('��ӭ',h[b].firname,' ',h[b].lasname,'����ռ������');
  4:writeln('��ӭ',h[b].firname,' ',h[b].lasname,'�����ز���˾��');
  5:writeln('��ӭ',h[b].firname,' ',h[b].lasname,'�����ɻ�����');
  6:writeln('��ӭ',h[b].firname,' ',h[b].lasname,'����ҽԺ��');
  7:writeln('������',h[b].firname,' ',h[b].lasname,'��һ������ޱȵĴ���﷢���ˣ�');
   end;
end;
procedure swork(who:byte;where:integer;whose:byte);
begin
 case where of
  0:begin
    end;
  1:begin
    end;
  2:begin
    end;
  3:begin
    end;
  4:begin
    end;
  5:begin
    end;
  6:begin
    end;
  7:begin
    end;
 end;
end;
procedure fwork(who:byte;where:integer);
var
 i:integer;temp:integer;tempstr:string;
 price:array[1..5]of longint;
begin
 case where of
  0:begin
     writeln('������װ����������:',h[who].weapon,'�������˺�ֵΪ',ATK(h[who].profession,h[who].weapon),'��');
     writeln('���ǿ����ṩ�����������У�');
     for i:=1 to 5 do
      write(h[who].weapon+i:15);writeln;
     writeln('���ǵ��˺�ֵ�ֱ��ǣ�');
     for i:=1 to 5 do
      write(ATK(h[who].profession,h[who].weapon+i):15);writeln;
     writeln('���ǵļ۸�ֱ��ǣ�');
     for i:=1 to 5 do
      begin
       price[i]:=(h[who].weapon+i)*(h[who].weapon+i)*(h[who].weapon+i)*100;
       write(price[i]:15);
      end;
     writeln;
     tempstr:='';
     while (tempstr='')or( ((tempstr<>'0')and
  ((tempstr='1')or(tempstr='2')or(tempstr='3')or(tempstr='4')or(tempstr='5')))
 and (h[who].money<=price[ord(tempstr[1])-48])   )or
  ((tempstr<>'1')and(tempstr<>'2')and(tempstr<>'3')and
   (tempstr<>'4')and(tempstr<>'5')and(tempstr<>'0')   ) do
        begin
         writeln('��������Ҫ������������루���밴������1-5�����粻�����κ����������롮0������Ǯ����ʱ����Ϣ���ظ���ʾ��');
         readln(tempstr);
        end;
     if tempstr<>'0' then
      begin
       writeln('���ɹ�����������',h[who].weapon+ord(tempstr[1])-48,'�����ѽ�Ǯ',price[ord(tempstr[1])-48],'��');
       h[who].money:=h[who].money-price[ord(tempstr[1])-48];
       swork(who,where,h[who].weapon);
       h[who].weapon:=h[who].weapon+ord(tempstr[1])-48;
      end else
       begin
        tempstr:='';
        while (tempstr='')or((tempstr<>'n')and(tempstr<>'y')) do
         begin
          writeln('��ô��Ҫ����������װ���������������롮y����n��ȷ����');
          readln(tempstr);
         end;
        if tempstr='y' then swork(who,where,h[who].weapon);
       end;
    end;
  1:begin
    end;
  2:begin
    end;
  3:begin
    end;
  4:begin
    end;
  5:begin
    end;
  6:begin
    end;
  7:begin
    end;
 end;
 if where<>7 then begin writeln('��ӭ�´ι��ٱ��꣡');readln; end;
end;
{build deal END=======================}
procedure inmap(who:byte;pos:integer{mapnum});{inmap=========================}
begin
 welcome(who,map[pos].build);
 if map[pos].whose=0 then fwork(who,map[pos].build)
  else swork(who,map[pos].build,map[pos].whose);
end;
procedure gogo(who:byte{whogogo});{gogo!=====================================}
var
 temp:integer;
begin
 randomize;
 temp:=1+random(5);
 writeln('��ҡ���� ',temp,'�㣡');
 h[who].pos:=h[who].pos+temp*h[who].towords;
 if h[who].pos<1 then h[who].pos:=mapnum+h[who].pos;
 if h[who].pos>mapnum then h[who].pos:=h[who].pos-mapnum;
 inmap(who,h[who].pos);
end;
begin{main===================================================================}
 init;
end.{=main===================================================================}
