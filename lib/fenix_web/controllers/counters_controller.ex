defmodule FenixWeb.CountersController do
  use FenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"key" => key}) do
    render(conn, "show.html", key: key)
  end
end
