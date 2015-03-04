var
        l:array[0..100100] of longint;
        a,i,n,left,right,mid,len:longint;
begin
        readln(n);
        len := 0;
        l[len] := maxlongint;
        for i := 1 to n do
        begin
                read(a);
                if a < l[len] then //如果把等号去掉就是不严格的单调序列了
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
                                if a >= l[mid] then right := mid
                                else    left := mid+1;
                        end;
                        l[left] := a;
                end;
        end;
        readln;
        writeln(len);
end.