defmodule NameBadge do
  def print(id, name, department) do
    result = if id, do: "[#{id}] - #{name}", else: "#{name}"
    result =
      if !department do
        "#{result} - OWNER"
      else
        "#{result} - #{String.upcase(department)}"
      end

    result
  end
end
