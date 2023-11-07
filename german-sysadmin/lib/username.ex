defmodule Username do
  def sanitize([]), do: []

  def sanitize([head | tail]) do
    cleaned =
      case head do
        ?ß -> 'ss'
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ü -> 'ue'
        letter when (letter >= ?a and letter <= ?z) -> [letter]
        ?_ -> '_'
        _  -> ''
      end
    cleaned ++ sanitize(tail)
  end
end
