worth(s) = sum(map(c->Int(c)-Int('A')+1, collect.(s)))

open("p022_names.txt") do f
    names = split(replace(read(f, String) , "\"" => ""), ",")
    names = sort(names)

    [i*worth(name) for (i, name) in enumerate(names)] |> sum |> println
end
