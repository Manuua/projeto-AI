defmodule App.Openai.ChatBot  do
  alias App.OpenAi.OpenaiService
  def execute(chat) do
    %{"message" => %{"content" => message}} = OpenaiService.chat_completion(
    [
      %{ role: "system", content: ""},
    ] ++ chat
    )

    message
  end
end
