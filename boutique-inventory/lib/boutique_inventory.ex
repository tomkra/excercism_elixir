defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn item -> item.price == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item ->
      Map.put(item, :name, String.replace(item.name, old_word, new_word))
    end)
  end

  def increase_quantity(item, count) do
    # Map.put(item, :quantity_by_size, Enum.into(Enum.map(item.quantity_by_size, fn {k, v} -> {k, v + count} end), %{}))
    Map.put(item, :quantity_by_size, Enum.into(item.quantity_by_size, %{}, fn {k, v} -> {k, v + count} end))
  end

  def total_quantity(item) do
    # Enum.sum(Map.values(item.quantity_by_size))
    Enum.reduce(item.quantity_by_size, 0, fn {_k, val}, acc -> acc + val end)
  end
end
