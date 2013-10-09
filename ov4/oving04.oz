declare

fun lazy {StreamMap S F}
    case S of nil then nil
    [] H|T then
        {F H}|{StreamMap T F}
    end
end

fun lazy {StreamZip S1 S2 F}
    case S1 of nil then nil
    [] H1|T1 then
        case S2 of nil then nil
        [] H2|T2 then
            {F H1 H2} | {StreamZip T1 T2 F}
        end
    end
end

fun lazy {StreamScale SF Factor}
    local
        fun {MultiplyByFactor A}
            A * Factor
        end
    in
        {StreamMap SF MultiplyByFactor}
    end
end

fun lazy {StreamAdd SF1 SF2}
    local
        fun {Add A B}
            A+B
        end
    in
        {StreamZip SF1 SF2 Add}
    end
end

fun lazy {StreamIntegrate S InitValue Dt}
    case S of nil then nil
    [] H|T then
        InitValue | {StreamIntegrate T InitValue+H*Dt Dt}
    end
end

fun lazy {MakeRC R C Dt}
    local
        fun {Rc SF V0}
            {StreamIntegrate {StreamScale SF 1.0/C} V0 Dt}
            {StreamScale SF R}
        end
    in
        RC
    end
end
