\insert 'List.oz'

declare

fun {ApplyMoves Start Moves}
    case Moves
    of nil then
        Start|nil
    [] H|T then
        Next = case H
        of trackA(N) then
            if N>0 then
                Anew = {Append {Drop Start.main {Length Start.main}-N} Start.trackA}
                Mainnew = {Take Start.main {Length Start.main}-N}
                in
                state(main:Mainnew trackA:Anew trackB:Start.trackB)
            elseif N<0 then
                Mainnew = {Append Start.main {Take Start.trackA ~N}}
                Anew = {Drop Start.trackA ~N}
                in
                state(main:Mainnew trackA:Anew trackB:Start.trackB)
            else
                Start
            end
        [] trackB(N) then
            if N>0 then
                Bnew = {Append {Drop {Length Start.main}-N} Start.trackB}
                Mainnew = {Take Start.main {Length Start.main}-N}
                in
                state(main:Mainnew trackA:Start.trackA trackB:Bnew)
            elseif N<0 then
                Mainnew = {Append Start.main {Take Start.trackB ~N}}
                Bnew = {Drop Start.trackA ~N}
                in
                state(main:Mainnew trackA:Start.trackA trackB:Bnew)
            else
                Start
            end
        end
    in
        Start | {ApplyMoves Next T}
    end
end

{Browse {ApplyMoves state(main:[a b c] trackA:nil trackB:nil) [trackA(1) trackA(~1)]}}
