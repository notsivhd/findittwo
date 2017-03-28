defmodule Findit.PageController do
  use Findit.Web, :controller

  # Initialize the app
  def index(conn, _params) do
    render conn, "index.html"
  end
end
