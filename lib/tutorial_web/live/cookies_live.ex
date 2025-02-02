defmodule TutorialWeb.CookiesLive do
  use TutorialWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="min-h-screen flex flex-col items-center justify-center bg-gradient-to-b from-purple-900 to-red-900 text-white">
      <h1 class="absolute top-5 left-5 text-2xl font-bold">Cookie Clicker</h1>
      <div
        phx-click="increment"
        phx-value-amount="1"
        phx-keydown="increment"
        phx-key="Enter"
        tabindex="0"
        class="text-9xl cursor-pointer select-none transition-transform duration-100 hover:scale-110 active:scale-90"
      >
        🍪
      </div>
      <div class="text-4xl mt-5">Cookies: {@count}</div>
      <div class="mt-10 space-x-4">
        <button
          class="bg-blue-600 text-white py-2 px-4 rounded hover:bg-blue-700"
          phx-click="increment"
          phx-value-amount="1"
        >
          +1
        </button>

        <button
          :if={@count >= 100}
          class="bg-green-600 text-white py-2 px-4 rounded hover:bg-green-700"
          phx-click="increment"
          phx-value-amount="5"
        >
          +5
        </button>

        <button
          :if={@count >= 1000}
          class="bg-purple-600 text-white py-2 px-4 rounded hover:bg-purple-700"
          phx-click="increment"
          phx-value-amount="10"
        >
          +10
        </button>

        <button
          class="delete-button mt-10 rounded-md px-4 py-2 border bg-red-600 border-red-600 hover:bg-red-500 hover:border-red-500"
          phx-click="reset"
        >
          Reset cookie count
        </button>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  def handle_event("increment", %{"amount" => amount}, socket) do
    {:noreply, assign(socket, :count, socket.assigns.count + String.to_integer(amount))}
  end

  def handle_event("reset", _params, socket) do
    {:noreply, assign(socket, :count, 0)}
  end
end
