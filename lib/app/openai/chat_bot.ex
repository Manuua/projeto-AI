defmodule App.Openai.ChatBot do
  alias App.OpenAi.OpenaiService

  def execute(chat) do
    # Mensagem inicial do sistema
    system_message = %{
      role: "system",
      content: """
      Olá! Eu sou Paula, sua assistente virtual. Estou aqui para ajudar você a escolher um curso na FATEC Zona Sul.
      Por favor, me conte um pouco sobre o que você está procurando ou suas dúvidas.
      O endereço da fatec é
      Fatec Zona Sul - Dom Paulo Evaristo Arns
      R. Frederico Grotte, 322 - Jd. São Luis
      CEP 05818-270 - São Paulo/SP
      Telefone: (11)5851-8949
      E-mail: f137.vestibulares@fatec.sp.gov.br
      Site: www.fateczonasul.edu.br
      """
    }

    # Concatena a mensagem inicial com as mensagens recebidas do usuário
    chat_with_system_message = [system_message | chat]

    # Chama o serviço OpenAI para obter a resposta
    %{"message" => %{"content" => message}} = OpenaiService.chat_completion(chat_with_system_message)

    # Filtra a mensagem para remover palavrões e conteúdo indesejado
    filtered_message = filter_message(message)

    # Verifica se a mensagem contém a pergunta sobre os cursos
    if contains_course_inquiry?(filtered_message) do
      # Responde com os cursos oferecidos
      response = courses_summary()

      response_as_list = [response]

      # Concatena a resposta com a mensagem inicial do sistema
      final_response = [system_message | response_as_list]
      # Retorna a mensagem final
      final_response
    else
      filtered_message
    end
  end

    def get_fatec_address do
      """
      Fatec Zona Sul - Dom Paulo Evaristo Arns
      R. Frederico Grotte, 322 - Jd. São Luis
      CEP 05818-270 - São Paulo/SP
      """
    end


  # Função para filtrar mensagens indesejadas
  defp filter_message(message) do
    # Verifica se a mensagem contém palavrões ou conteúdo inadequado
    if contains_inappropriate_content?(message) do
      "Desculpe, não posso discutir esse assunto."

    else
      message
    end
  end

  # Função para verificar se a mensagem contém uma pergunta sobre os cursos
  defp contains_course_inquiry?(message) do
    # Lista de padrões que indicam uma pergunta sobre cursos
    course_inquiry_patterns = ["cursos", "opções de curso", "curso oferecido"]

    # Verifica se a mensagem contém algum dos padrões de pergunta sobre cursos
    Enum.any?(course_inquiry_patterns, fn pattern -> String.contains?(String.downcase(message), pattern) end)
  end


  # Função para verificar se a mensagem contém palavrões ou conteúdo inadequado
  defp contains_inappropriate_content?(message) do
    # Lista de palavras ou padrões inadequados (pode ser expandida conforme necessário)
    inappropriate_words = ["política", "política", "palavrão", "discurso ofensivo", "conteúdo inadequado", "presidente", "governo", "partido político", "lula", "bolsonaro", "PT", "filho da puta",
    "fdp", "viado", "bicha", "gay", "preto", "racismo","assédio", "gostosa", ]

    # Converte a mensagem para letras minúsculas para tornar a comparação insensível a maiúsculas/minúsculas
    lowercase_message = String.downcase(message)

    # Verifica se a mensagem contém alguma palavra inadequada
    Enum.any?(inappropriate_words, fn word -> String.contains?(lowercase_message, word) end)
  end
  # Função para retornar um resumo dos cursos oferecidos pela FATEC Zona Sul
  defp courses_summary do
    """
    Cursos oferecidos na FATEC Zona Sul:
    - Análise e Desenvolvimento de Sistemas
      - Manhã: 35 vagas
      - Noite: 35 vagas

    - Desenvolvimento de Software Multiplataforma
      - Tarde: 24 vagas

    - Gestão Empresarial
      - Manhã: 24 vagas
      - Tarde: 24 vagas
      - EaD: 40 vagas

    - Logística
      - Tarde: 24 vagas
      - Noite: 28 vagas
    """
  end
end
