//作者    人生不相见  QQ:381998720
program jingwChinese;
const
 maxform=13;
 maxp=5;
 maxE=100;
 maxcom=5;
 named:array[-1..maxform]of string=
   ('佩带位置','等级','强化','伤害','气血','精气','防御','速度','吸血','暴击','闪避','加攻','加速','加防','吸魔');
 nameE:array[1..5]of string=
   ('手持','身穿','头戴','脚穿','佩戴');
 nameH:array[2..6]of string=
   ('体质','智力','力量','耐力','敏捷');
var
 str1,ways,namep,str3:string;
 i,way,code,boltn,boolgon,str3n:longint;
 botl,boolgo,useway:boolean;
 stuff,humana,skilla,equipa:array[-1..maxform] of longint;
 equipW:array[1..5]of string;
 product:array[0..maxp] of longint;
  function bang(lv:longint):boolean;
  begin
    if random(10000)mod 100<lv then exit(true) else exit(false);
  end;
  procedure savemoney;
  var
   f3,f4:text;a,b:longint;
  begin
   assign(f4,'c:\money.txt');
   reset(f4);
     readln(f4);
     readln(f4,a);
     readln(f4);
     readln(f4,b);
   close(f4);
   if way=1 then inc(a) else if way=2 then inc(b);
   assign(f3,'c:\money.txt');
   rewrite(f3);
     writeln(f3,'消耗的低级强化符总共为：');
     writeln(f3,a);
     writeln(f3,'消耗的高级强化符总共为：');
     writeln(f3,b);
     writeln(f3,'消耗的银票总共为(魔钻)：');
     writeln(f3,a*24+b*40);
   close(f3);
  end;
  procedure showmoney;
  var
   f3,f4:text;a,b:longint;
  begin
   assign(f4,'c:\money.txt');
   reset(f4);
     readln(f4);
     readln(f4,a);
     readln(f4);
     readln(f4,b);
   close(f4);
   writeln('消耗的低级强化符总共为：');
   writeln(a);
   writeln('消耗的高级强化符总共为：');
   writeln(b);
   writeln('消耗的银票总共为(魔钻)：');
   writeln(a*24+b*40);
  end;
  procedure refreshmoney;
  var
   f3,f4:text;a,b:longint;
  begin
   writeln('你的金钱记录已刷新!');
   assign(f3,'c:\money.txt');
   rewrite(f3);
     writeln(f3,'消耗的低级强化符总共为：');
     writeln(f3,0);
     writeln(f3,'消耗的高级强化符总共为：');
     writeln(f3,0);
   close(f3);
  end;
  procedure inclv;
  var
   bool:boolean;
   n,t,m,num:longint;
  //______________________________________________________________________________
    function persent(a:longint):boolean;
    var
     n:longint;
    begin
     if stuff[a]>=4 then exit(false)
     else
     begin
       n:=random(30000)+1;
       if n>27000 then n:=4
         else if n>21000 then n:=3
         else if n>12000 then n:=2
         else if n>0 then n:=1;
       inc(stuff[a],n);
       if stuff[a]>4 then begin dec(n,stuff[a]-4);stuff[a]:=4 end;
       writeln(named[1],'+1!   ',named[a],'+',n,'!');
       exit(true);
     end;
    end;
  //______________________________________________________________________________
    function r2:longint;
    begin
      case random(4000)mod 4+1 of
       1:exit(10);
       2:exit(12);
       3:exit(14);
       4:exit(16);
      end;
    end;
    function r3:longint;
    begin
      case random(30000)mod 3+1 of
       1:exit(85);
       2:exit(100);
       3:exit(120);
      end;
    end;
    function r4:longint;
    begin
      case random(30000)mod 3+1 of
       1:exit(65);
       2:exit(85);
       3:exit(105);
      end;
    end;
    function r5:longint;
    begin
      case random(30000)mod 3+1 of
       1:exit(6);
       2:exit(7);
       3:exit(8);
      end;
    end;
    function r6:longint;
    begin
      case random(30000)mod 3+1 of
       1:exit(2);
       2:exit(3);
       3:exit(4);
      end;
    end;
  //______________________________________________________________________________
  begin
   write('哈哈~~~装备强化成功了！   ');
   inc(stuff[1]);bool:=false;num:=0;
   repeat
   inc(num);
   case random(24000)mod 12+2 of
    2:begin
            n:=r2;t:=2;m:=80;
            inc(stuff[t],n);
            if (t=product[1]) then
            begin
              if stuff[t]>m+product[3] then begin bool:=false;dec(stuff[t],n); end
              else
              begin
                bool:=true;writeln(named[1],'+1!   ',named[t],'+',n,'!');
              end;
            end
            else if (t=product[2]) then
            begin
              if stuff[t]>m+product[4] then begin bool:=false;dec(stuff[t],n); end
              else
              begin
                bool:=true;writeln(named[1],'+1!   ',named[t],'+',n,'!');
              end;
            end
            else
            begin
              if stuff[t]>m then begin bool:=false;dec(stuff[t],n); end
              else
              begin
                bool:=true;writeln(named[1],'+1!   ',named[t],'+',n,'!');
              end;
            end;
      end;
    3:begin
            n:=r3;t:=3;m:=610;
            inc(stuff[t],n);
            if (t=product[1]) then
            begin
              if stuff[t]>m+product[3] then begin bool:=false;dec(stuff[t],n); end
              else
              begin
                bool:=true;writeln(named[1],'+1!   ',named[t],'+',n,'!');
              end;
            end
            else if (t=product[2]) then
            begin
              if stuff[t]>m+product[4] then begin bool:=false;dec(stuff[t],n); end
              else
              begin
                bool:=true;writeln(named[1],'+1!   ',named[t],'+',n,'!');
              end;
            end
            else
            begin
              if stuff[t]>m then begin bool:=false;dec(stuff[t],n); end
              else
              begin
                bool:=true;writeln(named[1],'+1!   ',named[t],'+',n,'!');
              end;
            end;
      end;
    4:begin
            n:=r4;t:=4;m:=350;
            inc(stuff[t],n);
            if (t=product[1]) then
            begin
              if stuff[t]>m+product[3] then begin bool:=false;dec(stuff[t],n); end
              else
              begin
                bool:=true;writeln(named[1],'+1!   ',named[t],'+',n,'!');
              end;
            end
            else if (t=product[2]) then
            begin
              if stuff[t]>m+product[4] then begin bool:=false;dec(stuff[t],n); end
              else
              begin
                bool:=true;writeln(named[1],'+1!   ',named[t],'+',n,'!');
              end;
            end
            else
            begin
              if stuff[t]>m then begin bool:=false;dec(stuff[t],n); end
              else
              begin
                bool:=true;writeln(named[1],'+1!   ',named[t],'+',n,'!');
              end;
            end;
      end;
    5:begin
            n:=r5;t:=5;m:=40;
            inc(stuff[t],n);
            if (t=product[1]) then
            begin
              if stuff[t]>m+product[3] then begin bool:=false;dec(stuff[t],n); end
              else
              begin
                bool:=true;writeln(named[1],'+1!   ',named[t],'+',n,'!');
              end;
            end
            else if (t=product[2]) then
            begin
              if stuff[t]>m+product[4] then begin bool:=false;dec(stuff[t],n); end
              else
              begin
                bool:=true;writeln(named[1],'+1!   ',named[t],'+',n,'!');
              end;
            end
            else
            begin
              if stuff[t]>m then begin bool:=false;dec(stuff[t],n); end
              else
              begin
                bool:=true;writeln(named[1],'+1!   ',named[t],'+',n,'!');
              end;
            end;
      end;
    6:begin
            n:=r6;t:=6;m:=20;
            inc(stuff[t],n);
            if (t=product[1]) then
            begin
              if stuff[t]>m+product[3] then begin bool:=false;dec(stuff[t],n); end
              else
              begin
                bool:=true;writeln(named[1],'+1!   ',named[t],'+',n,'!');
              end;
            end
            else if (t=product[2]) then
            begin
              if stuff[t]>m+product[4] then begin bool:=false;dec(stuff[t],n); end
              else
              begin
                bool:=true;writeln(named[1],'+1!   ',named[t],'+',n,'!');
              end;
            end
            else
            begin
              if stuff[t]>m then begin bool:=false;dec(stuff[t],n); end
              else
              begin
                bool:=true;writeln(named[1],'+1!   ',named[t],'+',n,'!');
              end;
            end;
      end;
    7:begin bool:=persent(7) end;
    8:begin bool:=persent(8) end;
    9:begin bool:=persent(9) end;
    10:begin bool:=persent(10) end;
    11:begin bool:=persent(11) end;
    12:begin bool:=persent(12) end;
    13:begin bool:=persent(13) end;
   end;
   until bool or (num>10000);
   if num>10000 then begin
     writeln;
     writeln('恭喜你! 这件装备的所有属性都达到最大值了!');
     writeln('恭喜你! 这件装备的所有属性都达到最大值了!');
     writeln('恭喜你! 这件装备的所有属性都达到最大值了!');
   end;
  end;
  procedure bange;
  begin
   write('呜呜呜~~~强化失败，所有附加属性清零！   ');
   writeln(named[1],'0级!');
   fillchar(stuff,sizeof(stuff),0);
   stuff[0]:=product[0];
   stuff[product[1]]:=product[3];
   stuff[product[2]]:=product[4];
  end;
  procedure LoadE;
  var
   f1:text;
   i:longint;
  begin
   assign(f1,'c:\'+str1+'.txt');
   reset(f1);
   readln(f1,namep);
   writeln('装备 ',namep,' :');
   for i:=0 to maxp do
   begin
     readln(f1,product[i]);
   end;
   for i:=0 to maxform do
   begin
     readln(f1,stuff[i]);
     if stuff[i]<>0 then
       if (i=product[1])and(stuff[i]-product[3]<>0) then
         writeln(named[i],':',stuff[i],' (',product[3],'+',stuff[i]-product[3],')')
       else if (i=product[2])and(stuff[i]-product[4]<>0) then
         writeln(named[i],':',stuff[i],' (',product[4],'+',stuff[i]-product[4],')')
       else writeln(named[i],':',stuff[i]);
   end;
   close(f1);
  end;
  procedure SaveE;
  var
   f2:text;
   i:longint;
  begin
   assign(f2,'c:\'+str1+'.txt');
   rewrite(f2);
   writeln(f2,namep);
   for i:=0 to maxp do
   begin
     writeln(f2,product[i]);
   end;
   for i:=0 to maxform do
   begin
     writeln(f2,stuff[i]);
     if stuff[i]<>0 then
     if (i=product[1])and(stuff[i]-product[3]<>0) then
       writeln(named[i],':',stuff[i],' (',product[3],'+',stuff[i]-product[3],')')
     else if (i=product[2])and(stuff[i]-product[4]<>0) then
       writeln(named[i],':',stuff[i],' (',product[4],'+',stuff[i]-product[4],')')
     else writeln(named[i],':',stuff[i]);
   end;
   close(f2);
  end;
  procedure DeleteE;
  var
    i,j:longint;
    st:string;
    sta:array[1..maxE]of string;
    f3,f4:text;
  begin
    writeln('你真的想要删除这件装备吗？');
    writeln('请再次输入 "delete" (2)');
    readln(st);if st='delete' then begin
      writeln('你真的想要删除这件装备吗？');
      writeln('请再次输入 "delete" (3)');
      readln(st);if st='delete' then begin
        //***********************delete**********************************
          i:=0;
          assign(f4,'c:\Ememory.txt');
          reset(f4);
            while not eof(f4) do
            begin
              readln(f4,st);
              if st<>str1 then begin
                inc(i);
                sta[i]:=st;
              end;
            end;
          close(f4);
          assign(f3,'c:\Ememory.txt');
          rewrite(f3);
            for j:=1 to i do
            begin
              writeln(f3,sta[j]);
            end;
          close(f3);
        //*********************^|delete|^********************************
        writeln('该装备已经被成功删除了！你再次可以创建相同识别码(name)的新装备！');
        ways:='00';
        readln;
      end;
    end;
  end;
  function str1inEmemory(str1:string):boolean;
  var
    f4:text;
    st:string;
    found:boolean;
  begin
   if str1='' then exit(false);
   assign(f4,'c:\Ememory.txt');
   reset(f4);
   while (not eof(f4))and(st<>str1) do
   begin
     readln(f4,st);
   end;
   close(f4);
   if st=str1 then exit(true) else exit(false);
  end;
  procedure BuildEdata(Type1:longint);{st:= the new equipment's name>> This part is buildE Name}
  var
    i,j:longint;f2,f3,f4:text;
    s,code:longint;
    st:string;
    sta:array[1..maxE]of string;
  const
    Equipmentconst:array[2..6,1..7]of longint=( (0,0,0,0,0,309,351),
                                                (0,0,0,0,0,95,108),
                                                (0,0,0,0,0,190,210),
                                                (0,0,0,0,0,66,78),
                                                (0,0,0,0,0,1990,2112) );
    ERt:array[2..6,1..7]of longint           =( (0,0,0,0,0,88,100),
                                                (0,0,0,0,0,26,30),
                                                (0,0,0,0,0,54,60),
                                                (0,0,0,0,0,13,16),
                                                (0,0,0,0,0,471,500) );
    Equipmentcons1:array[2..6,1..7]of longint=( (0,0,0,0,0,60,75),
                                                (0,0,0,0,0,451,526),
                                                (0,0,0,0,0,315,350),
                                                (0,0,0,0,0,18,24),
                                                (0,0,0,0,0,19,21) );
    ERt1:array[2..6,1..7]of longint          =( (0,0,0,0,0,60,75),
                                                (0,0,0,0,0,451,526),
                                                (0,0,0,0,0,315,350),
                                                (0,0,0,0,0,18,24),
                                                (0,0,0,0,0,19,21) );
  begin
    writeln('    请输入装备的识别码(name):');
    readln(str1);
    while str1inEmemory(str1) or (str1='') do
    begin
     writeln('      这个识别码(name)早已经存在了！');
     writeln('      建立该识别码(name)失败！');
     writeln('      请再次输入新的识别码(name):');
     readln(str1);
    end;
    for i:=0 to 5 do writeln;
    case type1 of
     2:product[1]:=2;
     3:product[1]:=5;
     4:product[1]:=5;
     5:product[1]:=6;
     6:product[1]:=3;
    end;
    product[3]:=Equipmentconst[type1,stuff[0] div 10]-ERt[type1,stuff[0] div 10]+random(ERt[type1,stuff[0] div 10]+1);
    product[2]:=random(5)+2;
    while product[1]=product[2] do
      product[2]:=random(5)+2;
    product[4]:=Equipmentcons1[product[2],stuff[0] div 10]-ERt1[product[2],stuff[0] div 10]+random(ERt1[product[2],stuff[0] div 10]+1);
    product[5]:=0;
    stuff[product[1]]:=product[3];
    stuff[product[2]]:=product[4];
    //********************************************save********************************
    assign(f2,'c:\'+str1+'.txt');
    rewrite(f2);
    writeln(f2,namep);
    for i:=0 to maxp do
    begin
      writeln(f2,product[i]);
    end;
    for i:=0 to maxform do
    begin
      writeln(f2,stuff[i]);
      if stuff[i]<>0 then
      if (i=product[1])and(stuff[i]-product[3]<>0) then
        writeln(named[i],':',stuff[i],' (',product[3],'+',stuff[i]-product[3],')')
      else if (i=product[2])and(stuff[i]-product[4]<>0) then
        writeln(named[i],':',stuff[i],' (',product[4],'+',stuff[i]-product[4],')')
      else writeln(named[i],':',stuff[i]);
    end;
    close(f2);
    //********************************************save********************************
          i:=0;
          assign(f4,'c:\Ememory.txt');
          reset(f4);
            while not eof(f4) do
            begin
              readln(f4,st);
              inc(i);
              sta[i]:=st;
            end;
          close(f4);
          assign(f3,'c:\Ememory.txt');
          rewrite(f3);
            for j:=1 to i do
              writeln(f3,sta[j]);
            writeln(f3,str1);
          close(f3);
    //********************************************^|saveinmemory|^*********************
    writeln;
    writeln('装备 ',namep,' 已经被建立(build)成功！');
    readln;
  end;
  procedure BuildETYPE(lv:longint);
  var
    st:string;
    s,code:longint;
  const
    namepconst:array[2..6,1..7]of string=( ('0','0','0','0','0','凌霜剑','蕴华剑'),
                                           ('0','0','0','0','0','冷日凉衫','神鬼遁衣'),
                                           ('0','0','0','0','0','逸仙梦巾','雪舞殇巾'),
                                           ('0','0','0','0','0','龙鳞靴','御风兔靴'),
                                           ('0','0','0','0','0','神武项链','莹月灵环') );
  begin
    writeln('    请输入装备类型：');
    writeln('    1:手持  2:身穿  3:头戴  4:脚穿  5:佩戴');
    readln(st);
    val(st,s,code);
    while (code<>0)or(s<=0)or(s>5) do
    begin
     readln(st);
     val(st,s,code);
    end;
    stuff[-1]:=s+1;
    namep:=namepconst[s+1,lv];
    BuildEdata(s+1);
  end;
  procedure DIY;
  var
   f7,f3,f4:text;s:string;i,j:longint;
   st,lv:string;
   sta:array[1..maxE]of string;
  begin
      writeln('你选择了手动输入所有的装备属性(模拟与游戏中完全相同的装备)：');
      writeln('请输入  该装备在本程序中的识别码(name)');
      readln(str1);
      while str1inEmemory(str1) or (str1='') do
      begin
        writeln('      这个识别码(name)早已经存在了！');
        writeln('      建立该识别码(name)失败！');
        writeln('      请再次输入新的识别码(name):');
        readln(str1);
      end;
    assign(f7,'c:\'+str1+'.txt');
    rewrite(f7);
      writeln('请输入  装备名称');
      readln(s);
      writeln(f7,s);
      namep:=s;
      writeln('请输入  装备等级:');
      writeln('        10  20  30  40  50  60  70');
      readln(s);
      writeln(f7,s);
      lv:=s;
      writeln('请输入  主属性:');
      writeln('        2:伤害  3:气血  4:精气  5:防御  6:速度');
      readln(s);
      writeln(f7,s);
      writeln('请输入  副属性:');
      writeln('        2:伤害  3:气血  4:精气  5:防御  6:速度');
      readln(s);
      writeln(f7,s);
      writeln('请输入  原主属性值:');
      readln(s);
      writeln(f7,s);
      writeln('请输入  原副属性值:');
      readln(s);
      writeln(f7,s);
      writeln(f7,'0');
      writeln(f7,lv);
      writeln('请输入  强化等级:');
      writeln('        0-50');
      readln(s);
      writeln(f7,s);
      writeln('请输入  总伤害值:');
      readln(s);
      writeln(f7,s);
      writeln('请输入  总气血值:');
      readln(s);
      writeln(f7,s);
      writeln('请输入  总精气值:');
      readln(s);
      writeln(f7,s);
      writeln('请输入  总防御值:');
      readln(s);
      writeln(f7,s);
      writeln('请输入  总速度值:');
      readln(s);
      writeln(f7,s);
      writeln('请输入  吸血:');
      readln(s);
      writeln(f7,s);
      writeln('请输入  暴击:');
      readln(s);
      writeln(f7,s);
      writeln('请输入  闪避:');
      readln(s);
      writeln(f7,s);
      writeln('请输入  加攻:');
      readln(s);
      writeln(f7,s);
      writeln('请输入  加速:');
      readln(s);
      writeln(f7,s);
      writeln('请输入  加防:');
      readln(s);
      writeln(f7,s);
      writeln('请输入  吸魔:');
      readln(s);
      writeln(f7,s);
    close(f7);
    //********************************************save********************************
          i:=0;
          assign(f4,'c:\Ememory.txt');
          reset(f4);
            while not eof(f4) do
            begin
              readln(f4,st);
              inc(i);
              sta[i]:=st;
            end;
          close(f4);
          assign(f3,'c:\Ememory.txt');
          rewrite(f3);
            for j:=1 to i do
              writeln(f3,sta[j]);
            writeln(f3,str1);
          close(f3);
    //********************************************^|saveinmemory|^*********************
    writeln;
    writeln('装备 ',namep,' 已经被建立(build)成功！');
    readln;
  end;
  procedure BuildE;{str1:= the new equipment's name>> This part is buildE LV}
  var
    st:string;
    s,code:longint;
  begin
    fillchar(stuff,sizeof(stuff),0);
    writeln('    请输入装备的等级:');
    writeln('    1:lv10  2:lv20  3:lv30  4:lv40  5:lv50  6:lv60  7:lv70  8:自己制作');
    readln(st);
    val(st,s,code);
    while (code<>0)or(s<=0)or(s>8) do
    begin
     readln(st);
     val(st,s,code);
    end;
    product[0]:=s*10;
    stuff[0]:=product[0];
    if s<8 then BuildETYPE(s) else DIY;
  end;
//________________________________readindatas___________________________________
  procedure readinways;
  var
   str2:string;
  begin
   //*************************gonn**********************************
   if boolgo and (stuff[1]<boolgon) then way:=2 else readln(ways);
   str(maxcom,str2);
   if ways<>str2 then boolgo:=false;
   if copy(ways,1,2)='go' then begin
      val(copy(ways,3,length(ways)-2),boolgon,code);
      if code=0 then boolgo:=true;str(maxcom,ways);
      useway:=true;
   end;
   //***************************************************************
   if ways='simple' then begin writeln('简易强化模式已被成功开启！');boltn:=stuff[1];
                     writeln('只按回车键(Enter)即可使用高级强化符强化装备！');botl:=true;readln(ways); end;
   if ways='nosimple' then begin writeln('简易强化模式已被成功关闭！');botl:=false;readln(ways); end;
   //**********************^|simple|^*******************************
   if ways='delete' then DeleteE;
  end;
  procedure readinstr1;
  begin
   readln(str1);{ This order have to write in c:\Ememory.txt }
   if str1='build' then BuildE;
  end;
//_______________________________^|readindatas|^_______________________________
  procedure inputstr1;
  begin
   readinstr1;
   if str1='99' then halt;
   while (str1='')or(str1='-')or(not(str1inEmemory(str1))) do
   begin
       writeln('在装备库中不存在使用该识别码(name)的装备！');{ or Have not this sentence}
       readinstr1;
       if str1='99' then halt;
   end;
  end;
  procedure writelnhelp;
  begin
    writeln('    请输入你要使用的装备强化功能:             00:返回主菜单   0:查看装备属性');
    writeln('    1:使用强化符  2:使用高级强化符  3:查看使用数量  4(两次输入):清空数量记录');
    writeln('    goX:直接使用高级强化符强化装备到X强化(数量将被记录，X过大程序缓慢)');
    writeln('    simple/nosimple:开启/关闭简易强化模式');
    writeln('    delete(三次输入):删除装备');
  end;
//_____________________....______P_A_R_T____One_^____________________________________
procedure UpEquipment;
var
 i:longint;
begin
 writeln('请输入你要打开的装备的识别码(name) 或 输入"build"创建新装备！');
 inputstr1;
//______________________________________________________________________________
 LoadE;
 repeat
   useway:=false;
   writelnhelp;
   readinways;
   if ways='00' then exit;
   if ways='99' then halt;
   //************************simple*********************************
   if (botl)and(ways='')and(stuff[1]<=boltn+20) then
   begin
     way:=2;
     savemoney;
     if not bang(stuff[1]) then inclv else bange;
     writeln;writeln;
   end
   //***************************************************************
   else
   begin
     val(ways,way,code);
     while (code<>0)or(way>maxcom)or(way<0) do
     begin
       if not useway then writeln('输入格式错误！') else writelnhelp;
       readinways;
       if ways='00' then exit;
       if ways='99' then halt;
       val(ways,way,code);
     end;
     if way=maxcom then way:=2;
     savemoney;
     for i:=1 to 25 do writeln;
     case way of
       0:writeln(namep);
       1:begin if not bang(2*stuff[1]) then inclv else bange; end;
       2:begin if not bang(stuff[1]) then inclv else bange end;
       3:showmoney;
       4:begin
            writeln('请再次输入 "4" ！');readln(ways);
            if ways='4' then refreshmoney else writeln('清空数量记录失败！');
         end;
     end;
     if way<>0 then for i:=1 to 2 do writeln;
   end;
//______________________________________________________________________________
   SaveE;
 until not true;
end;
//___________________________P_A_R_T_Two_____________________________________________
  //_______________________________Save____________load_____________________________
  procedure loadHU;
  var
    i:longint;f1:text;
  begin
        assign(f1,'c:\human.txt');
        reset(f1);
        readln(f1,humana[0]);
        for i:=2 to 6 do
          readln(f1,humana[i]);
        close(f1);
  end;
  procedure loadSk;
  var
    i:longint;f1:text;
  begin
        assign(f1,'c:\skill.txt');
        reset(f1);
        for i:=2 to 6 do
          readln(f1,Skilla[i]);
        close(f1);
  end;
  procedure loadEw;
  var
    i,j:longint;f1,f2:text;
  begin
        assign(f1,'c:\equipW.txt');
        reset(f1);
        for i:=1 to 5 do
          readln(f1,equipW[i]);
        close(f1);
    { Equipa   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$}
        fillchar(equipa,sizeof(equipa),0);
        for j:=1 to 5 do
        if equipw[j]<>'NoEquipment' then
        begin
          assign(f2,'c:\'+equipW[j]+'.txt');
          reset(f2);
          readln(f2,namep);
          for i:=0 to maxp do
            readln(f2,product[i]);
          for i:=0 to maxform do
          begin
            readln(f2,stuff[i]);
            equipa[i]:=equipa[i]+stuff[i];
          end;
          close(f2);
        end;
    { Equipa^^^$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$}
  end;
  procedure loadp2A;
  begin
    loadHu;
    loadSk;
    loadEw;
  end;
  procedure SaveHU;
  var
    i:longint;f1:text;
  begin
        assign(f1,'c:\human.txt');
        rewrite(f1);
        writeln(f1,humana[0]);
        for i:=2 to 6 do
          writeln(f1,humana[i]);
        close(f1);
  end;
  procedure SaveSk;
  var
    i:longint;f1:text;
  begin
        assign(f1,'c:\skill.txt');
        rewrite(f1);
        for i:=2 to 6 do
          writeln(f1,Skilla[i]);
        close(f1);
  end;
  procedure SaveEw;
  var
    i:longint;f1:text;
  begin
        assign(f1,'c:\equipW.txt');
        rewrite(f1);
        for i:=1 to 5 do
          writeln(f1,equipW[i]);
        close(f1);
  end;
  //______________________^|________Save___________load________|^___________________
  procedure ShowCBasic;
  var
   i,t,code:longint;
   s:string;
   tmp:array[0..maxform] of longint;
  const
    poinths:array[0..maxform]of longint=(1,0,7,25,15,4,1,0,0,0,0,0,0,0);
    pointEq:array[0..maxform]of longint=(0,0,1,1 ,1 ,1,1,1,1,1,1,1,1,1);
  begin
    for i:=0 to maxform do
      if (i<>1) then
        tmp[i]:=poinths[i]*(humana[0]*pointEq[i]+humana[i]+skilla[i])+pointEq[i]*equipa[i];
    tmp[2]:=tmp[10];tmp[5]:=tmp[12];tmp[6]:=tmp[11];
    for i:=0 to maxform do
      if (i<>2)and(i<>5)and(i<>6) then tmp[i]:=0;
    for i:=0 to 6 do writeln;
    for i:=0 to maxform do
    begin
      if (i<>1) then
        write('      ',named[i],':',
         trunc( (poinths[i]*(humana[0]*pointEq[i]+humana[i]+skilla[i])+pointEq[i]*equipa[i])*(1+tmp[i]/100) ):5  );
      if tmp[i]<>0 then
        writeln('    (',poinths[i]*(humana[0]*pointEq[i]+humana[i]+skilla[i])+pointEq[i]*equipa[i],')')
      else if i>=7 then writeln('%')
      else writeln;
      if (i=6) then writeln;
    end;
    writeln('      你的潜能点数为：');
    t:=humana[2];humana[2]:=humana[3];humana[3]:=humana[4];humana[4]:=t;
    for i:=2 to 6 do
    begin
      writeln('        ',nameH[i],':',humana[i]);
    end;
    t:=humana[4];humana[4]:=humana[3];humana[3]:=humana[2];humana[2]:=t;
    writeln;
    writeln('      如果你想修改你的潜能点数,请输入 "change" ！');
    readln(s);
    if s='change' then
    begin
      writeln('      请输入你的人物等级：');
      readln(s);
      val(s,t,code);
      while (code<>0)or(t<=0)or(t>100) do
      begin
        writeln('      输入格式错误！');
        readln(s);
        val(s,t,code);
      end;
      humana[0]:=t;
      savehu;
      writeln('      你的等级为：',humana[0],'。你拥有 ',3*(humana[0]-1),' 个潜能点未分配！');
      for i:=2 to 6 do
      begin
        writeln('      请输入你的 ',nameH[i],' 点数:');
        readln(humana[i]);
      end;
      while 3*(humana[0]-1)<>(humana[2]+humana[3]+humana[4]+humana[5]+humana[6]) do
      begin
        writeln('你的点数之和必须等于当前等级拥有的：',3*(humana[0]-1),' 点！');
        for i:=2 to 6 do
        begin
          writeln('      请输入你的 ',nameH[i],' 点数:');
          readln(humana[i]);
        end;
      end;
      t:=humana[4];humana[4]:=humana[3];humana[3]:=humana[2];humana[2]:=t;
      Savehu;
      writeln('      你的等级和潜能点数已被重置成功！');readln;
    end;
  end;
  procedure ShowCSkill;{skilla[2,3,4,5,6]}
  var
   i,t,code:longint;
   s:string;
    function skilllv(a:longint):longint;
    var
     i,s:longint;
    begin
      s:=a;
      for i:=0 to 11 do
      begin
        s:=s-i;
        if s=0 then break;
      end;
      if i=11 then begin
        writeln('function skilllV ERROR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');readln;
        halt;
      end;
      exit(i);
    end;
    function skillData(a:longint):longint;
    var
     i,s:longint;
    begin
      s:=0;
      for i:=0 to a do
        s:=s+i;
      exit(s);
    end;
  begin
    for i:=2 to 6 do
      writeln('      ',named[i],':',skilllv(skilla[i]));
    writeln('      如果你想修改你的心法点数,请输入 "change" ！');
    readln(s);
    if s='change' then
    begin
      for i:=2 to 6 do
      begin
        writeln('      ','请输入 ',named[i],' 等级 (0-10) 或者 不作改动 (-) ：');
        readln(s);
        if s<>'-' then
        begin
          while (s<>'10') and not( ((s>='0')and(s<='9')and(length(s)=1)) or (s='-') ) do
          begin
            writeln('输入格式错误！');
            readln(s);
          end;
          if s<>'-' then
          begin
            val(s,t,code);
            skilla[i]:=skillData(t);
          end;
        end;
      end;
      SaveSk;
      writeln('      你的心法点数已被重置成功！');readln;
    end;
  end;
  procedure ShowE;
  var
   i:longint;
    function getnameE(str1:string):string;
    var
     f1:text;
     i:longint;
    begin
      if str1='NoEquipment' then exit('无物品')
      else begin
        assign(f1,'c:\'+str1+'.txt');
        reset(f1);
        readln(f1,namep);
        close(f1);
        exit(namep);
      end;
    end;
  begin
    for i:=1 to 5 do
      writeln('      ',nameE[i],':  ',equipW[i],'(',getnameE(equipW[i]),')');
  end;
  procedure LoadEC(str1:string;a:longint);
  var
   f1:text;
   i:longint;
  begin
   assign(f1,'c:\'+str1+'.txt');
   reset(f1);
   readln(f1,namep);
   writeln('      ',nameE[a],' 装备 ',namep,' ：');
   for i:=0 to maxp do
   begin
     readln(f1,product[i]);
   end;
   for i:=0 to maxform do
   begin
     readln(f1,stuff[i]);
     if stuff[i]<>0 then
       if (i=product[1])and(stuff[i]-product[3]<>0) then
         writeln('          ',named[i],':',stuff[i],' (',product[3],'+',stuff[i]-product[3],')')
       else if (i=product[2])and(stuff[i]-product[4]<>0) then
         writeln('          ',named[i],':',stuff[i],' (',product[4],'+',stuff[i]-product[4],')')
       else writeln('          ',named[i],':',stuff[i]);
   end;
   close(f1);
  end;
  procedure ChooseE;
  var
   i:longint;
   s:string;
  begin
    for i:=1 to 5 do
    begin
      writeln('      ','请输入你的 ',nameE[i],' 装备的识别码(name)');
      writeln('      ','或者 不作改动请输入 "-" 或者 卸下装备请输入 "No" ：');
      readln(s);
      while ((s<>'No')and(s<>'-'))and((s='')or(not(str1inEmemory(s)))) do
      begin
        if not(str1inEmemory(s)) then writeln('      ','装备库中不存在使用该识别码的装备！');
//        if not(RightWear(s)) then writeln('      ','装备没有装配在正确的位置！');
        readln(s);
      end;
      if s='No' then equipW[i]:='NoEquipment'
      else if s<>'-' then equipW[i]:=s;
      if s<>'No' then loadEC(equipW[i],i);
    end;
    SaveEw;
    writeln('      你成功装配了新的装备！');readln;
  end;
procedure Human;
var
  str4:string;
  str4n,code:longint;
begin
  repeat
    loadp2A;
    writeln('    请输入你要使用的人物属性功能:      00:返回主菜单');
    writeln('    1:查看&修改 人物基本数据  2:查看&修改 人物心法');
    writeln('    3:查看已装配的装备  4:装配新装备&卸下装备');
    readln(str4);
    if str4='00' then exit;
    if str4='99' then halt;
    while not(  (str4>='1')and(str4<='4')  ) do
    begin
      writeln('输入格式错误！');
      readln(str4);
      if str4='00' then exit;
      if str4='99' then halt;
    end;
    val(str4,str4n,code);
    case str4n of
     1:ShowCBasic;
     2:ShowCSkill;
     3:ShowE;
     4:ChooseE;
    end;
  until not true;
end;
//___________________________P_A_R_T_Three___________________________________________
function Rinstall:boolean;
var
  st:string;i:longint;
begin
  for i:=1 to 50 do writeln;
  writeln('    如果你确实为第一次使用该程序，请再次输入 "0" ！');
  writeln('    如果你确实为第一次使用该程序，请再次输入 "0" ！');
  writeln;
  writeln;
  writeln('    第一次使用该程序，请在标题栏单击右键，选择默认值(D)-选项-默认代码页，由OEM-美国改为简体中文即可修正乱码正常显示中文！');
  writeln;
  writeln;
  writeln;
  writeln('    First use this program please in head-line press mouse-right-key,choose "Mo Ren Zhi",Change OEM-American to Simple Chinese!!!!! And  EXIT This Program  And  Open Again !!!!');
  writeln;
  writeln;
  writeln;
  writeln('        你同样可以在字体中选择合适大小的字体！');
  writeln;
  writeln;
  writeln('    The First User Please input "0" again!');
  writeln('    The First User Please input "0" again!');
  readln(st);
  if st='0' then exit(true) else exit(false);
end;
procedure Install;
var
  f5,f6,f7,f8,f9,f10:text;
begin
  assign(f5,'c:\money.txt');
  rewrite(f5);
    writeln(f5,'消耗的低级强化符总共为：');
    writeln(f5,0);
    writeln(f5,'消耗的高级强化符总共为：');
    writeln(f5,0);
  close(f5);
  assign(f6,'c:\Ememory.txt');
  rewrite(f6);
    writeln(f6,'build');
    writeln(f6,'Ememory');
    writeln(f6,'money');
    writeln(f6,'Skill');
    writeln(f6,'human');
    writeln(f6,'equipW');
    writeln(f6,'-');
    writeln(f6,'ytpf');
  close(f6);
  assign(f7,'c:\ytpf.txt');
  rewrite(f7);
    writeln(f7,'倚天披风');
    writeln(f7,'70');
    writeln(f7,'5');
    writeln(f7,'3');
    writeln(f7,'217');
    writeln(f7,'530');
    writeln(f7,'0');
    writeln(f7,'70');
    writeln(f7,'0');
    writeln(f7,'0');
    writeln(f7,'530');
    writeln(f7,'0');
    writeln(f7,'217');
    writeln(f7,'0');
    writeln(f7,'0');
    writeln(f7,'0');
    writeln(f7,'0');
    writeln(f7,'0');
    writeln(f7,'0');
    writeln(f7,'0');
    writeln(f7,'0');
  close(f7);
  assign(f8,'c:\human.txt');
  rewrite(f8);
    writeln(f8,'1');
    writeln(f8,'3');
    writeln(f8,'0');
    writeln(f8,'0');
    writeln(f8,'0');
    writeln(f8,'0');
  close(f8);
  assign(f9,'c:\Skill.txt');
  rewrite(f9);
    writeln(f9,'0');
    writeln(f9,'0');
    writeln(f9,'0');
    writeln(f9,'0');
    writeln(f9,'0');
  close(f9);
  assign(f10,'c:\equipW.txt');
  rewrite(f10);
    writeln(f10,'NoEquipment');
    writeln(f10,'NoEquipment');
    writeln(f10,'NoEquipment');
    writeln(f10,'NoEquipment');
    writeln(f10,'NoEquipment');
  close(f10);
  writeln;
  writeln;
  writeln;
  writeln;
  writeln;
  writeln('    系统赠送你一件新装备 倚天披风 ！它的识别码(name)为 "ytpf" ！');
  writeln('    系统赠送你一件新装备 倚天披风 ！它的识别码(name)为 "ytpf" ！');
  writeln('    系统赠送你一件新装备 倚天披风 ！它的识别码(name)为 "ytpf" ！');
  writeln('    安装成功！现在你可以正常使用本程序的所有功能了！');
  writeln('    安装成功！现在你可以正常使用本程序的所有功能了！');
  writeln('    安装成功！现在你可以正常使用本程序的所有功能了！');
  readln;
  readln;
end;
begin{**********************program*******main*********************************}
 randomize;
 repeat
  botl:=false;
  boolgo:=false;
  for i:=1 to 30 do writeln;
  writeln('          (@_                   ~ 精 ~ 武 ~ 堂 ~');
  writeln('     _     ) \___________________________________________________________');
  writeln('    (_)@8@8{}<___________________________________________________________》');
  writeln('           )_/');
  writeln('          (@                    ~jing~ wu ~tang~');
  writeln;
  writeln('  欢迎使用由&&人生不相见&&编写的《《精武堂装备强化完美模拟程序》》');
  writeln;
  writeln('  如果你有任何问题 ，请联系本程序作者！ QQ:381998720(人生不相见)!');
  writeln('  如果你有任何反馈 ，请联系本程序作者！ QQ:381998720(人生不相见)!');
  writeln('  如果你发现任何Bug，请联系本程序作者！ QQ:381998720(人生不相见)!');
  writeln;
  writeln;
  writeln('  请选择你要使用的程序模块：');
  writeln;
  writeln('  0:  $$$$ For First User $$$$                 0:  $$$$ For First User $$$$');
  writeln('  0:                               HELLO!!     0:');
  writeln('  0:  #### 完全安装该程序 ####     HELLO!!     0:  #### 完全安装该程序 ####');
  writeln('  0:  #### 完全安装该程序 ####     HELLO!!     0:  #### 完全安装该程序 ####');
  writeln('  0:                               HELLO!!     0:');
  writeln('  0:  $$$$ For First User $$$$                 0:  $$$$ For First User $$$$');
  writeln;
  writeln('  0:第一次使用该程序请输入 "0" 完成程序初始化，即可正常使用该程序的所有功能');
  writeln('  1:创建&强化 装备  2:查看人物属性  3:未完成待续  99:退出程序');
  readln(str3);
  if str3='99' then halt;
  while not(  (str3>='0')and(str3<='2')  ) do
  begin
    writeln('输入格式错误！');
    readln(str3);
    if str3='99' then halt;
  end;
  val(str3,str3n,code);
  case str3n of
   0:if Rinstall then Install else begin writeln('    程序安装失败！');readln; end;
   1:UpEquipment;
   2:human;
  end;
 until not true;
end.
