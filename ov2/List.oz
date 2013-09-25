declare
fun {Length Xs}
    case Xs
    of H|T then
        1 + {Length T}
    else
        0
    end
end

fun {Take Xs N}
    if N > {Length Xs} then
        Xs
    elseif N > 0 then
        case Xs
        of H|T then
            H|{Take T N-1}
        [] nil then
            nil
        end
    else
        nil
    end
end

fun {Drop Xs N}
    if N > {Length Xs} then
        nil
    elseif N > 0 then
        case Xs
        of H|T then
            {Drop T N-1}
        [] nil then
            nil
        end
    else
        Xs
    end
end

fun {Append Xs Ys}
    case Xs
    of nil then
        Ys
    [] H|T then
        H|{Append T Ys}
    end
end

fun {Member Xs Y}
    case Xs
    of H|T then
        if H==Y then
            true
        else
            {Member T Y}
        end
    else
        if Xs==Y then
            true
        else
            false
        end
    end
end

fun {Position Xs Y}
    case Xs
    of H|T then
        if H==Y then
            1
        else
            1+{Position T Y}
        end
    else
        1
    end
end
