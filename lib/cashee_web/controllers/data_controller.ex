defmodule CasheeWeb.DataController do
  use CasheeWeb, :controller

  def show(conn, %{"key" => key}) do
    data = case :ets.lookup(:cache, key) do
      [{ key, value }] -> value
      _ -> ''
    end

    json(conn, data)
  end

  def update(conn, params) do
    key = params["key"]
    value = Map.delete(params, "key")

    :ets.insert(:cache, { key, value})
    json(conn, %{key: key, value: value})
  end
end
