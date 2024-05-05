defmodule App.Openai.ChatBotTest do
  use ExUnit.Case, async: true

  alias App.Openai.ChatBot

describe "execute/1" do
    test "returns a response" do
      chat = [
        %{role: "user", content: "Hello"},
        %{role: "assistant", content: "Hello! How can I help you?"}
      ]

      assert is_binary(ChatBot.execute(chat))
    end

  test "return a non-empty response" do
      chat = [
        %{role: "user", content: "Hello"},
      ]

      assert String.length(ChatBot.execute(chat)) > 0
    end
end
end
