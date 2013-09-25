declare
fun {Min X Y}
    if X<Y then
        X
    else
        Y
    end
end

fun {IsBigger X Treshold}
    if X>Treshold then
        true
    else
        false
    end
end
