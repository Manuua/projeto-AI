defmodule App.OpenAi.OpenaiService do
  def chat_completion(_chat) do
    %{"message" => %{"content" => "Hello! How can I help you?"}}
  end
end
