defmodule LibraryFees do
  def datetime_from_string(string) do
    {_, datetime} = NaiveDateTime.from_iso8601(string)
    datetime
  end

  def before_noon?(datetime) do
    if datetime.hour < 12, do: true, else: false
  end

  def return_date(checkout_datetime) do
    days = if before_noon?(checkout_datetime), do: 28, else: 29
    NaiveDateTime.add(checkout_datetime, days, :day)
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    late =
      actual_return_datetime
      |> NaiveDateTime.to_date()
      |> Date.diff(planned_return_date)
    if late < 0, do: 0, else: late
  end

  def monday?(datetime) do
    day =
      datetime
      |> NaiveDateTime.to_date()
      |> Date.day_of_week()

    day == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    return_date = return_date(datetime_from_string(checkout))
    checkout_datetime = datetime_from_string(return)

    late = days_late(return_date, checkout_datetime)
    money = late * rate

    if monday?(datetime_from_string(return)) do
      div(money, 2)
    else
      money
    end
  end
end
