import Runes

func sequence<T>(xs: [Decoded<T>]) -> Decoded<[T]> {
  return xs.reduce(pure([])) { accum, elem in
    curry(+) <^> accum <*> (pure <^> elem)
  }
}

func sequence<T>(xs: [String: Decoded<T>]) -> Decoded<[String: T]> {
  return xs.reduce(pure([:])) { accum, elem in
    curry(+) <^> accum <*> ({ [elem.0: $0] } <^> elem.1)
  }
}
