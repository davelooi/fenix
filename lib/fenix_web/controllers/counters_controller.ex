defmodule FenixWeb.CountersController do
  use FenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"key" => key}) do
    import Ecto.Query
    counter = Fenix.Repo.one(from c in Fenix.Counter, where: c.key == ^key)
    render(conn, "show.html", key: counter.key, counter: counter.counter)
  end

  # def create(conn, %{"key" => key}) do
  #   Repo.insert(%Counter{key: key, counter: 0})
  #   redirect(conn, to: "/counters/#{key}")
  # end
end