program p1064;
const
 c:array[0..9,1..5,1..3]of char   =(((' ','-',' '),('|',' ','|'),(' ',' ',' '),('|',' ','|'),(' ','-',' '))
                                   ,((' ',' ',' '),(' ',' ','|'),(' ',' ',' '),(' ',' ','|'),(' ',' ',' '))
                                   ,((' ','-',' '),(' ',' ','|'),(' ','-',' '),('|',' ',' '),(' ','-',' '))
                                   ,((' ','-',' '),(' ',' ','|'),(' ','-',' '),(' ',' ','|'),(' ','-',' '))
                                   ,((' ',' ',' '),('|',' ','|'),(' ','-',' '),(' ',' ','|'),(' ',' ',' '))
                                   ,((' ','-',' '),('|',' ',' '),(' ','-',' '),(' ',' ','|'),(' ','-',' '))
                                   ,((' ','-',' '),('|',' ',' '),(' ','-',' '),('|',' ','|'),(' ','-',' '))
                                   ,((' ','-',' '),(' ',' ','|'),(' ',' ',' '),(' ',' ','|'),(' ',' ',' '))
                                   ,((' ','-',' '),('|',' ','|'),(' ','-',' '),('|',' ','|'),(' ','-',' '))
                                   ,((' ','-',' '),('|',' ','|'),(' ','-',' '),(' ',' ','|'),(' ','-',' ')));
var
 st:string;
 big,i,j,n:integer;
 a:array[1..255]of byte;
procedure chuli(n,h:integer);
var
 i,j:integer;
begin
 write(c[n,h,1]);
 for i:=1 to big do
  write(c[n,h,2]);
 write(c[n,h,3]);
end;
begin
 readln(big);
 readln(st);
 n:=length(st);
 for i:=1 to n do
  a[i]:=ord(st[i])-48;

 for j:=1 to n-1 do
   begin
    chuli(a[j],1);
    write(' ');
   end;
  chuli(a[n],1);
  writeln;{weima1}

 for i:=1 to big do
  begin
   for j:=1 to n-1 do
    begin
     chuli(a[j],2);
     write(' ');
    end;
   chuli(a[n],2);
   writeln;{weima2}
  end;

 for j:=1 to n-1 do
   begin
    chuli(a[j],3);
    write(' ');
   end;
  chuli(a[n],3);
  writeln;{weima3}

 for i:=1 to big do
  begin
   for j:=1 to n-1 do
    begin
     chuli(a[j],4);
     write(' ');
    end;
   chuli(a[n],4);
   writeln;{weima4}
  end;

 for j:=1 to n-1 do
   begin
    chuli(a[j],5);
    write(' ');
   end;
  chuli(a[n],5);
  writeln;{weima5}
end.