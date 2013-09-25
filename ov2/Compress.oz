declare

fun {Compress Ms}
    Ns = {ApplyRules Ms}
in
    if Ns==Ms then Ms else {Compress Ns} end
end

fun {ApplyRules Ms}
    case Ms of nil then nil
    [] trackA(N) | trackA(M) | R then
        trackA(N+M) | {ApplyRules R}
    [] trackB(N) | trackB(M) | R then
        trackB(N+M) | {ApplyRules R}
    [] trackA(0) | R then
        {ApplyRules R}
    [] trackB(0) | R then
        {ApplyRules R}
    [] H|T then
        H | {ApplyRules T}
    end
end

% Test
{Browse {Compress [trackB(~1) trackA(1) trackA(~1) trackB(1)]}}
