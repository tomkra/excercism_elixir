defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    extract_key(data, String.split(path, "."))
  end

  defp extract_key(data, []), do: data

  defp extract_key(data, [head | tail]) do
    extract_key(data[head], tail)
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
