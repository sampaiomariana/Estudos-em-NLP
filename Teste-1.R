library(syuzhet)
library(stringr)

texto <- c("A caminho da Base de Alcântara com a comitiva de parlamentares e ministros, acompanhando o Presidente Jair Bolsonaro. Onde, logo mais, participaremos da celebração dos 27 anos da Agência Espacial Brasileira. 
Devido ao Covid, o evento será em sua maioria transmitido virtualmente.
           Viagem para a Base de Alcântara no Maranhão. Agenda muito importante com o Presidente @jairbolsonaro, Ministro @Astro_Pontes, Secretário Especial @mfriasoficial e da equipe excepcional da Agência Espacial Brasileira ( @espacial_aeb ). Até daqui a pouco! 
           @thiagomcosta8 Nada, foi a AEB, lançamento ocorreu em Alcântara.
           O foguete é movido a leite condensado? Se for tem chance, caso contrário, #ESQUECEALCANTARA 
NÃO!!! Aqui é Brasil!!! Não conseguimos fazer uma fucking Copa do Mundo, algo que dominamos faz 100 anos, sem roubar muito, foguete que é algo que nem temos noção, não vai pra frente!!! #ESQUECEALCANTARA ")


sentimento <- get_nrc_sentiment(texto,language = "portuguese", lowercase = TRUE )

sentimento

op <- par(oma=c(5,7,1,1))
par(op)


barplot(colSums(sentimento),las = 3, ylab = "Quantidade", main = "Sentimento")

sentimento

sentimento$negative

#Separando em senteças
sent <- get_sentences(texto, fix_curly_quotes = TRUE, as_vector = TRUE)
sent

sentimentos <- get_sentiment(
  sent,
  method = "syuzhet",
  path_to_tagger = NULL,
  cl = NULL,
  language = "portuguese",
  lexicon = TRUE,
  regex = "[^A-Za-z´]+",
  lowercase = TRUE
)
sentimentos

get_sentiment_dictionary(dictionary = "syuzhet", language = "portuguese")

#Separando os termos em tokens 

token <- get_tokens(texto,pattern = "\\W", lowercase = TRUE)
token

#Stopwords utilizando a nltk

stopwords::data_stopwords_nltk$pt
