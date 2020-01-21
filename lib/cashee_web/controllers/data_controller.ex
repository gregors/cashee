defmodule CasheeWeb.DataController do
  use CasheeWeb, :controller

  def show(conn, %{"key" => key}) do
    [{ key2, data }] = :ets.lookup(:cache, key)

    json(conn, data)
  end

  def update(conn, params) do
    key = params |> Map.keys |> hd
    value = params |> Map.get(key)

    :ets.insert(:cache, { key, value})
    json(conn, %{key: key, value: value})
  end
end
