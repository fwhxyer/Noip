program kingcard;{����bugδ��������ش������޶�ȡ����c:\windows\system32\savebackKCn.dll�������洢=��=����ģʽ���Զ����Ǯ212}
type
 cardtype=record
  a:char;
  b:string;
 end;
const
 cardtmp:array[0..12] of string=('A','2','3','4','5','6','7','8','9','10','J','Q','K');
 many:array[1..10]of integer=(0,1,3,5,14,16,18,40,80,150);
 named:array[1..10]of string=('����','����','����','����','˳��','ͬ��','��«','����','ͬ��˳','����');
 picturen=22;
 lilvlarge=73;
 bianbian=1;
 diandian=2;
 xianxian=29;  {18}
 daypart =10;  {5}
 lilvlarget=lilvlarge-(lilvlarge mod daypart);
 namec:array[0..44]of string=('$������$','$�����$','$������$','$������$','$������$','$������$','$��ӯӯ$','$����$','$���ƴ�ʦ$','$��üӥ��$','$�ֵ�����$','$�ų���$','$�ȶ�������$',
'$����ɯ��$','$��˹$','$ī��˹��$','$������$','$lina$','$�ϻ�����$','$���׿���$','$��ӥ$','$ΤС��$','$����$','$����չ$','$��������$','$���$','$�ž���$','$Ԭ����$','$ܽ��$','$morphling$',
'$��ë$','$�Ϻ�$','$�����$','$���Ϻ�$','$�ŋ�$','$ΤӦ��$','$�н�ɮ$','$����Ԫ˧$','$������$','$��ѧ��$','$���ǻ�$','$���˹Τ$','$���������$','$��ǫ$','$���������$');
 picture:array[1..picturen]of string=(('       .---.'),
('      (_,/\ \                   .-"      "-.'),
('     (`a a(  )                 /            \'),
('     ) \=  ) (                |              |'),
('     /(_\/_) \                |,  .-.  .-.  ,|'),
('    |/ \   /\|                | )(__/  \__)( |'),
('    \\ /.  \//                |/     /\     \|'),
('     \/\___//       (@_       (_     ^^     _)'),
('      | \_/ <  _     ) \_______\__|IIIIII|__/__________________________'),
('       \/  /  (_)@8@8{}<________|-\IIIIII/-|___________________________>'),
('        |\ \         )_/        \          /'),
('       /_Y/_Y       (@           `--------`'),
(''),

                                ('    .- <O> -.        .-====-.      ,-------.      .-=<>=-.'),
                                ('   /_-\```/-_\      / / `` \ \     |,-----.|     /__----__\'),
                                ('  |/  o) (o  \|    | | `)(` | |   /,`-----`.\   |/ (`)(`) \|'),
                                ('   \   ._.   /      \ \    / /   {_/(`) (`)\_}   \   __   /'),
                                ('   ,>-_,,,_-<.       >`=jf=`<     `.   _   .`    ,`--__--`.'),
                                (' /      .      \    /        \     /`-___-`\    /    :|    \'),
                                ('(_)     .     (_)  /          \   /         \  (_)   :|   (_)'),
                                (' \_-----`____--/  (_)        (_) (_)_______(_)   |___:|____|'),
                                ('  \___________/     |________|     \_______/     |_________|'));
var
 card:array[0..51]of cardtype;
 bool:array[0..51]of boolean;
 history:array[2..5,1..12]of longint;
 namep:array[0..4]of string;
 money:array[0..4]of int64;
 lv,beginm,exp,rp,begine,time,lilv,lilvend,lilvdate:int64;
 playershis:longint;
 lilvlast:array[0..80]of longint;
 alive,players,host,playtype,namek:integer;
 sound,firstbank,loser,notloser,firstdead,testtype,alreadywin:boolean;
 whoalives,endss,tmpreadln:string;
 whoalive:array[0..44]of boolean;
 bankm:array[0..8]of int64;
function max(a,b:int64):int64;
begin
 if a>b then exit(a) else exit(b)
end;
function min(a,b:int64):int64;
begin
 if a<b then exit(a) else exit(b)
end;
procedure getlv;var i:integer;
begin
 if (exp<1000)and(exp>299) then lv:=0
 else if exp>999 then lv:=trunc((exp-1000)/700)+1
 else if exp<0 then begin
  writeln('���ľ���ֵС��0���޷��ٽ�����Ϸ�ˡ�');
  for i:=1 to 5 do readln;halt;
 end else lv:=-1;
end;
procedure writelv;{&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&order&&&&&&&&&&&&&&&&&&&&}
begin
 write('********************************************************************************');
 writeln('������� ���� ��              ',trunc(exp/100),'**');
 getlv;
 writeln('������� �ȼ� ��              ',lv);
 writeln('������ӵ�е� ��Ǯ ��          ',money[0]);
 writeln('********************************************************************************');
end;
procedure writehelp;
var i:integer;
begin
 writeln('*******************************************************************************');
 writeln('����Ϸ���ߣ�����(QQ:381998720)(id:�������ķ�ס�PatronS)��');
 writeln('0.0$   ��һ�ο�ʼ��Ϸʱ���ڽ��˿˱���������Ҽ�-����-����(10*20��������)��');
 writeln('0.0$   �ڽ��˿˱���������Ҽ�-����-����(������80*300�����ڴ�С80*25)��');
 writeln('0.0$   ���ȷ����ѡ�� �޸������Ĵ��ڵĿ�ݷ�ʽ ��');
 readln;
 writeln('0& ��������������ֺ���ս��������棬��������£�');
 writeln('1& ����()�ڰ���������Ϊ�������ʾ�������ݸ�ʽ���밴�ո�ʽ�������ѡ��');
 readln;
 writeln('2& ������Ҫʱ����(-he)����ȡ��Ϸ������');
 writeln('3& ����Ϸ֧���Զ��浵������������ڽ�����Ϸʱ����(-sa)���д浵���˳���Ϸ��');
 writeln('4& ����Ϸ���κ�������о�֧����������������루1.(-he)����2.(-sa)����3.��ȡ��ʷ��¼(-hi)����4.���浱ǰ����ʷ��¼(-sahi)����5.��ȡ�ȼ���������(-lv)����6.������ر���Ч(-so)����7.�����н���(-bank���ڼ������ǰʹ��)����');
 readln;
 writeln('4.5$   ����һ����ʷ��¼�е����ܣ�');
 writeln('       rpֵ�����ڶ������ļ�¼����ʼΪ100��ÿɱ��һ�����ּ�5��ɱ���ĳ��ϰ���8');
 writeln('       �ܳ��Σ����е��ƾ�������');
 writeln('       �ܾ��������еĶľ����������ɼ�����');
 writeln('       �־�������ͬ������Ķ����������пɼ���');
 writeln('       ���������ʣ�ÿ�ľ������Ķ���/�����ܹ����еľ������������ʣ����ֵΪ400%');
 readln;
 writeln('5& ��ʼ��Ϸʱ����ֵΪ1000�㣬������ÿ���700�㾭��ȼ�����������ֵ��ʤ����ʧ��ֻ���ڵ���ս����������϶��Ӽ������ӣ��������ʵĶ��η��������������ʵĶ������������з��գ���ע�������');
 writeln('6& ��Ϸ������Ŀ���ǽ�45λAI��������ڶĹݺ�����������');
 writeln('7& ���Ǯ����С��0 ���޷��������������г��������� ��Ϸ������ʤ���˱��ҳ��£����������������ɣ�');
 readln;
 writeln('8$ ����ʤ����5���ŵĻ�ɫ��˳���������ϼ��㣡');{����ֻ��JQKA�������Ʋſɻ�ý�����}
 writeln('9$ �ڻ��ܱ���������Һ���ö��⽱������������ٺ��뿪Ҳ����������������Ҳ��������-loser�����Ͷ����');
 writeln('10& ���ն��⽱��Ϊ�ľ�˰�յ�20%�Ͷ���ľ���ֵ������Ϊ��˰������*0.2*0.002���ܶ�Ϊ��˰������*0.4*0.005��');
 readln;
 writeln('11& ��Ϸ�ĵ�������Ϊ��');
 for i:=1 to 10 do
  writeln('          ',named[i]:8,'1:':8,many[i]);
 writeln('12& ������𱦺��������ص���Ϸͼ�����𱦺�Ŷ~ϣ����Ҷ��ܼ�������');
 readln;
 writeln('13& ����Ϸ�浵�ļ������ַΪc:\kingcard.sav������ת����Ϸ�ļ�ʱͬʱ�����Ĵ浵���浽���̡������Լ��µ�Ӳ���б�������ս����ʧ��');
 writeln('14& ��ȡ��ش浵ʱ������new��loadΪ������������Ϸ���ٽ���ش浵�ļ����Ƶ�c:\��������Ϸ����������load������ȷ��ȡ�浵��');
// writeln('15& ��ش浵����ȡ����Ϊ2�Σ�����2�κ��޷���ȡ��ش浵����ѡ��ʼ����Ϸ������Ϸ��');
 readln;
 writeln('15& ��л�������Ϸ������ף����Ϸ��죡');
 writeln('********************************************************************************');
 readln;
end;
procedure zhizunbao;
var i:integer;
begin
writeln(' ����������������������������   ��  !!    ��������������������������  ');
writeln('�����������ޡ�����������������   �� ��  ����������  �����������ި�����  ');
writeln('������������������������������  ����ϲ    ��������������������  ������  ');
writeln('��������������������������������  ����  ��������������������������������  ');
writeln('�����������񡡡��������񡡨�����  ����  �����������񡡡��������񡡨�����  ');
writeln('���������򡡡������������򡡨���  ��!!  ���������򡡡������������򡡨���  ');
writeln('�����������������ԡ�������������  ����  �����������������ԡ�������������  ');
writeln('����������������������������  ��������      ������������������������  ');
writeln('��������������������������  ����    ��      ����������������������  ');
writeln('���������������������� ��           !!        ���������������� ');
if sound then for i:=1 to 12 do write(chr(7)) else for i:=1 to 0 do write(chr(7));
end;
procedure writehis;
const
 cc:array[2..5]of string=('���� ����','���� ����','���� ����','���� ����');
var
 i,j:integer;tmp:array[2..6]of int64;tmpc:array[1..10]of int64;
begin
 fillchar(tmp,sizeof(tmp),0);
 fillchar(tmpc,sizeof(tmpc),0);
 for j:=2 to 5 do
 begin
  for i:=1 to 10 do
   inc(tmp[j],history[j,i]);
  inc(tmp[6],tmp[j]);
 end;
 getlv;
 if testtype then write('************************�ô浵Ϊ��Ϸ�������ݴ浵��******************************');
 if testtype then write('************************�ô浵Ϊ��Ϸ�������ݴ浵��******************************');
 if testtype then write('************************�ô浵Ϊ��Ϸ�������ݴ浵��******************************');
 if testtype then write('************************�ô浵Ϊ��Ϸ�������ݴ浵��******************************');
 writeln('�����ã�',namep[0]:namek,'��  ��Ʒֵ��',rp,'���ܳ��Σ�',tmp[6],'��������ս����');
 if testtype then write('************************�ô浵Ϊ��Ϸ�������ݴ浵��******************************') else
 write('********************************************************************************');
 write('���������Ŀ':12);
 for i:=2 to 5 do
  write(cc[i]:15);
 writeln('�ܱ���':7);
 for i:=1 to 10 do
 begin
  write(named[i]:12);
  for j:=2 to 5 do
  begin
   inc(tmpc[i],history[j,i]);
   if history[j,i]=0 then write('-':10) else write(history[j,i]:10);
   if tmp[j]=0 then write('-':5)
    else if history[j,i]=0 then write('-':5)
    else write(round((history[j,i]/tmp[j])*100):4,'%');
  end;
  if tmpc[i]=0 then writeln('-':7)
   else if tmp[6]=0 then writeln('-':7)
   else writeln(tmpc[i]/tmp[6]*100:6:1,'%');
 end;
 write('ʤ������':12);
 for j:=2 to 5 do
 begin
  if tmp[j]=0 then write('-':15)
   else if history[j,1]=0 then write('100%':15)
   else write((1-(history[j,1]/tmp[j]))*100:14:1,'%');
 end;
 if tmp[6]=0 then write('-':7)
  else write((1-tmpc[1]/tmp[6])*100:6:1,'%');
 writeln;
 //breakdown
 write('����������':12);
 for j:=2 to 5 do
 begin
  write(history[j,11]:9,'/',history[j,12]:5);
 end;
 if history[2,12]+history[3,12]+history[4,12]+history[5,12]=0 then writeln('   0.0%')
  else writeln((history[2,11]+history[3,11]+history[4,11]+history[5,11])*100/
         (history[2,12]+history[3,12]+history[4,12]+history[5,12]):6:1,'%');
 if testtype then write('************************�ô浵Ϊ��Ϸ�������ݴ浵��******************************') else
 write('********************************************************************************');
 if testtype then write('************************�ô浵Ϊ��Ϸ�������ݴ浵��******************************');
 if testtype then write('************************�ô浵Ϊ��Ϸ�������ݴ浵��******************************');
 if testtype then write('************************�ô浵Ϊ��Ϸ�������ݴ浵��******************************');
end;
procedure savehis;
const
 cc:array[2..5]of string=('���� ����','���� ����','���� ����','���� ����');
var
 i,j:integer;tmp:array[2..6]of int64;tmpc:array[1..10]of int64;
 f1:text;
begin
if testtype then begin
 writeln('�ô浵Ϊ��Ϸ�������ݴ浵���޷���ս������Ϊ�ı��ļ���');
end else begin
 assign(f1,'c:\history.txt');
 rewrite(f1);
 fillchar(tmp,sizeof(tmp),0);
 fillchar(tmpc,sizeof(tmpc),0);
 for j:=2 to 5 do
 begin
  for i:=1 to 10 do
   inc(tmp[j],history[j,i]);
  inc(tmp[6],tmp[j]);
 end;
 getlv;
 writeln(f1,'�����ã�',namep[0]:namek,'��  ��Ʒֵ��',rp,'���ܳ��Σ�',tmp[6],'��������ս����');
 write(f1,'����ֵ��              ',trunc(exp));
 writeln(f1);
 writeln(f1,'�ȼ���                ',lv);
 writeln(f1,'��Ǯ��                ',money[0]);
 writeln(f1,'********************************************************************************');
 write(f1,'���������Ŀ':12);
 for i:=2 to 5 do
  write(f1,cc[i]:15);
 writeln(f1,'�ܱ���':7);
 for i:=1 to 10 do
 begin
  write(f1,named[i]:12);
  for j:=2 to 5 do
  begin
   inc(tmpc[i],history[j,i]);
   if history[j,i]=0 then write(f1,'-':10) else write(f1,history[j,i]:10);
   if tmp[j]=0 then write(f1,'-':5)
    else if history[j,i]=0 then write(f1,'-':5)
    else write(f1,round((history[j,i]/tmp[j])*100):4,'%');
  end;
  if tmpc[i]=0 then writeln(f1,'-':7)
   else if tmp[6]=0 then writeln(f1,'-':7)
   else writeln(f1,tmpc[i]/tmp[6]*100:6:1,'%');
 end;
 write(f1,'ʤ������':12);
 for j:=2 to 5 do
 begin
  if tmp[j]=0 then write(f1,'-':15)
   else if history[j,1]=0 then write(f1,'100%':15)
   else write(f1,(1-(history[j,1]/tmp[j]))*100:14:1,'%');
 end;
 if tmp[6]=0 then write(f1,'-':7)
  else write(f1,(1-tmpc[1]/tmp[6])*100:6:1,'%');
 writeln(f1);
 write(f1,'����������':12);
 for j:=2 to 5 do
 begin
  write(f1,history[j,11]:9,'/',history[j,12]:5);
 end;
 if history[2,12]+history[3,12]+history[4,12]+history[5,12]=0 then writeln(f1,'   0.0%')
  else writeln(f1,(history[2,11]+history[3,11]+history[4,11]+history[5,11])*100/
         (history[2,12]+history[3,12]+history[4,12]+history[5,12]):6:1,'%');
 writeln(f1,'********************************************************************************');
 close(f1);
 writeln('����ս���Ѿ��ɹ�������Ŀ¼��c:\history.txt��');
end;{end testtype=======}
end;{end savehis========}
procedure savegame;{&&&&&&&&&&&&&&&&&&&&&&&&&&&&save&&&&&&&&&&&&&&&&&&&&&&&&&}
var
 f1,f2:text;
 i,j:integer;
 rps,alives,moneys,exps,hiss,tmps,bankms,lilvs,times,lilvdates,lilvends,lilvlasts,nameks:string;
            procedure bianma(s:string);
            var
             i:integer;
             st:string;
            begin
             st[0]:=s[0];
             for i:=1 to length(s) do
              s[i]:=chr(ord(s[i])+i);
             for i:=1 to length(s) do
              st[i]:=s[length(s)+1-i];
             s:=st;
             writeln(f1,s);
            end;
begin
 assign(f1,'c:\kingcard.sav');
 rewrite(f1);
 for i:=1 to 8 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
 end;
 whoalives[0]:=chr(90);
 for i:=0 to 44 do
  if whoalive[i]=true then
  begin
   whoalives[i+1]:='@';
   whoalives[i+46]:='$';
  end
  else if whoalive[i]=false then
  begin
   whoalives[i+1]:='#';
   whoalives[i+46]:='@';
  end;
 writeln(f1,whoalives);
 str(alive,alives);
 bianma(alives);
 str(rp,rps);
 bianma(rps);
 for i:=1 to 8 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
 end;
 bianma(namep[0]);
 for i:=1 to 3 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
 end;
 str(money[0],moneys);
 bianma(moneys);
 for i:=1 to 4 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
 end;
 str(exp,exps);
 bianma(exps);
 for i:=1 to 6 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
 end;
 for i:=1 to 10 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
  for j:=2 to 5 do
  begin
   str(history[j,i]*history[j,i],hiss);
   bianma(hiss);
  end;
 end;
 for i:=0 to 8 do
 begin
  str(bankm[i],bankms);
  bianma(bankms);
 end;
 str(lilv,lilvs);bianma(lilvs);
 str(time,times);bianma(times);
 str(lilvend,lilvends);bianma(lilvends);
 str(lilvdate,lilvdates);bianma(lilvdates);
 for i:=1 to 6 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
 end;
 for i:=0 to 80 do
 begin
  str(lilvlast[i],lilvlasts);
  bianma(lilvlasts);
 end;
 for i:=1 to 6 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
 end;
 for i:=11 to 12 do
 begin
  str(random(1000000),tmps);
  bianma(tmps);
  for j:=2 to 5 do
  begin
   str(history[j,i]*history[j,i],hiss);
   bianma(hiss);
  end;
 end;
 if testtype then bianma('1') else bianma('0');
 //breakdown212
 if alreadywin then bianma('1') else bianma('0');
 str(namek,nameks);bianma(nameks);
 close(f1);
 //*******************************************************************copy save***********
 assign(f1,'c:\windows\system32\savebackKC.dll');
 rewrite(f1);
 assign(f2,'c:\kingcard.sav');
 reset(f2);
 while not eof(f2) do
 begin
  readln(f2,tmps);
  writeln(f1,tmps);
 end;
//breakdown
 close(f2);
 close(f1);
end;
procedure soundbool;
begin
 if sound then
 begin
  write('********************************************************************************');
  sound:=false;
  writeln('�ر���Ч��');
  writeln('********************************************************************************');
 end else
 if not sound then
 begin
  write('********************************************************************************');
  sound:=true;
  write('������Ч��');
  writeln(chr(7));
  writeln('********************************************************************************');
 end;
end;
procedure ao(s:string);
begin
 if s='-sa' then
 begin
  write('********************************************************************************');
  savegame;
  writeln('��ѡ���˱��沢�˳���Ϸ����ϵ�ף����Ϸ��죡');
  writeln('���Ĵ浵�ļ�������c:\kingcard.sav�������Ʊ�����ļ�����ȷ���ô浵�ļ��������ڴ�Ŀ¼�±����¶�ȡ����ô���´��ټ�����');
  write('********************************************************************************');
  readln;
  halt;
 end;
 if s='-lv' then writelv;
 if s='-he' then writehelp;
 if s='-hi' then writehis;
 if s='-so' then soundbool;
 if s='-sahi' then savehis;
 if s='-loser' then begin loser:=true;writeln('��ѡ���������Ͷ�������ڱ��ֽ������Զ��뿪���ľ֣�'); end;
end;
procedure readlntmp;
var
 s:string;
begin
 readln(s);
 if s<>'' then ao(s);
end;
//*******************************************calculate***********************************************************
procedure calculate1;
var
  stack1:array[1..1000] of longint;
  stack2:array[1..1000] of char;
  top1,top2:longint;
  t:char;
procedure calculate;
  var
    x,x1,x2:longint;
    t:char;
  begin
    t := stack2[top2];
    dec(top2);
    x2 := stack1[top1];
    dec(top1);
    x1 := stack1[top1];
    dec(top1);
    case t of
      '+':x := x1+x2;
      '-':x := x1-x2;
      '*':x := x1*x2;
      '/':x := x1 div x2;
    end;
    inc(top1);
    stack1[top1] := x;
  end;
procedure solve;
  var
    t:char;
    temp:longint;
  begin
    read(t);
    while t<>'=' do
      begin
        case t of
          '+','-':
            begin
              while (top2>0) and (stack2[top2]<>'(') do
                calculate;
              inc(top2);
              stack2[top2] := t;
              read(t);
            end;
          '*','/':
            begin
              while (top2>0) and ((stack2[top2]='*') or (stack2[top2]='/')) do
                calculate;
              inc(top2);
              stack2[top2] := t;
              read(t);
            end;
          '(':
            begin
              inc(top2);
              stack2[top2] := t;
              read(t);
            end;
          ')':
            begin
              while stack2[top2]<>'(' do
                calculate;
              dec(top2);
              read(t);
            end;
          '0'..'9':
            begin
              temp := 0;
              repeat
                temp := temp*10+ord(t)-48;
                read(t);
              until not ((t<='9') and (t>='0'));
              inc(top1);
              stack1[top1] := temp;
            end;
          else t:='=';
        end;
      end;
    while top2>0 do
      calculate;
    writeln('��ļ�����Ϊ��      ',stack1[top1]);
    writeln('********************************************************************************');
    readlntmp;
  end;
procedure helps;
begin
 top1:=0;top2:=0;t:=' ';
 savegame;
 writeln('********************************************************************************');
 writeln('& ��Ϸ�Ѿ��Զ��浵��ʹ�ü������Ƿ�������ܵ�����Ϸ�����˳�����������ȷ�ĸ�ʽ��');
 writeln('& ֧�ּӼ��˳����ڼ����ŵ����㣨���ɺ��Ժ����ţ�');
 write('���������ʽ��        ');
end;
begin
  helps;
  solve;
end;
//*******************************************calculate***********************************************************
procedure bank;
var
 i:integer;s1,nt:string;n:int64;s,code:integer;
        procedure PrintK;
        var
          i,j:integer;
              procedure PrintKp(x,y:integer);
              begin
               if y=lilvlarge then writeln else
               if y=-1 then begin
                  if x=1 then write('+',11-x) else
                  if (x>1)and(x<11) then write(' +',11-x) else
                  if x=11 then write('  ',11-x) else
                  if (x>11)and(x<21) then write(' ',11-x) else
                  if x=22 then write('   ') else
                    write(11-x)
               end else
               if y=0 then write(chr(bianbian)) else
               if x=22 then write(chr(bianbian)) else
               if lilvend<>lilvlarge then
               begin
                 if 11-x=lilvlast[y] then
                 begin if (y mod daypart)=0 then write(chr(diandian)) else write(chr(xianxian))
                  end else if (y mod 10=0)or(x mod 5=1) then write('.') else write(' ');
               end else
               if lilvend=lilvlarge then
               begin
                if y+lilvdate<=lilvlarget then
                begin
                 if 11-x=lilvlast[y+lilvdate] then
                 begin if (y mod daypart)=0 then write(chr(diandian)) else write(chr(xianxian))
                  end else if (y mod 10=0)or(x mod 5=1) then write('.') else write(' ');
                end else
                if y>lilvlarget then
                begin
                 if (y mod 10=0)or(x mod 5=1) then write('.') else write(' ');
                end else
                if y+lilvdate>lilvlarget then
                begin
                 if 11-x=lilvlast[y+lilvdate-lilvlarget] then
                 begin if (y mod daypart)=0 then write(chr(diandian)) else write(chr(xianxian))
                  end else if (y mod 10=0)or(x mod 5=1) then write('.') else write(' ');
                end else
               end else
               write('*');
              end;
        begin
           writeln;
           writeln('                              �����������������ͼ');
           for i:=1 to 22 do
            for j:=-1 to lilvlarge do
             PrintKp(i,j)
        end;
begin
 getlv;bankm[2]:=min(100,lv+9);
 if exp<50000 then bankm[5]:=trunc((exp*trunc(exp/1000)*trunc(exp/1000)-bankm[6])/(1+min(4,trunc(exp/1000))))
// bankm[5]:=trunc((exp*trunc(exp/1000)*trunc(exp/1000)*trunc(exp/1000)-bankm[6])/(1+min(4,trunc(exp/1000))))
  else bankm[5]:=trunc((125000000-bankm[6])/(1+min(4,trunc(exp/1000))));
 bankm[7]:=bankm[2]-time;
 savegame;
 if firstbank then begin writeln;writeln('���μ�����������ǰ��ѡ����������뿪���к�������֮ǰ��ѡ��������������Ϸ��');readlntmp;firstbank:=false; end;
 for i:=1 to 40 do writeln;
 writeln('��ӭ�������У������˻�����  ',namep[0],' �������԰����ҵ���У�');writeln;
 writeln('�鿴ע������          �밴0');writeln;
 writeln('���                  �밴1');
 writeln('ȡ��                  �밴2');
 writeln('��ѯ���              �밴3');
 writeln('��ѯ��Ϣ              �밴4');writeln;
 writeln('�������              �밴5');  // exp*sqr(trunc(exp/1000))*trunc(exp/1000)
 writeln('������              �밴6');  //bankm[2]��[7]
 writeln('��ѯ�ɴ�����        �밴7');writeln;
 writeln('������                �밴8');writeln;
 writeln('�뿪����              �밴9');
 write('��������Ҫ���еĲ�����          ');
 readln(s1);val(s1,s,code);if code<>0 then begin writeln('����������ʽ��');readlntmp;bank;exit; end;
 if s=0 then begin
   writeln('*******************************************************************************');
   writeln('���а�����');
   writeln('��������ϵ�Ϊ-10%~10%���뽫�������Ʊ=��=�����з��գ������������');
   writeln('��Ϣ����Ϊÿ�ζľֽ�������һ�죨������һ��AI�뿪��������');
   writeln('ȡ�����������Ϣ��1%����ֵ��Ϊ�������(����666)�����ȡ������ͨ�������룡');
   writeln('�����ڶ����Ʋ��󣬻��л���ȡ������֮һ�Ĵ����ߴ��������Ϸ��');
   writeln('�ɴ�����ֻ���ھ���ֵ��Ч��exp*sqr(trunc(exp/1000))/(1+min(4,trunc(exp/1000)))');
   writeln('��������ֻ���ڵȼ���Ч��lv+9��');
   writeln('ÿ10�������Ϣ����1����������5������������С��100�죬�ɴ����С��2500��Ԫ��');
   writeln('�������޷��������Ļ����㽫�Ʋ������޷��뿪���У������������ɣ�');
   writeln('********************************************************************************');
   readlntmp;
   bank; exit;
 end else
 if s=1 then begin
   write('��������Ҫ���Ľ�          ');readln(nt);val(nt,n,code);if code<>0 then begin writeln('����������ʽ��');readlntmp;bank;exit; end;
   if n<money[0] then begin dec(money[0],n);bankm[1]:=bankm[1]+n;writeln('��������',n,'�������ֽ����Ϊ',money[0],'�����Ķ��ڴ�����Ϊ',bankm[1]); readlntmp;
    end else begin writeln('�Բ����������㡣');readlntmp;end;bank;  exit;
 end else
 if s=2 then begin
   write('��������Ҫȡ��Ľ�          ');readln(nt);val(nt,n,code);if code<>0 then begin writeln('����������ʽ��');readlntmp;bank;exit; end;
   if n<=bankm[1] then begin inc(money[0],n);dec(bankm[1],n);write('��ȡ����',n,'�������ֽ����Ϊ',money[0],'�����Ķ��ڴ�����Ϊ',bankm[1]);readlntmp;
    writeln('ͨ����ȡ��������˾���ֵ',max(-666,min(666,trunc(bankm[4]/100))),'��');inc(exp,max(-666,min(666,trunc(bankm[4]/100))));bankm[4]:=0;getlv;readlntmp;
    end else begin writeln('�Բ����������㡣');readlntmp;end;bank;  exit;
 end else
 if s=3 then begin writeln('�����ֽ����Ϊ',money[0],'�����Ķ��ڴ�����Ϊ',bankm[1],'��');readlntmp;bank;exit; end else
 if s=4 then begin PrintK;writeln('��������Ϊ',lilv,'%������ǰ������ϢΪ',bankm[4],'����ȡ������Ϊ',bankm[1],'��');readlntmp;bank;exit; end else
 if s=9 then begin writeln('���Ѿ��뿪���У���ô����Ҫ�ٴν������л��Ǽ������������Ϸ��(������Χ2-5)��');savegame;firstbank:=true;exit; end else
 if s=7 then begin write('���������ն�ࡣֻ�������ľ���ֵ�������Դ��������Ϊ��',bankm[5]:10);writeln('������Ҫ���������Ϊ',bankm[6]:10,'��');writeln('���Ļ�������Ϊ',bankm[7],'�죡');readlntmp;bank;exit; end else
 if s=5 then begin write('��������Ҫ����Ľ�          ');readln(nt);val(nt,n,code);if (n<=0)or(code<>0) then begin writeln('����������ʽ��');readlntmp;bank;exit; end;
   if n<=bankm[5] then begin inc(money[0],n);inc(bankm[6],n*(1+min(4,trunc(exp/1000))));writeln('��������',n,'�������ֽ����Ϊ',money[0],'�����Ĵ����Ϊ',bankm[6]:10,'��');write('   ���Ļ�������Ϊ',bankm[7],'�죡');readlntmp;bank;exit;
    end else begin writeln('�Բ������ɴ����㡣');readlntmp;end;bank;  exit;
 end else
 if s=6 then begin write('��������Ҫ����Ľ�          ');readln(nt);val(nt,n,code);if code<>0 then begin writeln('����������ʽ��');readlntmp;bank;exit; end;
   if (money[0]>=n)and(n<=bankm[6]) then begin dec(money[0],n);dec(bankm[6],n);if bankm[6]=0 then time:=0;bankm[7]:=bankm[2]-time;
    writeln('��������',n,'�������ֽ����Ϊ',money[0],'�����Ĵ����Ϊ',bankm[6]:10,'��');write('   ���Ļ�������Ϊ',bankm[7],'�죡');readlntmp;bank;exit;
   end else begin writeln('�Բ������ɻ�����򳬹�����ֵ��');readlntmp;end;bank;  exit;
 end else
 if s=8 then begin calculate1;readlntmp;bank;exit; end else
 begin writeln('����������ʽ��');readlntmp;bank;exit; end;
end;
procedure continuegame;
var
  i:integer;
begin
  alive:=45;
  whoalives[0]:=chr(90);
  for i:=0 to 44 do
  begin
   whoalive[i]:=true;
   whoalives[i+1]:='$';
   whoalives[i+46]:='$';
  end;
  //breakdown212
  alreadywin:=true;
  namep[0]:='���ʥ��� '+namep[0];namek:=namek+11;
  savegame;
  writeln('����������ƺš��������ʥ��١������������½�����Ϸѡ�� ��ȡ�浵 ~');
  readlntmp;
  readlntmp;
  readlntmp;
  halt;
end;
procedure wingame;
var i,j:integer;s:string;
begin
 for i:=1 to 3 do begin
  write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
  writeln('��ŶŶŶŶŶŶ~~~~~��������Ӯ��!!!!');
  write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
  if sound then
   for j:=1 to 10 do
    write(chr(7));
  savegame;
  readlntmp;
 end;
 writeln('�뽫����ս���ϴ���http://hi.baidu.com/xiafb���԰塣������-sahi����ս����');
 readln(s);if s='-sahi' then savehis;
 readln(s);if s='-sahi' then savehis;
 writeln('��ϲ�����������ʤ������ϲ��֮�࣬���ǲ��ǻ������������˿˵��������أ�');
 writeln('������ͨ������continue�����Դ˴浵���½�����Ϸ~');
 readln(s);if s='continue' then continuegame;
 readln(s);if s='continue' then continuegame;
 readln(s);if s='continue' then continuegame;
 halt;
end;
procedure deadman;
var
 i:integer;
begin
  if (lv<-1)or(money[0]<=0) then
  begin
   if firstdead then begin bankm[1]:=trunc(0.5*bankm[1]);firstdead:=false; end;
   for i:=1 to 3 do begin
    write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
    writeln('��ĵȼ�̫���˻������Ѿ���ҵ����ˣ���л�����ʵ���Ϸ�������������������ɣ�');
    writeln('��Ҳ��������-bank����Ĵ����ȡ�������δ�ɵ�ծ��');
    write('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
    savegame;
    readln(endss);
    if endss='-bank' then begin bank;if money[0]<=0 then deadman;exit; end;
   end;
   halt;
  end else
  if alive=0 then wingame;
end;
procedure init;{&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&init&&&&&&&&&&&&&&&&&&&&&&&&&&&}
var
 i,j:integer;
 s:string;
          procedure newload;
          var s:string;
              i:integer;
                    procedure loadgame;
                    var
                     f1:text;
                     i,j,code:integer;
                     ht:int64;
              nameks,rps,alives,names,moneys,exps,hiss,tmps,bankms,lilvs,times,lilvends,lilvdates,lilvlasts:string;
                                procedure jiema(var s:string);
                                var
                                 t:string;
                                 i:integer;
                                begin
                                 readln(f1,t);
                                 s[0]:=t[0];
                                 for i:=1 to length(t) do
                                  s[i]:=t[length(t)+1-i];
                                 for i:=1 to length(t) do
                                  s[i]:=chr(ord(s[i])-i);
                                end;
                                procedure checkbreak;
                                var
                                 f1,f2:text;s1,s2:string;i:integer;
                                begin
                                 assign(f1,'c:\kingcard.sav');
                                 reset(f1);
                                 assign(f2,'c:\windows\system32\savebackKC.dll');
                                 reset(f2);
                                 repeat
                                  if not eof(f1) then readln(f1,s1);
                                  if not eof(f2) then readln(f2,s2);
                                 until (s1<>s2) or eof(f1) or eof(f2) ;
                                 if not(eof(f1) and eof(f2) and (s1=s2)) then
                                 begin
                                  writeln('�浵�ļ��Ѿ��𻵣���ѡ��ʼ����Ϸ������Ϸ���浵��ַ��c:\kingcard.sav');
                                  for i:=1 to 5 do readlntmp;
                                  close(f1);
                                  close(f2);
                                  halt;
                                 end;
                                 close(f1);
                                 close(f2);
                                end;
                                function checkload:boolean;
                                var
                                 f1:text;i:integer;s:string;
                                begin
                                 assign(f1,'c:\windows\system32\savebackKC.dll');
                                 reset(f1);
                                 for i:=1 to 19 do readln(f1);readln(f1,s);
                                 close(f1);
                                 if s='hdqm' then exit(true) else exit(false);
                                end;
                    begin
                     //breakdown212
                     if checkload then begin
                      writeln('ͨ����ش浵�ļ���ȡ��Ϸ��');
{                     if fileexists('c:\windows\system32\savebackKCn.dll') then begin
                         assign(f1,'c:\windows\system32\savebackKCn.dll');
                         reset(f1);
                         readln(f1,tmps);
                         close(f1);
                         if tmps[1]='1' then begin
                            assign(f1,'c:\windows\system32\savebackKCn.dll');
                            rewrite(f1);
                            writeln(f1,2);
                            close(f1);
                         end else begin
                            writeln('�Ѿ�������ش浵��ȡ�������ƣ���������Ϸ��ѡ��ʼ����Ϸ������Ϸ��');
                            for i:=1 to 3 do readlntmp;
                            halt;
                         end;
                      end else begin
                         assign(f1,'c:\windows\system32\savebackKCn.dll');
                         rewrite(f1);
                         writeln(f1,1);
                         close(f1);
                      end;}
                     end else checkbreak;
                     assign(f1,'c:\kingcard.sav');
                     reset(f1);
                     for i:=1 to 8 do
                     readln(f1);
                     readln(f1,whoalives);
                     for i:=1 to 45 do
                      if (whoalives[i]='@')and(whoalives[i+45]='$') then
                       whoalive[i-1]:=true
                       else if (whoalives[i]='#')and(whoalives[i+45]='@') then
                       whoalive[i-1]:=false
                       else
                       begin
                        writeln('�浵�ļ��Ѿ��𻵣���ѡ��ʼ����Ϸ������Ϸ���浵��ַ��c:\kingcard.sav');
                        readlntmp;
                        halt;
                       end;
                     jiema(alives);
                     val(alives,alive,code);
                     jiema(rps);
                     val(rps,rp,code);
                     for i:=1 to 8 do
                     readln(f1);
                     jiema(names);
                     namep[0]:=names;
                     for i:=1 to 3 do
                     readln(f1);
                     jiema(moneys);
                     val(moneys,money[0],code);
                     for i:=1 to 4 do
                     readln(f1);
                     jiema(exps);
                     val(exps,exp,code);
                     getlv;
                     for i:=1 to 6 do
                     readln(f1);
                     for i:=1 to 10 do
                     begin
                      readln(f1);
                      for j:=2 to 5 do
                      begin
                       jiema(hiss);
                       val(hiss,ht,code);
                       history[j,i]:=trunc(sqrt(ht));
                       if history[j,i]*history[j,i]<>ht then
                       begin
                        writeln('�浵�ļ��Ѿ��𻵣���ѡ��ʼ����Ϸ������Ϸ���浵��ַ��c:\kingcard.sav');
                        readlntmp;
                        halt;
                       end;
                      end;
                     end;
                     for i:=0 to 8 do
                     begin
                      jiema(bankms);
                      val(bankms,bankm[i],code);
                     end;
                     jiema(lilvs);val(lilvs,lilv,code);
                     jiema(times);val(times,time,code);
                     jiema(lilvends);val(lilvends,lilvend,code);
                     jiema(lilvdates);val(lilvdates,lilvdate,code);
                     for i:=1 to 6 do
                     readln(f1);
                     for i:=0 to 80 do
                     begin
                      jiema(lilvlasts);
                      val(lilvlasts,lilvlast[i],code);
                     end;
                     for i:=1 to 6 do
                     readln(f1);
                     for i:=11 to 12 do
                     begin
                      readln(f1);
                      for j:=2 to 5 do
                      begin
                       jiema(hiss);
                       val(hiss,ht,code);
                       history[j,i]:=trunc(sqrt(ht));
                      end;
                     end;
                     jiema(tmps);
                     if tmps='1' then testtype:=true else if tmps='0' then testtype:=false;
                     //breakdown212
                     jiema(tmps);
                     if tmps='1' then alreadywin:=true else if tmps='0' then alreadywin:=false;
                     jiema(nameks);val(nameks,namek,code);
                     close(f1);
                     if alreadywin then begin
                      writeln('�𾴵�',namep[0],'���ã�������ѡ�����ģʽ������Ϸ��');
                      writeln('�����룺������Ϸģʽ��');
                      writeln('����1 ��������Ϸģʽ��');
                      readln(tmps);
                      val(tmps,playtype,code);
                      if tmps='' then playtype:=0
                      else begin
                       while (code<>0)or(playtype>1)or(playtype<0) do
                       begin
                        writeln('�������˴���ĸ�ʽ���밴����ȷ��ʽ���룡');
                        readln(tmps);
                        val(tmps,playtype,code);
                       end;
                      end;
                      case playtype of
                       0:writeln('��ѡ����������Ϸģʽ��');
                       1:writeln('��ѡ����������Ϸģʽ��');
                      end;readln;
                     end else playtype:=0;
                    end;
          begin
           writeln;
           writeln('���κ����������������� (-he) ��ȡ��Ϸ������');
           writeln('��ʼ����Ϸ�����Ḳ�����н��ȣ��� ������ ��ȡ�浵  (new\load) ��');
           readln(s);if s='-sa' then loadgame;ao(s);firstbank:=true;firstdead:=true;
           while (s<>'new')and(s<>'load') do
           begin
            writeln('�������˴���ĸ�ʽ���밴����ȷ��ʽ���룡');
            readln(s);if s='-sa' then loadgame;ao(s);
           end;
           if s='load' then
             loadgame
            else begin
             writeln('������������֣���֧�����ֵ���̳��� 4����󳤶� ',namek-2,'����');
             readln(namep[0]);ao(namep[0]);
             while (length(namep[0])>namek-2)or(length(namep[0])<4) do
             begin
               writeln('�����������̫�̻���̫���ˣ����������룡');
               readln(namep[0]);ao(namep[0]);
             end;
             money[0]:=10000;
             fillchar(history,sizeof(history),0);
             exp:=1000;
             getlv;
             alive:=45;
             whoalives[0]:=chr(90);
             for i:=0 to 44 do
             begin
              whoalive[i]:=true;
              whoalives[i+1]:='$';
              whoalives[i+46]:='$';
             end;
             //initdata
             fillchar(bankm,sizeof(bankm),0);bankm[7]:=1000;bankm[2]:=1000;
             time:=0;lilv:=0;lilvend:=0;lilvdate:=0;testtype:=false;
             fillchar(lilvlast,sizeof(lilvlast),25);
             rp:=100;lilvlast[0]:=0;namek:=14;
             alreadywin:=false;playtype:=0;//breakdown212
             savegame;
            end;
           writeln('���������ǣ�',namep[0]);
           writeln('���ĵȼ��ǣ�',lv);
           writeln('��ӵ�еĽ�Ǯ��',money[0]);
           readlntmp;
          end;
begin
 for j:=0 to 3 do
  for i:=0 to 12 do
  begin
   card[j*13+i].a:=chr(j+3);
   card[j*13+i].b:=cardtmp[i];
  end;
 sound:=false;
 for i:=1 to picturen do
  writeln(picture[i]);
 writeln('���˿����ˣ�����');namek:=14;
 write('��Ϸ�汾��V2.110212  �������µ���Ϸģʽ��������ʤ���ƺš���΢�ϵ��˵��Ե������ʡ��ϵ���1����ע�������˸ߵȼ��Ļ������ޡ������κ����������������');
 readlntmp;
 newload;
 deadman;
{ for i:=0 to 51 do         shuchu card ceshi shuju
 begin
  write(card[i].b:2,card[i].a:3);
  if (i+1)mod 13=0 then writeln;
 end;     }
end;
function getcard:integer;{&&&&&&&&&&&&&&&&&&&&&&&&&function&&&&&&&&&&&&&}
var tmp:integer;
begin
 repeat
  tmp:=random(5251) mod 52;
 until not bool[tmp];
 bool[tmp]:=true;
 exit(tmp);
end;
function getzhizunbao:integer;{&&&&&&&&&&&&&&&&&&&&&&&&&function&&&&&&&&&&&&&}
var tmp1:integer;
begin
{if playertmp=0 then begin}
 tmp1:=21;
 repeat  inc(tmp1);
 until not bool[tmp1]; if tmp1=26 then tmp1:=13;
 bool[tmp1]:=true;
{end
else begin
 repeat
  tmp1:=random(5251) mod 52;
 until not bool[tmp1];
 bool[tmp1]:=true;  end;}
 exit(tmp1);
end;
procedure game;{&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&game&&&&&&&&&&&&&&&&&&&&}
var
 i,j,tmp,maxtpt1,winnumpt1:integer;mid,mtmp,shui,mint:int64;
 getout:boolean;
 winpt1:array[0..4]of boolean;
 hum:array[0..4,1..5]of integer;
 mark:array[0..4]of integer;
 tmoney:array[0..4]of int64;
      procedure readlnn(var a:integer);
      var s:string;
      begin
{       while bankm[7]<=0 do begin writeln('���Ļ��������ѵ�����������л��');readlntmp;bank; end;
       if bankm[7]<=5 then begin writeln('   ���Ļ�������ֻʣ',bankm[7],'�죡');readlntmp; end;}
       readln(s);ao(s);if s='-bank' then bank;
       while (s<'2')or(s>'5')or(length(s)<>1) do
       begin
        writeln('�������˴���ĸ�ʽ���밴����ȷ��ʽ���룡');
        readln(s);ao(s);if s='-bank' then bank;
       end;
       a:=ord(s[1])-48;
      end;
      procedure readlnout;
      var s:string;
      begin
       readln(s);ao(s);
       while (s<>'y')and(s<>'n') do
       begin
        writeln('�������˴���ĸ�ʽ���밴����ȷ��ʽ���룡');
        readln(s);ao(s);
       end;
       if s='y' then getout:=true else inc(history[playershis,12]);//breakdown
      end;
      procedure writeout(who:integer);{====================writeoutcard======}
      var
       i,j,k:integer;
const
pic:array[0..3,1..12]of string=((('###########'),
('#         #'),
('#     #'),
('#  '),
('##'),
('##'),
('#  #'),
('#    #'),
('#      #'),
('#        #'),
('#         #'),
('###########')),
(('###########'),
('#        #'),
('#      #'),
('#    #'),
('#  #'),
('##'),
('#  #'),
('#    #'),
('#      #'),
('#        #'),
('#         #'),
('###########')),
(('###########'),
('#      #'),
('#    #'),
('#        #'),
('#    #'),
('##'),
('#    #'),
('#        #'),
('#    #'),
('#    #'),
('#         #'),
('###########')),
(('###########'),
('#        #'),
('#      #'),
('#  #'),
('##'),
('##'),
('#  #'),
('#      #'),
('#        #'),
('#    #'),
('#         #'),
('###########')));
      begin
       if who>6{who<>0} then
       begin
        writeln('����',namep[who]:namek,' ӵ�е�����Ϊ��');
        for i:=1 to 5 do
        begin
         if hum[who,i]mod 13<>9 then j:=14 else j:=13;
          write(card[hum[who,i]].a:j,card[hum[who,i]].b);
        end;
        writeln;
       end else
       begin
        writeln('����',namep[who]:namek,' ӵ�е�����Ϊ��');
        for k:=1 to 10 do
        begin
         for i:=1 to 4 do
         begin
          if hum[who,i]mod 13<>9 then j:=5 else j:=5;
           write(pic[hum[who,i]div 13,k],'     ');
         end;
         i:=5;
         if hum[who,i]mod 13<>9 then j:=5 else j:=5;
          write(pic[hum[who,i]div 13,k]);
         writeln;
        end;
        for i:=1 to 4 do
        begin
         write('#');
         write(card[hum[who,i]].b:j);
         if j=5 then write('    #     ') else write('   #     ');
        end;
        i:=5;
        write('#');
        write(card[hum[who,i]].b:j);
        if j=5 then write('    #') else write('   #');
        writeln;
        for i:=1 to 4 do
         write(pic[hum[who,i]div 13,12],'     ');
        i:=5;
        write(pic[hum[who,i]div 13,12]);
        writeln;
       end;
      end;
      procedure readthrow;
      var
       s:string;
       throw:array[1..5]of integer;
       i:integer;asdf,zhizunbaobo:boolean;
        function boolt:boolean;
        var i,temp,code:integer;
            bt:array[1..5]of boolean;
        begin
         if s='all' then
         begin
          s:='1 2 3 4 5';
         end;
         if s='0' then begin asdf:=true;exit(true); end;
         if length(s)mod 2<>1 then exit(false);
         if length(s)>9 then exit(false);
         for i:=1 to (length(s)-1)div 2 do
          if s[2*i]<>' ' then exit(false);
         temp:=0;fillchar(bt,sizeof(bt),0);
         for i:=1 to (length(s)+1)div 2 do
          begin
           inc(temp);
           val(s[2*i-1],throw[temp],code);
           if code<>0 then exit(false);
           if throw[temp]<1 then exit(false);
           if throw[temp]>5 then exit(false);
           if bt[throw[temp]] then exit(false);
           bt[throw[temp]]:=true;
          end;
         exit(true);
        end;
      begin
       asdf:=false;zhizunbaobo:=false;
       readln(s);ao(s);        //getzhizunbao
       if s='zhizunbao' then
       begin testtype:=true;namep[0]:='���Դ浵';s:='1 2 3 4 5';zhizunbaobo:=true;fillchar(bool,sizeof(bool),0);end;
       while not boolt do
       begin
        writeln('�������˴���ĸ�ʽ���밴����ȷ��ʽ���룡');
        readln(s);ao(s);
        if s='zhizunbao' then
        begin testtype:=true;namep[0]:='���Դ浵';s:='1 2 3 4 5';
              zhizunbaobo:=true;fillchar(bool,sizeof(bool),0);if boolt then break; end;
       end;
       if asdf then exit;
       for i:=1 to (length(s)+1)div 2 do
       begin
        write('���ӵ��ˣ� ',card[hum[0,throw[i]]].a,card[hum[0,throw[i]]].b);
        if zhizunbaobo then hum[0,throw[i]]:=getzhizunbao else hum[0,throw[i]]:=getcard;
        writeln('  ���µõ��ˣ� ',card[hum[0,throw[i]]].a,card[hum[0,throw[i]]].b);
       end;
       readlntmp;
      end;
      function getmark(who:integer):integer;{1..10}
      var
       a,b:array[1..5]of integer;
       tonghua,shun,zhizun:boolean;
       ttt:array[0..12]of integer;
       i,double,three,four,tmin,tmax:integer;
      begin
       for i:=1 to 5 do
       begin
        a[i]:=hum[who,i]div 13;
        b[i]:=hum[who,i]mod 13;
       end;
       fillchar(ttt,sizeof(ttt),0);double:=0;three:=0;four:=0;
       if (a[1]=a[2]) and(a[2]=a[3]) and(a[3]=a[4])and (a[4]=a[5]) then
        tonghua:=true else tonghua:=false;
       for i:=1 to 5 do
       begin
        inc(ttt[b[i]]);
        if ttt[b[i]]=2 then inc(double);
        if ttt[b[i]]=3 then begin inc(three);dec(double);end;
        if ttt[b[i]]=4 then begin inc(four);dec(three);end;
       end;
       if four=1 then exit(8)
       else if (three=1)and(double=1)and(four=0)then exit(7)
       else if (three=1)and(double=0)and(four=0)then exit(4)
       else if double=2 then exit(3)
       else if (double=1){and((ttt[12]=2)or(ttt[11]=2)or(ttt[10]=2)or(ttt[0]=2))} then exit(2)
       else if double=1 then exit(1)
       else begin
        tmax:=0;tmin:=15;
        for i:=1 to 5 do
        begin
         if b[i]>tmax then tmax:=b[i];
         if b[i]<tmin then tmin:=b[i];
        end;
        if tmax-tmin=4 then shun:=true else shun:=false;
        if (ttt[0]=1)and(ttt[12]=1)and(ttt[11]=1)
          and(ttt[10]=1)and(ttt[9]=1) then zhizun:=true else zhizun:=false;
        if tonghua and zhizun then exit(10)
        else if tonghua and shun then exit(9)
        else if (shun or zhizun)and (not tonghua) then exit(5)
        else if (tonghua) and (not shun) and (not zhizun) then exit(6);
       end;
       exit(1);
      end;
      procedure makescomputer;{*****************************makecomputer*****}
      var
       i,tmp:integer;
       bt:array[0..44]of boolean;
      begin
       fillchar(bt,sizeof(bt),0);
       if players-1>alive then
       begin
        players:=alive+1;
        writeln('���������̫���ˣ���ֻ����ʣ�µ� :',alive,' ����Ҽ��ɻ������ʤ����');
        writeln('ϵͳ�Զ�Ϊ��ѡ��Ϊ ',alive+1,' �ˣ�');
       end;
       for i:=1 to players-1 do
       begin
        repeat
         tmp:=random(4544) mod 45;
        until (not bt[tmp])and(whoalive[tmp]);
        bt[tmp]:=true;
        namep[i]:=namec[tmp];
        if tmp=44 then money[i]:=750000+random(750000)+random(lv*100000)
         else money[i]:=random(10000)+10000+random(lv*10000);
        writeln(namep[i]:namek,'  Я����ע',money[i]:8,'�����˶�����ף�������죡');
        readlntmp;
       end;
      end;
      procedure deadai;{===============deadAI================================}
      var
       i,j,tim:integer;  bool:array[1..4]of boolean;
       function findname(a:string):integer;
       var i:integer;
       begin
         for i:=0 to 44 do if namec[i]=a then exit(i);
       end;
      begin
       fillchar(bool,sizeof(bool),0);tim:=0;
       for i:=1 to players-1 do
        if namep[i]='$���������$' then
        begin
         if money[i]<=8000 then
         begin
          if money[i]<-(255555+1000*lv) then
          begin
           writeln(namep[i]:namek,'�����޷�֧���޶��ծ����׷ծ�������˶ľֺ�������������ˣ�');
           whoalive[findname(namep[i])]:=false;
           inc(history[playershis,11]);
           dec(alive);
           dec(rp,8);
          end else
          begin
           writeln(namep[i]:namek,'����ȫ����������ҵ�����֧����׷ծ�˵ľ޶��ծ��');
          end;
          dec(players);
          inc(tim);
          bool[i]:=true;
         end;
        end else
        begin
         if money[i]<=200 then
         begin
          if money[i]<-(5000+800*lv) then
          begin
           writeln(namep[i]:namek,'�����޷�֧���޶��ծ����׷ծ�������˶ľֺ�������������ˣ�');
           whoalive[findname(namep[i])]:=false;
           inc(history[playershis,11]);
           dec(alive);
           dec(rp,5);
          end
          else
          begin
           writeln(namep[i]:namek,'����ȫ����������ҵ�����֧����׷ծ�˵ľ޶��ծ��');
          end;
          dec(players);
          inc(tim);
          bool[i]:=true;
         end;
        end;
       if (tim<>0)and(players>1) then
       begin
        for i:=1 to players-1 do
        if bool[i] then
        begin
         for j:=i+1 to 4 do
         if not bool[j] then
         begin
          namep[i]:=namep[j];
          money[i]:=money[j];
          bool[i]:=false;
          bool[j]:=true;
          break;
         end;
        end;
        writeln('����������ˣ���Ҫ�뿪��������(y/n)');notloser:=true;playershis:=players;
        readlnout;
       end;
      end;
      procedure choosemid(h:integer);{=========================choose mid====}
      var
       i,tmp,code:longint;
       s:string;
      begin
       mint:=maxlongint*maxlongint;
       if h=0 then
       begin
        //breakdown212
        case playtype of
         0:begin
            mint:=trunc(0.05*money[0]);
            if mint<100 then mint:=100;
            writeln('��߶�ע�������н�Ǯ�� 5% ȷ��Ϊ               ��',mint);
            for i:=0 to players-1 do
             if money[i]<mint then mint:=money[i];
            writeln('��߶�ע���ݶ������������ȷ��Ϊ               ��',mint);
            if mint>lv*500+500 then mint:=lv*500+500;
            writeln('��߶�ע���ݵȼ�ȷ��Ϊ���õȼ����ֵΪ',lv*500+500:7,'����',mint);
           end;
         1:begin
            for i:=0 to players-1 do
             if money[i]<mint then mint:=money[i];
            writeln('��߶�ע���ݶ������������ȷ��Ϊ               ��',mint);
            writeln('��Ŀǰ�ĵȼ�Ϊ                                 ��',lv);
           end;
        end;
        writeln('������������ѡ��Ķ�ע��');
        readln(s);ao(s);
        val(s,tmp,code);
        while (code<>0)or(tmp<=0)or(tmp>mint) do
        begin
         writeln('�������˴���ĸ�ʽ���밴����ȷ��ʽ���룡');
         readln(s);ao(s);
         val(s,tmp,code);
        end;
        mid:=tmp;
       end else
       {//**************copy*****************
       begin
        if namep[h]<>'$���������$' then
         mint:=trunc(0.05*money[h]);
        if mint<100 then mint:=100;
        if namep[h]<>'$���������$' then
        begin
         if mint>lv*500+500 then mint:=lv*500+500;
        end else
         mint:=lv*1500+30*500;
        for i:=0 to players-1 do
         if money[i]<mint then mint:=money[i];
        if namep[h]='$���������$' then
        begin
         if mint<8000 then mid:=mint else mid:=random(mint-8000)+8000;
        end else
        begin
         if mint<100 then mid:=mint else
          mid:=random(mint-100)+100;
        end;
       end;**********************************}
       begin
//******************************************************************************
       case playtype of
        0:begin
           if namep[h]<>'$���������$' then begin
            mint:=trunc(0.05*money[h]);
            if mint<100 then mint:=100;
            if mint>lv*500+500 then mint:=lv*500+500;
            for i:=0 to players-1 do
             if money[i]<mint then mint:=money[i];
            if mint<100 then mid:=mint else
             mid:=random(mint-100)+100;
           end else begin
            mint:=lv*1500+30*500;
            for i:=0 to players-1 do
             if money[i]<mint then mint:=money[i];
            if mint<8000 then mid:=mint else mid:=random(mint-8000)+8000;
           end;
          end;
        1:begin
           if namep[h]<>'$���������$' then begin
            mint:=money[h];
            if mint<100 then mint:=100;
            for i:=0 to players-1 do
             if money[i]<mint then mint:=money[i];
            if mint<100 then mid:=mint else
             mid:=random(mint-100)+100;
           end else begin
            mint:=money[h];
            for i:=0 to players-1 do
             if money[i]<mint then mint:=money[i];
            if mint<8000 then mid:=mint else mid:=random(mint-8000)+8000;
           end;
          end;
       end;
//******************************************************************************
       end;
       writeln(namep[h]:namek,'ѡ���˶�ע ',mid,'Ԫ��');readlntmp;
       writeln('֧����ע ',mid,'Ԫǰ��������ҵĽ�Ǯ������');
       for i:=0 to players-1 do
        begin
         dec(money[i],mid);
         case playtype of
          0:inc(shui,mid);
          1:tmp:=tmp;{continue}
         end;
         writeln(namep[i]:namek,(money[i]+mid):24,money[i]:24);
        end;
       savegame;
       readlntmp;
      end;
      procedure pmid;
      var
       s:string;
       tmp:int64;
       code,i:longint;
        function mf(s:string):boolean;
        begin
        end;
      begin
       if mid<mint then
       begin
        if money[0]div 3<mint-mid then mint:=money[0]div 3+mid;
        writeln('���ڵĶ�עΪ��',mid,'��');
//********************************************************************
     case playtype of
      0:begin
        writeln('�������ɻ���300%��Ǯʹ��ע���������������ӵĶ�ע (m)(��Χ0-',mint-mid,')��');
        readln(s);ao(s);
        if s='m' then tmp:=mint-mid
        else begin
         val(s,tmp,code);
         while (code<>0)or(tmp<0)or(tmp>mint-mid) do
         begin
          writeln('�������˴���ĸ�ʽ���밴����ȷ��ʽ���룡');
          readln(s);ao(s);
          if s='m' then begin tmp:=mint-mid;break end
           else val(s,tmp,code);
         end;
        end;
        for i:=1 to players-1 do
         dec(money[i],tmp);
        inc(mid,tmp);
        dec(money[0],3*tmp);
        inc(shui,tmp*players);
        writeln('�������� ',tmp,'�����ѻ���',3*tmp,'Ԫ�� ��ע������Ϊ',mid,'��');
        end;
      1:begin
        writeln('�������������Ӷ�ע�����������ӵĶ�ע (m)(��Χ0-',mint-mid,')��');
        readln(s);ao(s);
        if s='m' then tmp:=mint-mid
        else begin
         val(s,tmp,code);
         while (code<>0)or(tmp<0)or(tmp>mint-mid) do
         begin
          writeln('�������˴���ĸ�ʽ���밴����ȷ��ʽ���룡');
          readln(s);ao(s);
          if s='m' then begin tmp:=mint-mid;break end
           else val(s,tmp,code);
         end;
        end;
        for i:=0 to players-1 do
         dec(money[i],tmp);
        inc(mid,tmp);
        writeln('�������� ',tmp,'�����ѻ���',tmp,'Ԫ�� ��ע������Ϊ',mid,'��');
        end;
     end;
//********************************************************************
        writeln('��ʣ�µĽ�ǮΪ ',money[0]);
       end;
       savegame;
      end;
      procedure savelilv;
      var i:integer;
      begin
       if lilvdate+daypart<lilvlarget+1 then
       begin
        inc(lilvdate,daypart);
        lilvlast[lilvdate]:=lilv;
        for i:=1 to daypart-1 do
         lilvlast[lilvdate-i]:=lilvlast[lilvdate]-round((lilvlast[lilvdate]-lilvlast[lilvdate-daypart])/daypart*i);
       end else
       begin
        lilvdate:=daypart;
        lilvlast[lilvdate]:=lilv;
        for i:=1 to daypart-1 do
         lilvlast[lilvdate-i]:=
            lilvlast[lilvdate]-round((lilvlast[lilvdate]-lilvlast[lilvlarget])/daypart*i);
        lilvend:=lilvlarge;
       end;
      end;
begin
 writeln('��ӭ��������ӥ�ľ֣�������ϰ��Ǵ�����������ϰ�Ҳ��������ĳЩ����Ŷ��');
 if sound then write(chr(7));
 while bankm[7]<=0 do begin writeln('���Ļ��������ѵ�����������л��');readlntmp;bank; end;
 if bankm[7]<=5 then begin writeln('   ���Ļ�������ֻʣ',bankm[7],'�죡');readlntmp; end;
 writeln('����Ҫ�������л��߼�������˵Ķ���������Ϸ��(��Χ2-5)��');
 readlnn(players);playershis:=players;
 inc(history[playershis,12]);
 savegame;
 //breakdown
 host:=-1;getout:=false;loser:=false;shui:=0;notloser:=false;
 makescomputer;
 beginm:=money[0];
 begine:=exp;
 repeat
  inc(host);if host>=players then host:=0;
  writeln('�µĶľֿ�ʼ�ˣ� �����ֵ� ',namep[host]:namek,' ��ׯ��');
  readlntmp;
  fillchar(hum,sizeof(hum),0);
  fillchar(bool,sizeof(bool),0);
  choosemid(host);
  for j:=1 to 5 do
   for i:=0 to players-1 do
   begin
    tmp:=(i+host)mod players;
    hum[tmp,j]:=getcard;
   end;
  writeout(0);
  pmid;
  readlntmp;
  writeln('��������Ҫ�������ƣ���������磺(1 2 3) (0) (all)�ȣ���λ���м������ո�');
  readthrow;
  for i:=0 to players-1 do
   mark[i]:=getmark(i);
  for i:=1 to players-1 do
  begin
   if mark[i]=1 then
   begin
    for j:=1 to 5 do
    hum[i,j]:=getcard;
   end;
   mark[i]:=getmark(i);
  end;
  inc(history[players,mark[0]]);
//*****************************************change money**********************************************
case playtype of{**********************change win pt***************************}
0:begin
   for i:=0 to players-1 do
   begin
    if i=0 then inc(exp,sqr(many[mark[i]])) else begin
     if mark[i]>7 then dec(exp,sqr(many[mark[i]])) else dec(exp,many[mark[i]]*2);
    end;
    getlv;
   end;
   for i:=0 to players-1 do
    tmoney[i]:=money[i];
   for i:=0 to players-1 do
   begin
    mtmp:=mid*many[mark[i]];
    for j:=0 to players-1 do
    if i<>j then
    begin
     dec(money[j],mtmp);
     inc(money[i],mtmp);
    end;
   end;
   savegame;
   for i:=0 to players-1 do
   begin
    writeout(i);
    if mark[i]=10 then zhizunbao;
    writeln(namep[i]:namek,named[mark[i]]:trunc(namek*1.5),'      ����Ϊ1��',many[mark[i]],'��');
    if (i=0) and(mark[0]=1) and(sound) then write(chr(7));
    if (i<>0)and(mark[i]<>1)and(sound) then
     for j:=1 to mark[i]-1 do
      write(chr(7));
    readlntmp;
   end;
  end;{**********************change win pt0***************************}
1:begin
   //************�ж�ʤ��on******************
   maxtpt1:=0;fillchar(winpt1,sizeof(winpt1),0);winnumpt1:=0;
   for i:=0 to players-1 do
   if mark[i]>maxtpt1 then begin
    fillchar(winpt1,sizeof(winpt1),0);winpt1[i]:=true;winnumpt1:=0;
    maxtpt1:=mark[i];inc(winnumpt1);
   end else if mark[i]=maxtpt1 then begin
    winpt1[i]:=true;inc(winnumpt1);
   end;{************�ж�ʤ��off**���鴦��on***}
   if winpt1[0] then inc(exp,sqr(many[mark[0]]));
   for i:=1 to players-1 do
   begin
    if winpt1[i] then dec(exp,trunc(sqr(many[mark[i]])/2));
    getlv;
   end;{**********���鴦��off***��Ǯ����on****}
   for i:=0 to players-1 do
    tmoney[i]:=money[i]+mid;
   mtmp:=mid*players;
   mtmp:=trunc(mtmp/winnumpt1);
   for i:=0 to players-1 do
   begin
    if winpt1[i] then inc(money[i],mtmp);
   end;{*************��Ǯ����off**���on*******}
   savegame;
   for i:=0 to players-1 do
   begin
    writeout(i);
    if mark[i]=10 then zhizunbao;
    writeln(namep[i]:namek,named[mark[i]]:trunc(namek*1.5),'         ��');
    if (i=0) and(mark[0]=1) and(sound) then write(chr(7));
    if (i<>0)and(mark[i]<>1)and(sound) then
     for j:=1 to mark[i]-1 do
      write(chr(7));
    readlntmp;
   end;{***************���off*****************}
  end;{**********************change win pt1***************************}
end;
//*****************************************change money**********************************************
  for i:=0 to players-1 do begin
   writeln(namep[i]:namek,' Я���Ľ�ǮΪ��',tmoney[i]:11,' �������ˣ�');
   writeln('                       ���棺',(money[i]-tmoney[i]):11,' ��Ǯ��Ϊ��',money[i]);
  end;
  if (mark[0]=1)and(money[0]-tmoney[0]>=0) then dec(history[players,mark[0]]);
  deadman;
  deadai;
  savegame;
  readlntmp;
// writeln(exp,'   ****************************************');
 until (players=1) or getout or loser;if notloser then loser:=false;
 writeln('ɽ����ˮ����������û�в�ɢ����ϯ��',namep[0]:namek,'���Ǿʹ˱���ˣ�');
 if not loser then begin lilv:=random(21)-10;savelilv end;
 if (not loser)and(bankm[1]>0) then begin bankm[4]:=trunc(bankm[1]*(lilv/100));bankm[1]:=trunc(bankm[1]*(1+lilv/100)); end;
 getlv;bankm[2]:=min(100,lv+9);
 if exp<50000 then bankm[5]:=trunc((exp*trunc(exp/1000)*trunc(exp/1000)-bankm[6])/(1+min(4,trunc(exp/1000))))
// bankm[5]:=trunc((exp*trunc(exp/1000)*trunc(exp/1000)*trunc(exp/1000)-bankm[6])/(1+min(4,trunc(exp/1000))))
  else bankm[5]:=trunc((125000000-bankm[6])/(1+min(4,trunc(exp/1000))));
 if (not loser)and(bankm[6]<>0) then inc(time);bankm[7]:=bankm[2]-time;
 readlntmp;
 if loser then writeln('��û��þ���ֵ�Ͷ���˰�գ�') else
 if players>1{getout} then
 begin
  writeln('ͨ����ζľ����������˺��ٵľ���ֵ��',trunc(shui*0.2*0.002),'����');
  inc(exp,trunc(shui*0.2*0.002));
  getlv;
  end else
 if players=1{not getout} then
 begin
  writeln('���ڻ��ܱ������ж��֣�������˶ľ�˰�յ�20%��',trunc(shui*0.2),'����Ϊ������');
  write('������ӵ�еĽ�ǮΪ��');
  inc(money[0],trunc(shui*0.2));
  inc(exp,trunc(shui*0.4*0.005));
  getlv;
  writeln(money[0]);
  writeln('ͨ����ζľ����������˺ܶ�ľ���ֵ��',trunc(shui*0.4*0.005),'����');
  writeln;
 end;
 writeln('ͨ����ζľ����ľ������ӣ�',exp-begine,'��');
 writeln('ͨ����ζľ����Ľ�Ǯ���ӣ�',money[0]-beginm,'��');
 savegame;
 if alive=0 then wingame;
 readlntmp;
end;
begin{&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&main&&&&&&&&&&&&&&}
 randomize;
 init;
 while true do
  game;
end.{&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&main&&&&&&&&&&&&&&}
