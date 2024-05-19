defmodule App.Openai.OpenaiServiceTest do
  use ExUnit.Case
  alias App.OpenAi.OpenaiService

  describe "chat_completion/1" do
    test "returns a completion for chat messages" do
      chat = [
        %{role: "user", content: "Hello!"}
      ]

      assert %{"message" => %{"content" => message}} = OpenaiService.chat_completion(chat)
    end
  end
end
