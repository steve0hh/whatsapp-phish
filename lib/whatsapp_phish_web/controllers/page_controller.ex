defmodule WhatsappPhishWeb.PageController do
  use WhatsappPhishWeb, :controller

  plug :put_layout, false
  def index(conn, _params) do
    render conn, "index.html"
  end
end
