defmodule App.Openai.ChatBotTest do
  use ExUnit.Case
  alias App.Openai.ChatBot

  describe "execute/1" do
    test "returns a string" do
      chat = [
        %{role: "user", content: "Hello!"}
      ]

      assert is_binary(ChatBot.execute(chat))
    end

    test "returns a non-empty string" do
      chat = [
        %{role: "user", content: "Hello!"}
      ]

      assert String.length(ChatBot.execute(chat)) > 0
    end
  end
end
