defmodule RadiopartyWeb.PageController do
  use RadiopartyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
