package com.univille.api.shopplusai.ai.feeling;

import com.univille.api.shopplusai.ai.chatbot.ChatMessage;
import com.univille.api.shopplusai.domain.avaliacao.Avaliacao;
import com.univille.api.shopplusai.domain.produto.Produto;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class FeelingPromptBuilder {

    public String systemPrompt(){
        return """
                Você é uma IA especializada em Análise de Dados e Processamento de Linguagem Natural (PNL), 
                atuando no backend de um e-commerce. Sua tarefa é receber um conjunto de dados brutos (que enviarei na sequência) 
                contendo informações do banco de dados e gerar um JSON estruturado e agregador para alimentar um dashboard 
                construído em React/Tailwind. 
                
                ### ESTRUTURA DOS DADOS DE ENTRADA (Referência) 
                - Produto: { id, nome, categoria, preco } 
                - Categoria: { id, nome } 
                - Avaliacao: { id, usuario_id, produto_id, comentario, data_iso } 
                - Usuario: { id, nome, email } 
                
                ### REGRAS DE ANÁLISE E NEGÓCIO 
                1. Análise de Sentimento: - Leia cada comentario e classifique-o estritamente como: "positivo", "neutro" ou "negativo". 
                - Atribua uma nota individual para cada avaliação com base no sentimento: 1 = muito negativo, 2 = negativo, 3 = neutro, 4 = positivo, 5 = muito positivo. 
                - Calcule a mediaSentimento global fazendo a média aritmética dessas notas. 
                
                2. Extração de Aspectos: Identifique menções aos seguintes aspectos nos comentários e defina o sentimento predominante associado a cada um: 
                - "Entrega" → termos relacionados a atrasos, envio, frete, transporte, prazo. 
                - "Qualidade" → termos relacionados a durabilidade, material, defeito, funcionamento, acabamento. 
                - "Preco" → termos relacionados a custo-benefício, caro, barato, valor. 
                - "Atendimento" → termos relacionados a suporte, devolução, comunicação, SAC, vendedor. 
                
                3. Agregação Temporal: - Agrupe a contagem de sentimentos pelo mês/ano extraído do campo data das avaliações. 
                
                4. Destaques (Melhor e Pior): - "Melhor Produto": O produto com a maior média de notas. Em caso de empate, use o que tem mais avaliações positivas. 
                - "Pior Produto": O produto com a menor média de notas. Em caso de empate, use o que tem mais avaliações negativas. - Selecione o comentário que melhor justifica a nota do produto como comentarioDestaque. 
                
                ### RESTRIÇÕES CRÍTICAS DE SAÍDA 
                - RETORNE APENAS JSON VÁLIDO. 
                - NÃO envolva o JSON em blocos de código markdown (como json ou  transformadas em um fluxo de raciocínio lógico (Extrair > Classificar > Agregar > Formatar), o que reduz alucinações.
                
                3. **Bloqueio de Markdown:** Instruções mais rígidas para evitar que a IA adicione blocos de formatação (como
                ). - NÃO adicione nenhuma explicação, cumprimento, ou texto antes ou depois do JSON. - Certifique-se de que todas as aspas estão corretamente escapadas para não quebrar o JSON.parse(). 
                
                ### FORMATO DE SAÍDA ESPERADO (Template) { "resumo": { "descricao": "Resumo analítico gerado pela IA (máx 2 frases) sobre o padrão geral das avaliações." }, "sentimentChart": [ { "positive": 0, "neutral": 0, "negative": 0 } ], "mediaSentimento": { "nota": 0.0 }, "melhorProduto": { "nome": "Nome do Produto", "categoria": "Nome da Categoria", "sentimento": "positivo", "media": 0.0, "comentarioDestaque": "Texto do comentário selecionado." }, "piorProduto": { "nome": "Nome do Produto", "categoria": "Nome da Categoria", "sentimento": "negativo", "media": 0.0, "comentarioDestaque": "Texto do comentário selecionado." }, "aspectos": [ { "aspecto": "Entrega", "sentimento": "Positivo/Neutro/Negativo" }, { "aspecto": "Qualidade", "sentimento": "Positivo/Neutro/Negativo" }, { "aspecto": "Preco", "sentimento": "Positivo/Neutro/Negativo" }, { "aspecto": "Atendimento", "sentimento": "Positivo/Neutro/Negativo" } ] }
                """;
    }

    public String contextPrompt(List<Avaliacao> avaliacoes, List<Produto> produtos){

        String promptProdutos = produtos.stream()
                .map(produto -> """
                {
                  "id": %d,
                  "nome": "%s",
                  "categoria": "%s",
                  "preco": %.2f
                }
                """.formatted(
                        produto.getId(),
                        produto.getNome(),
                        produto.getCategoria().getNome(),
                        produto.getPreco()
                ))
                .collect(Collectors.joining(",\n"));

        String promptAvaliacoes = avaliacoes.stream()
                .map(avaliacao -> """
                {
                  "id": %d,
                  "produtoId": %d,
                  "produtoNome": "%s",
                  "comentario": "%s",
                  "data": "%s"
                }
                """.formatted(
                        avaliacao.getId(),
                        avaliacao.getProduto().getId(),
                        avaliacao.getProduto().getNome(),
                        avaliacao.getComentario(),
                        avaliacao.getData()
                ))
                .collect(Collectors.joining(",\n"));

        return """
        {
            "produtos": [
              %s
            ],
            "avaliacoes": [
              %s
            ]
        }
        """.formatted(
                promptProdutos,
                promptAvaliacoes
        );
    }

}
