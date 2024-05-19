defmodule App.OpenAi.OpenaiService do
  use HTTPoison.Base

  @api_key ""
  @base_url "https://api.openai.com/v1"
  @timeout 60_000

  def chat_completion(chat) do
    headers = %{
      "Authorization" => "Bearer #{@api_key}",
      "Content-Type" => "application/json"
    }

    body =
      %{
        "model" => "gpt-4",
        "messages" => chat,
        "temperature" => 0.7
      }
      |> Jason.encode!()

    case post("#{@base_url}/chat/completions", body, headers, recv_timeout: @timeout) do
      {:ok, %HTTPoison.Response{body: body}} ->
        body
        |> Jason.decode!()
        |> Map.get("choices")
        |> List.first()

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end
end
