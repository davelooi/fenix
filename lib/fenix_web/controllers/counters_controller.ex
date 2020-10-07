defmodule FenixWeb.CountersController do
  use FenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"key" => key}) do
    counter = Fenix.Counter.find_and_inc(key)

    render(conn, "show.html", counter: counter)
  end

  # def create(conn, %{"key" => key}) do
  #   Repo.insert(%Counter{key: key, counter: 0})
  #   redirect(conn, to: "/counters/#{key}")
  # end
end
