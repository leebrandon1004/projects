declare
    s pls_integer := 0;
    i pls_integer := 0;
    j pls_integer;

begin
    <<outer_loop>>
    loop
        i := i+1;
        j := 1;
        <<inner_loop>>
        loop
            j := j+1;
            s := s + 1 * j;
            case
                when i=1 then i:=4;
                when j=2 then j:=4;
                else s:=s+1;
            end case;
            exit inner_loop when (j >5);
            exit outer_loop when ((i * j) > 15);
        end loop inner_loop;
    end loop outer_loop;
    dbms_output.put_line('equals: ' ||to_char(s));
    dbms_output.put_line('equals: ' ||to_char(i));
    dbms_output.put_line('equals: ' ||to_char(j));
end;