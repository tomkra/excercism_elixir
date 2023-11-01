defmodule BirdCount do
  def today(list) do
    List.first(list)
  end

  def increment_day_count(list) when is_nil(list), do: [1]
  def increment_day_count(_list = []), do: [1]

  def increment_day_count(list) when is_list(list) do
    [head | tail] = list
    [head + 1 | tail]
  end

  def has_day_without_birds?(list) do
    0 in list
  end

  def total([]), do: 0

  def total(list) do
    [head | tail] = list
    head + total(tail)
  end

  def busy_days([]), do: 0

  def busy_days(list) do
    [head | tail] = list
    val = if head >= 5 do
      1
    else
      0
    end

    val + busy_days(tail)
  end
end
