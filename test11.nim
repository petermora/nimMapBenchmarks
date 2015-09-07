import sequtils
import times
import test7

when isMainModule:
  var x = toSeq(1..1000)
  var s = 0
  echo "test11: call test7's map() which is a template"
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
