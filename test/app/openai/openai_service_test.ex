defmodule App.Openai.OpenaiServiceTest do
  use ExUnit.Case
  alias App.OpenAi.OpenaiService

  describe "chat_completion/1" do
    test "returns a completion for chat messages" do
      chat = [
        %{role: "user", content: "Hello!"}
      ]

      assert %{"message" => %{"content" => _message}} = OpenaiService.chat_completion(chat)
    end
  end

  describe "completions/1" do
    test "returns a completion for a pront" do
      prompt = "The quick brown fox"

      assert %{"text" => _text} = OpenaiService.completions(prompt)
    end
  end
end
