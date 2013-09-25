declare

fun {Recognize L}
    case L of nil then false
    [] H|T then
        if H==97 then
            {RecognizeB T}
        else
            false
        end
    end
end

fun {RecognizeB L}
    case L of nil then false
    [] H|T then
        if H==98 then
            {RecognizeB T}
        elseif H==97 then
            {RecognizeA T}
        else
            false
        end
    end
end

fun {RecognizeA L}
    case L of nil then
        true
    else
        false
    end
end

% Tests:
{Browse {Recognize "abbbbba"}}
{Browse {Recognize "aa"}}
{Browse {Recognize "abb"}}
{Browse {Recognize "baba"}}
