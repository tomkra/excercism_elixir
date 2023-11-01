defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    case {x, y} do
      {x, y} when x > 10 or y > 10 -> 0
    end
  end
end
