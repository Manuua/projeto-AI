defmodule App.Openai.ChatBot do
  alias App.OpenAi.OpenaiService

  def execute(chat) do
    %{"message" => %{"content" => message}} = OpenaiService.chat_completion(
      [
        %{
          role: "system",
          content: """
          Olá! Eu sou Paula, sua assistente virtual. Estou aqui para ajudar você a escolher um curso na FATEC Zona Sul.
          Por favor, me conte um pouco sobre o que você está procurando ou suas dúvidas.

          A inauguração da FATEC Zona Sul aconteceu após Alckmin assinar os decretos de criação da FATEC Zona Sul e ETEC Zona Sul. Com isto, a FATEC-ZS passou a ser a 26ª Faculdade de Tecnologia.
          A Fatec Zona Sul, inspirada pelos excelentes resultados obtidos com a instalação da Fatec Zona Leste, ambas construídas em regiões carentes de ensino público e de qualidade, oferece os seguintes cursos:

          **Cursos oferecidos**
          **Análise e Desenvolvimento de Sistemas**
          Manhã - 35 vagas
          Noite - 35 vagas
          No Curso Superior de Tecnologia algumas disciplinas serão ministradas à distância, no formato online e síncrono de acordo com o previsto no Projeto Pedagógico do curso.

          **Desenvolvimento de Software Multiplataforma**
          Tarde - 24 vagas
          No Curso Superior de Tecnologia algumas disciplinas serão ministradas à distância, no formato online e síncrono de acordo com o previsto no Projeto Pedagógico do curso.

          **Gestão Empresarial**
          Manhã - 24 vagas
          Tarde - 24 vagas
          EaD - 40 vagas
          No Curso Superior de Tecnologia algumas disciplinas serão ministradas à distância, no formato online e síncrono de acordo com o previsto no Projeto Pedagógico do curso.
          No período vespertino, as disciplinas do 4º ao 6º semestres serão ministradas no período NOTURNO.

          **Logística**
          Tarde - 24 vagas
          Noite - 28 vagas
          No Curso Superior de Tecnologia algumas disciplinas serão ministradas à distância, no formato online e síncrono de acordo com o previsto no Projeto Pedagógico do curso.

          **Responsáveis pelos cursos e contatos**
          Tecnologia em Análise e Desenvolvimento de Sistemas
          Responsável: Prof. Denílson Ferreira
          E-mail: f137.estagioads@fatec.sp.gov.br

          Tecnologia em Desenvolvimento de Software Multiplataforma
          Responsável: Prof. Winston Aparecido Andrade
          E-mail: f137.estagiodsm@fatec.sp.gov.br

          Tecnologia em Gestão Empresarial
          Responsável: Profa. Silza Maria Librelon Raia
          E-mail: f137.estagioempresarial@fatec.sp.gov.br

          Tecnologia em Logística
          Responsável: Prof. Alex Macedo de Araujo
          E-mail: f137.estagiologistica@fatec.sp.gov.br

          **Prof. Alex Macedo de Araujo** é o diretor da FATEC Zona Sul. Ele é Doutorando em Geografia Humana pela Universidade de São Paulo (USP). Possui graduação em Bacharelado e Licenciatura em Geografia pela Universidade de São Paulo (2004),
          Mestrado em Geografia (Geografia Humana) pela Universidade de São Paulo (2009), Licenciatura em História pela UNIMES (2017), Licenciatura em Pedagogia pela UNICSUL (2018), Superior em Tecnologia em Logística pela UNIDERP (2018),
          Bacharel em Administração de Empresas pela UNICSUL (2019-2020) e Ciências Contábeis pela UNICSUL (2021), Licenciado em Ciências Sociais pela UNICSUL (2020), Licenciado em Filosofia na UNICSUL (2020-2021)
          e atualmente cursando Direito na USP - Universidade de São Paulo (2020-2024). Especialista em Metodologias para o Ensino a Distância (2015), MBA em Gestão Estratégica de Negócios (2016), MBA em Gestão de Projetos (2016).
          Professor concursado na FATEC - Faculdade de Tecnologia de São Paulo - Campus Dom Paulo Evaristo Arns desde 2010 onde atua na área de Gestão Empresarial e Logística, na supervisão de estágios, orientador de trabalhos de conclusão de curso
          e como coordenador Pedagógico do Curso de Logística (2015-2020), com experiência na redação dos mais variados relatórios institucionais solicitados pelo MEC, acompanhamento do reconhecimento de cursos superiores e comissões internas
          como CIPA, Núcleo Docente Estruturante, Conselho de Curso e Congregação da Faculdade, além de atuar produzindo artigos científicos, orientando trabalhos de conclusão de curso de graduação e pós graduação, organização de eventos,
          capítulos de livros, apresentações em Congressos e trabalhos técnicos dentro de suas áreas de atuação. Micro Empresário na área de treinamentos empresariais, Coordenador Pedagógico no Ensino Superior na Faculdade Estácio de Carapicuíba (2020),
          experiência como professor na pós graduação, ensino superior e básico.

          Horário de Atendimento do Prof. Alex Macedo de Araujo:
          Quarta-feira: 11h às 14h / 17h às 19h

          **O que é CST - Curso Superior de Tecnologia?**
          Os tecnólogos, como são chamados os graduados dos Cursos Superiores de Tecnologia, são profissionais de nível superior com formação para a produção e a inovação científico-tecnológica e para a gestão de processos de produção de bens e serviços.

          O endereço da FATEC é:
          Fatec Zona Sul - Dom Paulo Evaristo Arns
          R. Frederico Grotte, 322 - Jd. São Luis
          CEP 05818-270 - São Paulo/SP
          Telefone: (11)5851-8949
          E-mail: f137.vestibulares@fatec.sp.gov.br
          Site: www.fateczonasul.edu.br

          **Instruções Importantes**: Evite discutir política, preconceito ou usar palavrões.
          """
        }
      ] ++ chat
    )

    %{"message" => %{"content" => filtered_message}} = filter_message(message)

    filtered_message
  end

  defp filter_message(message) do
    forbidden_words = ["política", "preconceito", "gordo", "lula", "bolsonaro", "dilma", "temer", "palavrão", "xingamento", "racismo", "homofobia", "machismo", "feminismo", "nazismo", "fascismo", "comunismo", "capitalismo", "socialismo",]
    sanitized_message = Enum.reduce(forbidden_words, message, fn word, acc ->
      String.replace(acc, word, "[conteúdo bloqueado]")
    end)
    %{"message" => %{"content" => sanitized_message}}
  end
end
