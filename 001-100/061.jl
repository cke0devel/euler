using Combinatorics

triangle = [div(n*(n+1), 2) for n=45:140]
square = [n^2 for n=32:99]
pentagonal = [div(n*(3n-1), 2) for n=26:81]
hexagonal = [n*(2n-1) for n=23:70]
heptagonal = [div(n*(5n-3), 2) for n=21:63]
octagonal = [n*(3n-2) for n=19:58]

numbers = [triangle, square, pentagonal, hexagonal, heptagonal, octagonal]

function range(list, p)
    return first(searchsorted(list, (p%100)*100)):first(searchsorted(list, (p%100)*100+99))-1
end

function solve(order)
    n1, n2, n3, n4, n5, n6 = numbers[order]

    for p3=n1
        if p3%100 < 10
            continue
        end

        for p4=n2[range(n2, p3)]
            if p4%100 < 10
                continue
            end

            for p5=n3[range(n3, p4)]
                if p5%100 < 10
                    continue
                end

                for p6=n4[range(n4, p5)]
                    if p6%100 < 10
                        continue
                    end

                    for p7=n5[range(n5, p6)]
                        if p7%100 < 10
                            continue
                        end

                        for p8=n6[range(n6, p7)]
                            if p8%100 < 10
                                continue
                            end

                            if p8%100 != div(p3,100)
                                continue
                            end

                            println([p3,p4,p5,p6,p7,p8], sum([p3,p4,p5,p6,p7,p8]))
                        end
                    end
                end
            end
        end
    end
end

for order=permutations(1:6)
    solve(order)
end

