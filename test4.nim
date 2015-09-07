import sequtils
import times

template myMap4[T,U](seq1: seq[T], f: expr): seq[U] =
  var result = newSeq[type(f(seq1[0]))](seq1.len)
  var i = 0
  for it in items(seq1):
    result[i] = f(it)
    i += 1
  result

when isMainModule:
  var x = toSeq(1..1000)
  var s = 0
  echo "test4: template map(), f is a function"
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
