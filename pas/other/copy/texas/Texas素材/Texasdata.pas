program Texas;
const
 named:array[0..9]of string=('高牌','单对','两对','三条','顺子','同花','葫芦','四条','同花顺','皇家同花顺');
type
 boolarr=array[1..52]of boolean;
 parr=array[0..9,1..13]of longint;
var
 bool,boolhe:boolarr;
 f1,f2,f3:text;
 s,s1:string;
 boolnum:array[1..52]of integer;
 p,ph,winp:array[0..9]of real;
 pt,pth:array[0..9]of longint;
 pdetail,hepdetail,winpt:parr;
 win:real;
 imost,j,k,l,m,maxm,players,card1,card2:integer;
 total,totalh:longint;
 goto00,DbTforH:boolean;
//********************************************main************************************************************
    procedure printcard(i:integer);
    begin
      write('':5);
      case (i-1) div 13 of
        0:write('');
        1:write('');
        2:write('');
        3:write('');
      end;
      case i mod 13 of
        0:write('K');
        1:write('A');
        12:write('Q');
        11:write('J');
        else write(i mod 13);
      end;
    end;
    procedure printcardend(i:integer);
    begin
      case i mod 13 of
        0:writeln('K');
        1:writeln('A');
        12:writeln('Q');
        11:writeln('J');
        else writeln(i mod 13);
      end;
    end;
  procedure test;
  var
   i,j,k:integer;
  begin
    for j:=1 to 6 do writeln;
    writeln('看看你的牌是啥：');
    writeln;
    j:=0;
    for k:=1 to 7 do
    begin
      for i:=1 to 52 do
        if (bool[i]) and (boolnum[i]=k) then begin
          inc(j);
          if j=3 then begin writeln;writeln; end;
          printcard(i);
        end;
    end;
    writeln;
    writeln;
    writeln('就是这些！');
{
    writeln('看看他的牌是啥：');
    writeln;
    j:=0;
    for k:=1 to 7 do
    begin
      for i:=1 to 52 do
        if (boolhe[i]) and (boolnum[i]=k) then begin
          inc(j);
          printcard(i);
        end;
    end;
    writeln;
    writeln;
    writeln('就是这些！');
}
  end;
//********************************************main************************************************************
  procedure inputcard(num:integer);
  var
   i:integer;
    function used:boolean;
    const
     n:set of char=['z','x','c','v'];
    var
     i,j,k,l,mt,card,code:integer;
     t:string;
     boolt:boolarr;
     booltnum:array[1..52]of integer;
    begin
      mt:=m;
      fillchar(boolt,sizeof(boolt),0);
      fillchar(booltnum,sizeof(booltnum),0);
      j:=0;k:=1;
      for i:=1 to length(s) do begin
        if s[i] in n then begin
          inc(j);
          if i=k then exit(false);
          t:=copy(s,k,i-k);
          if t='t' then t:='10';
          if t='j' then t:='11';
          if t='q' then t:='12';
          if t='k' then t:='13';
          if t='a' then t:='1';
          val(t,card,code);
          if (code<>0)or(card<1)or(card>13) then exit(false);
          k:=i+1;
          case s[i] of
            'z':l:=0;
            'x':l:=1;
            'c':l:=2;
            'v':l:=3;
          end;
          inc(mt);
          if (bool[card+l*13])or(boolt[card+l*13]) then exit(false);
          boolt[card+l*13]:=true;
          booltnum[card+l*13]:=mt;
          if (num=2)and(mt=1) then begin card1:=card+l*13 end;
          if (num=2)and(mt=2) then begin card2:=card+l*13 end;
        end;
        if (j=num)and(i<>length(s)) then exit(false);
      end;
      if j<>num then exit(false);
      //TTTTTTTTTTTTRRRRRRRRRRRUUUUUUUUUUUEEEEEEEEEEEE
      for i:=1 to 52 do
        if boolt[i] then begin
          bool[i]:=true;
          boolnum[i]:=booltnum[i];
          if boolnum[i]>2 then boolhe[i]:=true;
        end;
      m:=mt;
      exit(true);
      //TTTTTTTTTTTTRRRRRRRRRRRUUUUUUUUUUUEEEEEEEEEEEE
    end;
    procedure checks;
    var
      code,playerst:integer;
    begin
      if s='dt' then begin
        DbTforH:=true;
        writeln('开启长时间模式！程序将使用近似四十二倍时间极致提高概率计算的精确性！');
      end;
      if s='nodt' then begin
        DbTforH:=false;
        writeln('关闭长时间模式！');
      end;
      if copy(s,1,7)='players' then begin
        val(copy(s,8,length(s)-7),playerst,code);
        if code<>0 then writeln('格式错误！玩家数目设定失败！')
        else begin
          players:=playerst-1;
          writeln('玩家数目设定为',playerst);
        end;
      end;
    end;
  begin
    if s='0' then begin goto00:=true;exit; end;
    checks;
    while not(used) do begin
      writeln('输入格式错误！正确格式为：10z6caxqx');
      writeln('请输入您的牌面    ： 红桃【z】  方片【x】  黑桃【c】  梅花【v】 ');
      readln(s);if s='0' then begin goto00:=true;exit; end;
      checks;
    end;
    test;
  end;
//********************************************main************************************************************
    function combination(bool:boolarr;var m:integer):integer;
    var
     cardnum:array[0..12]of integer;
     i,j,k,max6,max5,max2:integer;
     bool6_3:boolean;
    begin
      //----------------------------------------------9---
      for j:=1 to 4 do begin
        for i:=0 to 7  do begin
          if not bool[j*13-i] then break;
        end;
        if (i>3)and(bool[j*13-12]) then begin m:=1;exit(9);end;
      end;
      //----------------------------------------------8---
      for j:=1 to 4 do begin
        k:=0;
        for i:=0 to 12 do begin
          if bool[j*13-i] then inc(k) else k:=0;
          if k>4 then begin m:=13-i+4;exit(8);end;
          if (i=3)and(k=4)and(bool[j*13-12]) then begin m:=1;exit(8);end;
        end;
      end;
      //----------------------------------------------7---
      fillchar(cardnum,sizeof(cardnum),0);max6:=-1;bool6_3:=false;
      for i:=1 to 52 do begin
        if bool[i] then inc(cardnum[i mod 13]);
        if cardnum[i mod 13]=4 then begin if i mod 13=0 then m:=13 else m:=i mod 13;exit(7);end;
        if cardnum[i mod 13]=3 then begin
          bool6_3:=true;
          if (i mod 13<>0)and(i mod 13<>1)and(i mod 13>max6) then max6:=i mod 13
          else if i mod 13=0 then max6:=13
          else if i mod 13=1 then max6:=1;
        end;
      end;
      //----------------------------------------------6---
      for i:=0 to 12 do
        if bool6_3 and (cardnum[i]=2) then begin m:=max6;exit(6); end;
      //----------------------------------------------5---
      for j:=1 to 4 do begin
        k:=0;max5:=-1;
        for i:=12 downto 0 do begin
          if bool[j*13-i] then begin
            inc(k);
            if max5<>1 then begin
              if max5<13-i then
                max5:=13-i
              else if 13-i=1 then max5:=1;
            end;
          end;
        end;
        if k>4 then begin m:=max5;exit(5);end;
      end;
      //----------------------------------------------4---
      k:=0;
      for i:=12 downto 1 do begin
        if cardnum[i]<>0 then inc(k) else k:=0;
        if k>4 then begin m:=i+4;exit(4); end;
        if (i=10) and (k=3) and (cardnum[0]<>0) and (cardnum[1]<>0) then begin m:=1;exit(4); end;
        if (i=9) and (k=4) and (cardnum[0]<>0) then begin m:=13;exit(4); end;
      end;
      //----------------------------------------------3---
      if bool6_3 then begin m:=max6;exit(3); end;
      //----------------------------------------------2---
      j:=0;max2:=-1;
      for i:=12 downto 0 do begin
        if (cardnum[i]=2) then begin inc(j);if i>max2 then max2:=i end;
        if j>1 then begin
          if cardnum[1]=2 then m:=1
          else if cardnum[0]=2 then m:=13
          else m:=max2;
          exit(2);
        end;
      end;
      //----------------------------------------------1---
      for j:=0 to 12 do
      if cardnum[j]=2 then
      begin
        if cardnum[1]=2 then m:=1
        else if cardnum[0]=2 then m:=13
        else
          for i:=12 downto 2 do
            if cardnum[2]=2 then
              begin m:=i;break; end;
        exit(1);
      end;
      //----------------------------------------------0---
      if cardnum[1]<>0 then m:=1
      else if cardnum[0]<>0 then m:=13
      else
        for i:=12 downto 2 do
          if cardnum[i]<>0 then
            begin m:=i;break; end;
      exit(0);
      //--------------------------------------------------
    end;
    procedure permutation(bool:boolarr;var pdetail:parr);//combinationall
    var
     i,j,k,t,num:integer;
     boolt:boolarr;
      procedure per(a:integer);
      var
       i,j,k:integer;
      begin
        if a=0 then begin
{          for i:=1 to 52 do//check boolt[1..52] c:\test.txt
            write(f1,boolt[i]:8,i:2);
          writeln(f1);
          writeln(f1,'$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');}
          inc(pdetail[combination(boolt,maxm),maxm]);
        end
        else begin
          for i:=t to 52 do begin
            if (not boolt[i])and(i<>card1)and(i<>card2) then begin
              boolt[i]:=true;
              t:=i+1;
              per(a-1);
              boolt[i]:=false;
            end;
          end;
        end;
      end;
    begin
      num:=0;t:=1;
      fillchar(boolt,sizeof(boolt),0);
      for i:=1 to 52 do
        if bool[i] then begin inc(num);boolt[i]:=bool[i]; end;
      num:=7-num;
      per(num);
{
   writeln(f1);
   writeln(f1);
   writeln(f1,'***************************************************************');
   writeln(f1,'( ');
   for j:=0 to 9 do
   begin
   write(f1,'             (');
     for i:=1 to 13 do
       if i<>13 then write(f1,hepdetail[j,i],',')
       else
         if j<>9 then write(f1,hepdetail[j,i],'),')
         else
           write(f1,hepdetail[j,i],')');
     writeln(f1);
   end;
   writeln(f1,'                  );');
   writeln(f1,'***************************************************************');
}
    end;
    procedure perh;
    const
     cdetail:parr=(
             (12944820,0,0,0,0,0,0,0,31080,248640,963480,2719500,6386940),
             (11555025,0,284315,522745,1200985,1816913,2542888,3247862,3946521,4630172,5354807,11309336,12216231),
             (5042736,0,369684,745740,1128168,1526040,1934820,2352240,2778300,3213000,3656340,4110588,4575744),
             (498916,499620,499312,499004,498696,499400,500104,500808,501512,502216,503932,505648,507364),
             (747980,0,0,0,603560,603560,603560,603560,603560,603560,603560,603560,603560),
             (1584704,0,0,0,0,0,11856,41964,103280,212224,389000,657772,1046844),
             (262944,262944,262944,262944,262944,262944,262944,262944,262944,262944,262944,262944,262944),
             (17296,17296,17296,17296,17296,17296,17296,17296,17296,17296,17296,17296,17296),
             (0,0,0,0,4140,4140,4140,4140,4140,4140,4140,4140,4140),
             (4324,0,0,0,0,0,0,0,0,0,0,0,0)
                  );
    var
     i,j:integer;
    begin
      for i:=0 to 9 do
        for j:=1 to 13 do
          hepdetail[i,j]:=cdetail[i,j];
    end;
    procedure getpandwinp;
    var
     i,j:integer;
      function playerswin(players:integer):real;
      var
       k:integer;
       pt:real;
      begin
        pt:=1;
        for k:=1 to players do
          pt:=pt*(winpt[i,j]/totalh);
        exit(pt);
      end;
    begin
      //-------------------pandph---------------------
      for i:=0 to 9 do
        for j:=1 to 13 do begin
          pt[i]:=pdetail[i,j]+pt[i];
          total:=total+pdetail[i,j];
          pth[i]:=hepdetail[i,j]+pth[i];
          totalh:=totalh+hepdetail[i,j];
        end;
      for i:=0 to 9 do begin
        p[i]:=pt[i]/total;
        ph[i]:=pth[i]/totalh;
      end;
      //---------------------winp---------------------
      for i:=0 to 9 do begin
        if i<>0 then winpt[i,2]:=winpt[i-1,1];
        for j:=2 to 13 do
          winpt[i,j]:=winpt[i,j-1]+hepdetail[i,j]+winpt[i,j];
        winpt[i,1]:=winpt[i,13]+hepdetail[i,1];
      end;
     {//this line must be 1.00
      writeln('---------------------------------------------------------------------------');
      writeln(winpt[9,1]/totalh);
      writeln('---------------------------------------------------------------------------');}
      for i:=0 to 9 do
        for j:=1 to 13 do
          if pt[i]<>0 then winp[i]:=(pdetail[i,j]/pt[i])*playerswin(players)+winp[i];
    end;
  procedure settle(time:integer);
  var
   i,j,k,l:integer;
  begin
    fillchar(p,sizeof(p),0);
    fillchar(pt,sizeof(pt),0);
    fillchar(ph,sizeof(ph),0);
    fillchar(pth,sizeof(pth),0);
    fillchar(winp,sizeof(winp),0);
    fillchar(winpt,sizeof(winpt),0);
    fillchar(pdetail,sizeof(pdetail),0);
    fillchar(hepdetail,sizeof(hepdetail),0);
    total:=0;totalh:=0;
    permutation(bool,pdetail);
    if (DbTforH)or(time>1) then permutation(boolhe,hepdetail) else perh;
    getpandwinp;
  end;
//********************************************main************************************************************
  procedure print;
  var
   i:integer;
  begin
    writeln('---------------------------------------------------------------------------');
    writeln('你当前的胜率详单如下：','成牌型':14,'成牌率':10,'胜利率':10,'成牌率E':10);
    for i:=0 to 9 do
      writeln('':5,named[i]:31,p[i]*100:9:2,'%',winp[i]*100:9:2,'%',ph[i]*100:9:2,'%');
    win:=0;
    for i:=0 to 9 do
      win:=win+winp[i]*p[i];
    writeln;
    writeln('你当前的胜率为：',win*100:25:2,'%','平均胜率为：':18,1/(players+1)*100:5:2,'%');
    writeln('---------------------------------------------------------------------------');
  end;
  procedure printend;
  var
   i,j:integer;
  begin
    for i:=1 to 18 do writeln;
    writeln('---------------------------------------------------------------------------');
    writeln;
    for j:=1 to 7 do
    begin
      for i:=1 to 52 do
        if (bool[i]) and (boolnum[i]=j) then printcard(i);
    end;
    writeln;
    writeln;
    write('你最终的成牌型为：',named[combination(bool,maxm)]:27);
    printcardend(maxm);
    writeln;
    writeln('你的对手的胜率详单如下：','成牌率E':42);
    for i:=0 to 9 do
      writeln(named[i]:36,ph[i]*100:29:2,'%');
    win:=0;
    for i:=0 to 9 do
      win:=win+winp[i]*p[i];
    writeln;
    writeln('你当前的胜率如下：',win*100:23:2,'%');
    writeln;
    writeln('---------------------------------------------------------------------------');
    if goto00 then for i:=1 to 24 do writeln else writeln;
  end;
//********************************************main************************************************************
begin
//  assign(f1,'c:\test1.txt');
//  rewrite(f1);
//  assign(f2,'c:\test2.txt');
//  rewrite(f2);
  assign(f3,'c:\test3.txt');
  rewrite(f3);
for players:=7 downto 1 do begin

for imost:=1 to 13 do begin

//      writeln(f1,'(   //',imost,'-------------------------------------------------------------------------');
//      writeln(f2,'(   //',imost,'-------------------------------------------------------------------------');
      writeln(f3,'(   //',imost,'-------------------------------------------------------------------------');
      for j:=1 to 13 do begin
//        write(f1,'(  ');
//        write(f2,'(  ');
        write(f3,'(  ');
        for k:=1 to 2 do begin
//          if k=1 then write(f1,'( ') else write(f1,'   ( ');
//          if k=1 then write(f2,'( ') else write(f2,'   ( ');
          if k=1 then write(f3,'( ') else write(f3,'   ( ');

  str(j,s);str(imost,s1);
  if k=1 then s:=s1+'z'+s+'z' else s:=s1+'z'+s+'x';
  if (s<>s1+'z'+s1+'z')and(j>=imost) then
begin
  fillchar(bool,sizeof(bool),0);
  fillchar(boolhe,sizeof(boolhe),0);
  fillchar(boolnum,sizeof(boolnum),0);
  m:=0;goto00:=false;DbTforH:=false;
  writeln('****************************************************************************');
  if not goto00 then writeln('请输入您的两张手牌： 红桃【z】  方片【x】  黑桃【c】  梅花【v】 ');
  if not goto00 then inputcard(2);
  if not goto00 then settle(1);
  if not goto00 then print;
end else begin
  fillchar(p,sizeof(p),0);
  fillchar(ph,sizeof(ph),0);
  fillchar(winp,sizeof(winp),0);
end;
          for l:=0 to 9 do begin
    {           if l<>9 then write(f1,'P,') else write(f1,'P');            }
//            if l<>9 then write(f1,p[l],',') else write(f1,p[l]);
//            if l<>9 then write(f2,ph[l],',') else write(f2,ph[l]);
            if l<>9 then write(f3,winp[l],',') else write(f3,winp[l]);
          end;
          if k<>2 then begin
// writeln(f1,' ),');
//writeln(f2,' ),');
 writeln(f3,' ),'); end
          else begin
// write(f1,' )');
//write(f2,' )');
 write(f3,' )'); end;
        end;
        if j<>13 then begin
// writeln(f1,'  ),');
//writeln(f2,'  ),');
 writeln(f3,'  ),'); end
        else begin
// writeln(f1,'  )');
//writeln(f2,'  )');
 writeln(f3,'  )'); end;
      end;
//      writeln(f1,' ),');
//      writeln(f2,' ),');
      writeln(f3,' ),');
end;
  writeln;
  writeln;
  writeln('以上为players',players,'时的winphash数据！');
  writeln;
  writeln;
end;
//  close(f1);
//  close(f2);
  close(f3);
end.
