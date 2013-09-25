local
    Keys = ["local" "in" "if" "then" "else" "end"]
    Operators = ["+" "-" "/" "*"]

    fun {CreateToken L}
        if {List.member L Keys} then
            "key("#L#")"
        elseif {Char.isUpper L.1} then
            "id("#L#")"
        elseif {Char.isLower L.1} then
            "atom("#L#")"
        elseif {List.member L Operators} then
            "operator("#L#")"
        elseif L=="=" then
            "unification"
        elseif L=="==" then
            "comparison"
        else
            "?"
        end
    end

    fun {Tokenize L}
        case L
        of H|T then
            {CreateToken H}|{Tokenize T}
        [] nil then
            nil
        end
    end
in
    {Browse {Tokenize ["local" "+" "else" "==" "Test" "test"]}}
end
