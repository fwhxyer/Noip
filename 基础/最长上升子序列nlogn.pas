var
        l:array[0..10000] of longint;
        a,i,n,left,right,mid,len:longint;
begin
        readln(n);
        len := 0;
        l[len] := 0;
        for i := 1 to n do
        begin
                read(a);
                if a > l[len] then //这里改成>=即最长不下降子序列
                begin
                        inc(len);
                        l[len] := a;
                end
                else
                begin
                        left := 0;
                        right := len;
                        while left < right do
                        begin
                                mid := (left+right) shr 1;
                                if a <= l[mid] then right := mid 
                                else    left := mid+1;
                        end;
                        l[left] := a;
                end;
        end;
        readln;
        writeln(len);
end.