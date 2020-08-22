defmodule TestdoWeb.PageController do
  use TestdoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
