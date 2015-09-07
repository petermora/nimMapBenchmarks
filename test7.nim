import sequtils
import times

template myMap7*[T,U](seq1: seq[T], f: expr): seq[U] =
  type T = type(seq1[0])
  type S = type((
    block:
      var it{.inject.}: T
      f))
  var result = newSeq[S](seq1.len)
  for i in 0..<seq1.len:
    var it{.inject.} = seq1[i]
    result[i] = f
  result

when isMainModule:
  var x = toSeq(1..1000)
  var s = 0
  echo "test7: template map(), f is an expression (e.g., it+10+i), iterating using index i and not it"
  var t = epochTime()
  for i in 0..<100_000:
    s += myMap7(x, it+10+i)[9]
    s += myMap7(x, it+11+i)[9]
    s += myMap7(x, it+12+i)[9]
    s += myMap7(x, it+13+i)[9]
    s += myMap7(x, it+14+i)[9]
    s += myMap7(x, it+15+i)[9]
    s += myMap7(x, it+16+i)[9]
    s += myMap7(x, it+17+i)[9]
    s += myMap7(x, it+18+i)[9]
    s += myMap7(x, it+19+i)[9]
  echo s, ",",epochTime()-t
