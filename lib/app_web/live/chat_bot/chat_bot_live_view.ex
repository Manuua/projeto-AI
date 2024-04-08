defmodule AppWeb.ChatBot.ChatBotLiveView do
  use AppWeb, :live_view


  def render(assigns) do
    ~H"""
    <div class="left-[40rem] fixed inset-y-0 right-0 z-0 hidden lg:block xl:left-[50rem]">
      <img src={~p"/images/page.svg"}
          alt="Chatbot"
          class="absolute inset-0 w-full h-full object-cover" />
    </div>
    <div class="px-4 py-10 sm:px-6 sm:py-28 lg:px-8 xl:px-28 xl:py-32">
      <div class="mx-auto max-w-xl lg:mx-0">
        <h1 class="text-brand mt-10 flex items-center text-sm font-semibold leading-6">
          Chatbot de Direcionamento para Escolha de Curso Superior
        </h1>
        <p class="text-[2rem] mt-4 font-semibold leading-10 tracking-tighter text-zinc-900">
          Bem-vindo ao Chatbot que irá ajudar a Ingressar na FATEC ZONA SUL !
        </p>
        <p class="mt-4 text-base leading-7 text-zinc-600">
          Este chatbot está aqui para ajudá-lo a escolher o curso superior ideal.
        </p>
        <div class="flex flex-col flex-auto h-full">
          <div class="flex flex-col flex-auto flex-shrink-0 rounded-2xl bg-gray-100 h-full p-4">
            <div
              id="chat-content"
              class="flex flex-col h-full overflow-x-auto mb-4 min-h-[10rem] max-h-[30rem]"
            >
              <div class="flex flex-col h-full">
                <div class="grid grid-cols-12 gap-y-2">
                  <%= for msg <- @chat do %>
                    <%= if msg[:role] == "user" do %>
                      <div class="col-start-1 col-end-13 sm:col-start-1 sm:col-end-8 p-3 rounded-lg sm:w-full">
                        <div class="flex flex-row items-center">
                          <div class="flex items-center justify-center h-10 w-10 rounded-full bg-blue-500 flex-shrink-0 text-white">
                            U
                          </div>
                          <div class="relative ml-3 text-sm bg-white py-2 px-4 shadow rounded-xl w-full sm:w-auto">
                            <div><%= msg[:content] %></div>
                          </div>
                        </div>
                      </div>
                    <% else %>
                      <div class="col-start-1 col-end-13 sm:col-start-5 sm:col-end-13 p-3 rounded-lg sm:w-full">
                        <div class="flex items-center justify-start flex-row-reverse">
                          <div class="flex items-center justify-center h-10 w-10 rounded-full bg-blue-500 flex-shrink-0 text-white">
                            B
                          </div>
                          <div class="relative mr-3 text-sm bg-blue-100 py-2 px-4 shadow rounded-xl w-full sm:w-auto">
                            <div><%= msg[:content] %></div>
                          </div>
                        </div>
                      </div>
                    <% end %>
                  <% end %>
                </div>
              </div>
            </div>
            <div class="flex flex-col sm:flex-row items-center h-16 rounded-xl w-full px-4">
              <div class="flex-grow sm:ml-4 mb-2 sm:mb-0 w-full sm:w-auto">
                <div class="relative w-full">
                  <form id="chat-form" phx-submit="submit">
                    <input
                      type="text"
                      id="msg"
                      name="msg"
                      required
                      value={@msg}
                      phx-value="msg"
                      class="w-full border rounded-xl focus:outline-none focus:border-blue-300 pl-4 h-10"
                    />
                  </form>
                </div>
              </div>
              <div class="flex-shrink-0 sm:ml-4">
                <button
                  type="submit"
                  form="chat-form"
                  phx-disable-with="Processando..."
                  class="flex items-center justify-center bg-blue-500 hover:bg-blue-600 rounded-xl text-white px-4 py-1"
                >
                  <span>Enviar</span>
                  <span class="ml-2">
                    <svg
                      class="w-4 h-4 transform rotate-45 -mt-px"
                      fill="none"
                      stroke="currentColor"
                      viewBox="0 0 24 24"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"
                      >
                      </path>
                    </svg>
                  </span>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script>
      window.addEventListener("phx:update", function (event) {
        var chatContent = document.getElementById("chat-content")
        chatContent.scrollTop = chatContent.scrollHeight
      })
    </script>
    """
  end

  def mount(_params, session, socket) do
    chat =
      case session do
        %{chat: chat} -> chat
        _ -> []
      end

    {:ok,
     assign(
       socket,
       [
         {:trigger_submit, false},
         {:msg, ""},
         {:chat, chat},
         {:form, nil},
         {:timer_ref, nil}
       ]
     )}
  end

  def handle_event("submit", %{"msg" => msg}, socket) when msg != "" do
    case socket.assigns.timer_ref do
      nil -> :ok
      timer_ref -> :erlang.cancel_timer(timer_ref)
    end

    chat = socket.assigns.chat
    chat = chat ++ [%{role: "user", content: msg}]

    random_times = Enum.random(3..7)

    timer_ref = Process.send_after(self(), :update, random_times * 1000)

    {:noreply,
     assign(
       socket,
       [
         {:trigger_submit, true},
         {:msg, ""},
         {:chat, chat},
         {:timer_ref, timer_ref}
       ]
     )}
  end

  def handle_event(
        "process",
        %{"msg" => _msg},
        socket
      ) do
    chat = socket.assigns.chat
    message = "Ainda não fui implementado, mas em breve estarei! :D"
    chat = chat ++ [%{role: "assistant", content: message}]

    {:noreply,
     assign(
       socket,
       [
         {:trigger_submit, true},
         {:msg, ""},
         {:chat, chat}
       ]
     )}
  end

  def handle_info(:update, socket) do
    msg = socket.assigns.chat |> Enum.at(-1) |> Map.get(:content)
    handle_event("process", %{"msg" => msg}, socket)
  end
end
