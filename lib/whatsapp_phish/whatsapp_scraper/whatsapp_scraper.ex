defmodule WhatsappPhish.WhatsappScraper do
  @moduledoc """
  The WhatsappScraper context.
  """

  use Hound.Helpers

  def get_qr_code() do
    Hound.start_session()
    navigate_to("https://web.whatsapp.com")

    :timer.sleep(2000)

    qr_code = page_source()
              |> Floki.attribute(".qrcode img", "src")

    qr_code |> Enum.at(0)
  end
end
