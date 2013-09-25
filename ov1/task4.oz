declare
proc {Circle R}
    local
        A = 3.14 * R * R
        D = 2.0 * R
        O = 3.14 * D
    in
        {Browse A}
        {Browse D}
        {Browse O}
    end
end

% Test:
{Circle 5.0}
