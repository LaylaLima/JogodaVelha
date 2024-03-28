algoritmo "jogodavelha"

          procedimento preencherMatriz()
          inicio
                para l de 1 ate 3 faca
                     para c de 1 ate 3 faca
                          cont <- cont + 1
                          jogo[l,c] <- numpcarac(cont)
                     fimpara
                fimpara
         fimprocedimento
//-----------------------------------------------------------------
         procedimento velha()
         inicio
               escreval("====================")
               escreval("   JOGO DA VELHA    ")
               escreval("+-----+------+------")
               para l de 1 ate 3 faca
                    para c de 1 ate 3 faca
                       escreva("| ")
                       escreva(jogo[l,c]:4)
                    fimpara
                    escreva("| ")
                    escreval("")
                    escreval("+-----+------+------")
               fimpara
               escreval("====================")
         fimprocedimento
//-----------------------------------------------------------------
var
   l,c,cont : inteiro
   jogo : vetor[1...3,1...3] de caractere

inicio
cont <- 0
preencherMatriz()
velha()
fimalgoritmo