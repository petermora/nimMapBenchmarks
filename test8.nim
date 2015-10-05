import sequtils
import times

template myMap8(seq1: seq[int], f: expr): seq[int] =
  let s = seq1
  var result = newSeq[int](s.len)
  for i in 0..<s.len:
    var it{.inject.} = s[i]
    result[i] = f
  result

when isMainModule:
  var x = toSeq(1..1000)
  var s = 0
  echo "test8: template map(), f is an expression (e.g., it+10+i), iterating using index i and not it, no type magic"
  var t = epochTime()
  for i in 0..<100_000:
    s += myMap8(x, it+10+i)[9]
    s += myMap8(x, it+11+i)[9]
    s += myMap8(x, it+12+i)[9]
    s += myMap8(x, it+13+i)[9]
    s += myMap8(x, it+14+i)[9]
    s += myMap8(x, it+15+i)[9]
    s += myMap8(x, it+16+i)[9]
    s += myMap8(x, it+17+i)[9]
    s += myMap8(x, it+18+i)[9]
    s += myMap8(x, it+19+i)[9]
  echo s, ",",epochTime()-t
