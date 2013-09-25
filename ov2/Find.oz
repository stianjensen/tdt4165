\insert 'List.oz'

declare

fun {SplitTrain Xs Y}
    P = {Position Xs Y}
    in
    {Take Xs P-1}#{Drop Xs P}
end

fun {Find Xs Ys}
    case Ys
    of nil then
        nil
    [] Y|Yr then
        Hs
        Ts
    in
        Hs#Ts = {SplitTrain Xs Y}
        trackA({Length Ts}+1) |
        trackB({Length Hs}) |
        trackA(~({Length Ts}+1)) |
        trackB(~({Length Hs})) |
        {Find {Append Ts Hs} Yr}
    end
end
