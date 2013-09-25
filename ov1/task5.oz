% A:
declare
fun {SumTo X Y}
    if X<Y then
        X + {SumTo X+1 Y}
    else
        X
    end
end

% Test:
{Browse {SumTo 3 5}}

% B:

fun {Max X Y}
    if X==0 then
        Y
    elseif Y==0 then
        X
    else
        1 + {Max X-1 Y-1}
    end
end

% Test:
{Browse {Max 6 3}}
