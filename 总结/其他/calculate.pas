program calculate;
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
        end;
      end;
    while top2>0 do
      calculate;
    writeln(stack1[top1]);
  end;
begin
  solve;
end.