defmodule WhatsappPhish.WhatsappScraperServer do
  use GenServer
  use Hound.Helpers

  # External API

  def start_link() do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def get_qr_code() do
    GenServer.call __MODULE__, :get_qr_code
  end

  # Internal API
  def init(_state) do
    Hound.start_session()
    send(self(), :refresh_page)
    {:ok, ""}
  end

  def handle_call(:get_qr_code, _from, qr_code_data) do
    {:reply, qr_code_data, qr_code_data}
  end

  def handle_info(:refresh_page, qr_code_data) do
    navigate_to("https://web.whatsapp.com")
    Process.send_after(self(), :update_qr_code, 2000) # In 2 seconds
    schedule_work() # reschedule :)
    {:noreply, qr_code_data}
  end

  def handle_info(:update_qr_code, _qr_code_data) do
    qr_code_data = page_source()
                   |> Floki.attribute(".qrcode img", "src")
                   |> Enum.at(0)
    {:noreply, qr_code_data}
  end

  defp schedule_work() do
    Process.send_after(self(), :refresh_page, 20000) # In 20 seconds
  end
end
