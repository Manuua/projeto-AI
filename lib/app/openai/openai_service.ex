defmodule App.OpenAi.OpenaiService do
  use HTTPoison.Base

  @api_key ""
  @base_url "https://api.openai.com/v1"
  @timeout 60_000
  @max_response_length 350  # Define o limite máximo de caracteres da resposta

  def chat_completion(chat) do
    headers = %{
      "Authorization" => "Bearer #{@api_key}",
      "Content-Type" => "application/json"
    }

    body =
      %{
        "model" => "gpt-4",
        "messages" => chat,
        "temperature" => 0.7,
        "max_tokens" => @max_response_length  # Limita o número de tokens gerados
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

  @spec completions(any()) :: any()
  def completions(prompt) do
    headers = %{
      "Authorization" => "Bearer #{@api_key}",
      "Content-Type" => "application/json"
    }

    body =
      %{
        "model" => "gpt-3.5-turbo-instruct",
        "prompt" => prompt,
        "temperature" => 0.7,
        "max_tokens" => @max_response_length  # Limita o número de tokens gerados
      }
      |> Jason.encode!()

      case post("#{@base_url}/completions", body, headers, recv_timeout: @timeout) do
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
