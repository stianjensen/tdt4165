% a:

local Append in
    Append = proc {$ Xs Ys ?Zs}
        case Xs of nil then
            Zs = Ys
        else
            case Xs of '|'(X Xr) then
                local Zr in Zs='|'(X Zr) {Append Xr Ys Zr} end
            end
        end
    end
end


% b:

local Max in
    local RecMax in
        RecMax = proc {$ N M A ?S}
            local NIsZero in
                {Value.'==' N 0 NIsZero}
                if NIsZero then
                    {Number.'+' M A S}
                else
                    local MIsZero in
                        {Value.'==' M 0 MIsZero}
                        if MIsZero then
                            {Number.'+' N A S}
                        else
                            local NewN in
                                local NewM in
                                    local NewA in
                                        {Number.'-' N 1 NewN}
                                        {Number.'-' M 1 NewM}
                                        {Number.'+' A 1 NewA}
                                        {RecMax NewN NewM NewA S}
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        Max = proc {$ N M ?S}
            {RecMax N M 0 S}
        end
    end
end

