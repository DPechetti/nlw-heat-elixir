defmodule HeatTagsWeb.MessagesController do
  use HeatTagsWeb, :controller

  def create(conn, params) do
    IO.inspect(params)

    # text(conn, "Recebi a requisição")
    conn |> text("Recebi a requisição")
  end
end
