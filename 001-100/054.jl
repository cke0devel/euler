using DataStructures

games = []

open("p054_pocker.txt") do f
    global games = split.(split(strip(read(f, String)), "\n"))
end

v = Dict('2'=>2, '3'=>3, '4'=>4, '5'=>5, '6'=>6, '7'=>7,
         '8'=>8, '9'=>9, 'T'=>10, 'J'=>11, 'Q'=>12, 'K'=>13,
         'A'=>14)

function comp(lhs, rhs)
    return v[lhs[1]] < v[rhs[1]]
end

function check(cards)
    cards = sort(cards, lt=comp; rev=true)

    numbers = map(x->v[x[1]], cards)
    units = map(x->x[2], cards)

    # Royal Flush
    if numbers == [14, 13, 12, 11, 10] && length(Set(units))==1
        return [(9, v['A'])]
    end

    # Straight Flush
    if (numbers==numbers[1]:-1:numbers[1]-4) && length(Set(units))==1
        return [(8, numbers[end])]
    end

    occur = sort(collect(pairs(counter(numbers))), by=x->x[2]; rev=true)

    # Four of a Kind
    if occur[1][2] == 4
        return [(7, numbers[1])]
    end

    # Full House
    if occur[1][2]==3 && occur[2][2]==2
        return [(6, [occur[1][1], occur[2][1]])]
    end

    # Flush
    if length(Set(units))==1
        return [(5, numbers)]
    end

    # Straight
    if numbers == numbers[1]:-1:numbers[1]-4
        return [(4, numbers[1])]
    end

    # Three of a Kind
    if occur[1][2]==3
        l = collect(filter(x->x!=occur[1][1], numbers))
        return [(3, occur[1][1]), (0, l[1]), (0, l[2])]
    end

    # Two Pairs
    if occur[1][2]==2 && occur[2][2]==2
        if occur[1][1] >= occur[2][1]
            return [(2, occur[1][1], occur[2][1]), (0, occur[3][1])]
        else
            return [(2, occur[2][1], occur[1][1]), (0, occur[3][1])]
        end
    end

    # One Pair
    if occur[1][2]==2
        l = collect(filter(x->x!=occur[1][1], numbers))
        return [(1, occur[1][1]), (0, l[1]), (0, l[2]), (0, l[3])]
    end

    # High Card
    return collect(map(x->(0, x),numbers))
end

function win(game)
    p1, p2 = game[1:5], game[6:end]

    c1, c2 = check(p1), check(p2)

    i = 1
    while i <= min(length(c1), length(c2))
        rank1, rank2 = c1[i], c2[i]

        if rank1[1] > rank2[1]
            return 1
        end

        if rank1[1] < rank2[1]
            return 2
        end

        if rank1[1] == 6
            if rank1[2] == rank2[2]
                return rank1[3]>rank2[3] ? 1 : 2
            end

            return rank1[2]>rank2[2] ? 1 : 2
        end

        if rank1[1] == 2
            if rank1[2]!=rank2[2]
                return rank1[2]>rank2[2] ? 1 : 2
            end
            if rank1[3]!=rank2[3]
                return rank1[3]>rank2[3] ? 1 : 2
            end

            i += 1
            continue
        end

        if rank1[2] != rank2[2]
            return rank1[2]>rank2[2] ? 1 : 2
        end

        i += 1
    end

    return 0
end

(win.(games) .== 1) |> sum |> println
