declare
fun {Length Xs}
    case Xs
    of H|T then
        1 + {Length T}
    else
        0
    end
end
{Browse {Length [1 2 3 4]}}

local
    fun {Take Xs N}
        if N>{Length Xs} then
            Xs
        else
            case Xs
            of H|T then
                if N==1 then
                    H
                else
                    H|{Take T N-1}
                end
            end
        end
    end
in
    {Browse {Take [1 2 3] 2}}
end

local
    fun {Drop Xs N}
        if N>{Length Xs} then
            nil
        else
            case Xs
            of H|T then
                if N==1 then
                    T
                else
                    {Drop T N-1}
                end
            end
        end
    end
in
    {Browse {Drop [1 2 3] 2}}
end

local
    fun {Append Xs Ys}
        case Xs
        of H|T then
            H|{Append T Ys}
        else
            Xs|Ys
        end
    end
in
    L = {Append 1|2|3 4|5|6}
    {Browse L}
end

local
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
in
    {Browse {Member [1 2 3] 2}}
    {Browse {Member [1 2 3] 4}}
end

local
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
in
    {Browse {Position [4 6 8] 6}}
    {Browse {Position [2 4] 4}}
end
