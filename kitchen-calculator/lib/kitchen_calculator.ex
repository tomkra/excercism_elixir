defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    {_unit, volume} = volume_pair
    volume
  end

  def to_milliliter(volume_pair) do
    {unit, volume} = volume_pair
    value =
      case unit do
        :cup ->
          volume * 240
        :fluid_ounce ->
          volume * 30
        :teaspoon ->
          volume * 5
        :tablespoon ->
          volume * 15
        _ ->
          volume
      end
    {:milliliter, value}
  end

  def from_milliliter(volume_pair, unit) do
    {_from_unit, volume} = volume_pair
    value =
      case unit do
        :cup ->
          volume / 240
        :fluid_ounce ->
          volume / 30
        :teaspoon ->
          volume / 5
        :tablespoon ->
          volume / 15
        _ ->
          volume
      end

    {unit, value}
  end

  def convert(volume_pair, unit) do
    milliliters = to_milliliter(volume_pair)
    from_milliliter(milliliters, unit)
  end
end
