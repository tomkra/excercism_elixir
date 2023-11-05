defmodule HighScore do
  @default_value 0

  def new() do
    %{}
  end

  def add_player(scores, name, score \\ @default_value) do
    Map.update(scores, name, score, fn _ -> score end)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.update(scores, name, @default_value, fn _ -> @default_value end)
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, &(&1 + score))
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
