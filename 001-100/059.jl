msg = []
open("p059_cipher.txt") do f
    global msg = parse.(Int, split(strip(read(f, String)), ','))
end

"""
msg = msg[1:20]
for a='a':'z', b='a':'z', c='a':'z'
    key = repeat([Int(a), Int(b), Int(c)], div(length(msg)+2, 3))
    key = key[1:length(msg)]

    decrypted = msg .⊻ key

    if all(isascii.(Char.(decrypted))) == false
        continue
    end

    println([a,b,c] |> join)
    println(join(Char.(decrypted)))
end
"""

key = Int.(collect("exp"))
key = repeat(key, div(length(msg)+2, 3))
decrypted = msg .⊻ key
println(sum(decrypted))
