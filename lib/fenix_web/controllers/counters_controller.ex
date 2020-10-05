defmodule FenixWeb.CountersController do
  use FenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"key" => key}) do
    render(conn, "show.html", key: key, counter: 0)
  end

  # def create(conn, %{"key" => key}) do
  #   Repo.insert(%Counter{key: key, counter: 0})
  #   redirect(conn, to: "/counters/#{key}")
  # end
end
