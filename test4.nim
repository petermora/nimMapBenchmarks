import sequtils
import times
import future

template myMap4[T](seq1: seq[T], fIn: expr): expr =
  let s = seq1
  let f = fIn
  var result = newSeq[type(f(s[0]))](s.len)
  for i in 0..<s.len:
    result[i] = f(s[i])
  result

when isMainModule:
  var x = toSeq(1..1000)
  var s = 0
  echo "test4: template map(), f is a function, iterating i and not it"
  var t = epochTime()
  for i in 0..<100_000:
    s += myMap4(x, proc(x: int): int = x+10+i)[9]
    s += myMap4(x, proc(x: int): int = x+11+i)[9]
    s += myMap4(x, proc(x: int): int = x+12+i)[9]
    s += myMap4(x, proc(x: int): int = x+13+i)[9]
    s += myMap4(x, proc(x: int): int = x+14+i)[9]
    s += myMap4(x, proc(x: int): int = x+15+i)[9]
    s += myMap4(x, proc(x: int): int = x+16+i)[9]
    s += myMap4(x, proc(x: int): int = x+17+i)[9]
    s += myMap4(x, proc(x: int): int = x+18+i)[9]
    s += myMap4(x, proc(x: int): int = x+19+i)[9]
  echo s, ",",epochTime()-t
