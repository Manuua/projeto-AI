defmodule AppWeb.Prompt.PromptLiveView do
  use AppWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="left-[40rem] fixed inset-y-0 right-0 z-0 hidden lg:block xl:left-[50rem]">
     <img src={~p"/images/page.svg"}
        alt="Phoenix Framework"
        class="absolute inset-0 w-full h-full object-cover" />
    </div>
    <div class="px-4 py-10 sm:px-6 sm:py-28 lg:px-8 xl:px-28 xl:py-32">
      <div class="mx-auto max-w-xl lg:mx-0">
        <svg viewBox="0 0 71 48" class="h-12" aria-hidden="true">
          <path
            d="m26.371 33.477-.552-.1c-3.92-.729-6.397-3.1-7.57-6.829-.733-2.324.597-4.035 3.035-4.148 1.995-.092 3.362 1.055 4.57 2.39 1.557 1.72 2.984 3.558 4.514 5.305 2.202 2.515 4.797 4.134 8.347 3.634 3.183-.448 5.958-1.725 8.371-3.828.363-.316.761-.592 1.144-.886l-.241-.284c-2.027.63-4.093.841-6.205.735-3.195-.16-6.24-.828-8.964-2.582-2.486-1.601-4.319-3.746-5.19-6.611-.704-2.315.736-3.934 3.135-3.6.948.133 1.746.56 2.463 1.165.583.493 1.143 1.015 1.738 1.493 2.8 2.25 6.712 2.375 10.265-.068-5.842-.026-9.817-3.24-13.308-7.313-1.366-1.594-2.7-3.216-4.095-4.785-2.698-3.036-5.692-5.71-9.79-6.623C12.8-.623 7.745.14 2.893 2.361 1.926 2.804.997 3.319 0 4.149c.494 0 .763.006 1.032 0 2.446-.064 4.28 1.023 5.602 3.024.962 1.457 1.415 3.104 1.761 4.798.513 2.515.247 5.078.544 7.605.761 6.494 4.08 11.026 10.26 13.346 2.267.852 4.591 1.135 7.172.555ZM10.751 3.852c-.976.246-1.756-.148-2.56-.962 1.377-.343 2.592-.476 3.897-.528-.107.848-.607 1.306-1.336 1.49Zm32.002 37.924c-.085-.626-.62-.901-1.04-1.228-1.857-1.446-4.03-1.958-6.333-2-1.375-.026-2.735-.128-4.031-.61-.595-.22-1.26-.505-1.244-1.272.015-.78.693-1 1.31-1.184.505-.15 1.026-.247 1.6-.382-1.46-.936-2.886-1.065-4.787-.3-2.993 1.202-5.943 1.06-8.926-.017-1.684-.608-3.179-1.563-4.735-2.408l-.043.03a2.96 2.96 0 0 0 .04-.029c-.038-.117-.107-.12-.197-.054l.122.107c1.29 2.115 3.034 3.817 5.004 5.271 3.793 2.8 7.936 4.471 12.784 3.73A66.714 66.714 0 0 1 37 40.877c1.98-.16 3.866.398 5.753.899Zm-9.14-30.345c-.105-.076-.206-.266-.42-.069 1.745 2.36 3.985 4.098 6.683 5.193 4.354 1.767 8.773 2.07 13.293.51 3.51-1.21 6.033-.028 7.343 3.38.19-3.955-2.137-6.837-5.843-7.401-2.084-.318-4.01.373-5.962.94-5.434 1.575-10.485.798-15.094-2.553Zm27.085 15.425c.708.059 1.416.123 2.124.185-1.6-1.405-3.55-1.517-5.523-1.404-3.003.17-5.167 1.903-7.14 3.972-1.739 1.824-3.31 3.87-5.903 4.604.043.078.054.117.066.117.35.005.699.021 1.047.005 3.768-.17 7.317-.965 10.14-3.7.89-.86 1.685-1.817 2.544-2.71.716-.746 1.584-1.159 2.645-1.07Zm-8.753-4.67c-2.812.246-5.254 1.409-7.548 2.943-1.766 1.18-3.654 1.738-5.776 1.37-.374-.066-.75-.114-1.124-.17l-.013.156c.135.07.265.151.405.207.354.14.702.308 1.07.395 4.083.971 7.992.474 11.516-1.803 2.221-1.435 4.521-1.707 7.013-1.336.252.038.503.083.756.107.234.022.479.255.795.003-2.179-1.574-4.526-2.096-7.094-1.872Zm-10.049-9.544c1.475.051 2.943-.142 4.486-1.059-.452.04-.643.04-.827.076-2.126.424-4.033-.04-5.733-1.383-.623-.493-1.257-.974-1.889-1.457-2.503-1.914-5.374-2.555-8.514-2.5.05.154.054.26.108.315 3.417 3.455 7.371 5.836 12.369 6.008Zm24.727 17.731c-2.114-2.097-4.952-2.367-7.578-.537 1.738.078 3.043.632 4.101 1.728.374.388.763.768 1.182 1.106 1.6 1.29 4.311 1.352 5.896.155-1.861-.726-1.861-.726-3.601-2.452Zm-21.058 16.06c-1.858-3.46-4.981-4.24-8.59-4.008a9.667 9.667 0 0 1 2.977 1.39c.84.586 1.547 1.311 2.243 2.055 1.38 1.473 3.534 2.376 4.962 2.07-.656-.412-1.238-.848-1.592-1.507Zm17.29-19.32c0-.023.001-.045.003-.068l-.006.006.006-.006-.036-.004.021.018.012.053Zm-20 14.744a7.61 7.61 0 0 0-.072-.041.127.127 0 0 0 .015.043c.005.008.038 0 .058-.002Zm-.072-.041-.008-.034-.008.01.008-.01-.022-.006.005.026.024.014Z"
            fill="#FD4F00"
          />
        </svg>
        <h1 class="text-brand mt-10 flex items-center text-sm font-semibold leading-6">
          Phoenix Framework
          <small class="bg-brand/5 text-[0.8125rem] ml-3 rounded-full px-2 font-medium leading-6">
            v<%= Application.spec(:phoenix, :vsn) %>
          </small>
        </h1>
        <p class="text-[2rem] mt-4 font-semibold leading-10 tracking-tighter text-zinc-900">
          Exemplo de Prompt com Phoenix e OpenAI
        </p>
        <p class="mt-4 text-base leading-7 text-zinc-600">
          Aprenda a criar prompts com OpenAI e Phoenix.
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
                          <div class="flex items-center justify-center h-10 w-10 rounded-full bg-indigo-500 flex-shrink-0">
                            A
                          </div>
                          <div class="relative ml-3 text-sm bg-white py-2 px-4 shadow rounded-xl w-full sm:w-auto">
                            <div><%= msg[:content] %></div>
                          </div>
                        </div>
                      </div>
                    <% else %>
                      <div class="col-start-1 col-end-13 sm:col-start-5 sm:col-end-13 p-3 rounded-lg sm:w-full">
                        <div class="flex items-center justify-start flex-row-reverse">
                          <div class="flex items-center justify-center h-10 w-10 rounded-full bg-indigo-500 flex-shrink-0">
                            Bot
                          </div>
                          <div class="relative mr-3 text-sm bg-indigo-100 py-2 px-4 shadow rounded-xl w-full sm:w-auto">
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
                      class="w-full border rounded-xl focus:outline-none focus:border-indigo-300 pl-4 h-10"
                    />
                  </form>
                </div>
              </div>
              <div class="flex-shrink-0 sm:ml-4">
                <button
                  type="submit"
                  form="chat-form"
                  phx-disable-with="Processando..."
                  class="flex items-center justify-center bg-indigo-500 hover:bg-indigo-600 rounded-xl text-white px-4 py-1"
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
        %{"msg" => msg},
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
