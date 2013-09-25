\insert 'List.oz'

declare

fun {SplitTrain Xs Y}
    P = {Position Xs Y}
    in
    {Take Xs P-1}#{Drop Xs P}
end

fun {FewFind Xs Ys}
    case Ys
    of nil then
        nil
    [] Y|Yr then
        Hs
        Ts
        X|Xr = Xs
    in
        if Y == X then
            {FewFind Xr Yr}
        else
            Hs#Ts = {SplitTrain Xs Y}
            trackA({Length Ts}+1) |
            trackB({Length Hs}) |
            trackA(~({Length Ts}+1)) |
            trackB(~({Length Hs})) |
            {FewFind {Append Ts Hs} Yr}
        end
    end
end

{Browse {FewFind [c a b] [c b a]}}
