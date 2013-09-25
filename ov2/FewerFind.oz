\insert 'List.oz'

declare

fun {SplitTrain Xs Y}
    P = {Position Xs Y}
    in
    {Take Xs P-1}#{Drop Xs P}
end

fun {FewerFind Ms As Bs Ys}
    case Ys of nil then nil
    [] Y|Yr then
        Hs
        Ts
        M|Mr = Ms
    in
        if Y == M then
            {FewerFind Mr As Bs Yr}
        elseif {Member Ms Y} then
            Hs#Ts = {SplitTrain Ms Y}
            trackA({Length Ts}+1) |
            trackB({Length Hs}) |
            trackA(~({Length Ts}+1)) |
            trackB(~({Length Hs})) |
            {FewerFind {Append Ts Hs} As Bs Yr}
        elseif {Member As Y} then
            Hs#Ts = {SplitTrain As Y}
            trackA(~{Length Hs}) |
            trackB({Length Hs}) |
            trackA(~1) |
            NewB = {Append {Take As {Length Hs}} Bs}
            NewMs = {Append Ms Y}
            in
            {FewerFind NewMs Ts NewB Yr}
        else
            Hs#Ts = {SplitTrain Bs Y}
            trackB(~{Length Hs}) |
            trackA({Length Hs}) |
            trackB(~1) |
            NewA = {Append {Take Bs {Length Hs}} As}
            NewMs = {Append Ms Y}
            in
            {FewerFind NewMs NewA Ts Yr}
        end
    end
end

{Browse {FewerFind [a b] nil nil [b a]}}
