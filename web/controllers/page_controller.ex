defmodule Findit.PageController do
  use Findit.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
