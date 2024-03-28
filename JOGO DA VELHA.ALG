algoritmo "Jogo da velha"

//-------------------------------------------------------------
Procedimento preencherMatriz()
Inicio
   cont <- 0
   Para i de 1 ate 3 faca
      Para j de 1 ate 3 faca
         cont <- cont + 1
         jogo[i,j] <- numpcarac(cont)
      FimPara
   FimPara
FimProcedimento
//--------------------------------------------------------------
Procedimento  tabela()
Inicio
   Escreval("=======================")
   Escreval("   JOGO DA VELHA")
   Escreval("Produzido pela Equipe 4")
   Escreval("da turma de front-end")
   Escreval("=======================")
   Escreval("+-----+-----+-----+")
   Para i de 1 ate 3 faca
      Para j de 1 ate 3 faca
         Escreva("| ")
         Escreva(jogo[i,j]:4)
      FimPara
      Escreva("| ")
      Escreval()
      Escreval("+-----+-----+-----+")
   FimPara
   Escreval("====================")
FimProcedimento
//------------------------------------------------------------
Procedimento jogar()
Inicio

   x <- "X"
   vencedor <- falso
   vez <- 0
   jogada <- 1
   fimJogada <- 0

   //Início da função, verifica se o valor está entre 1 e 9
   //e informa para o jogador

   Repita

      Escreval("Digite [0] para retornar ao MENU DE OPÇÕES ")
      Se (x = "X") entao
         Escreva("")
         Escreva(nomex,", digite um numero para ",x, ": ")
      Senao
         Escreva(nomeO,", digite um numero para ",x, ": ")
      FimSe
      Leia(op)
      // Caso digite o 0 voltará ao menu principal
      Se (op = 0)entao
         interrompa
      FimSe

      Se (op > 0) e (op < 10) entao

         //Verifica se está entre 1 e 3
         Se (op > 0) e (op < 4) entao
            L <- 1
            Se (jogo[L,op] = "X") ou (jogo[L,op] = "O") entao
               Escreval("Local já preenchido")
               Escreval("Aperte enter e escolha outra opção")
               Leia(a)
            Senao
               jogo[L,op] <- x
               codRepetido()
            FimSe
         Senao
            //Verifica se está entre 3 e 6
            Se (op > 3) e (op < 7) entao
               L <- 2
               Se (jogo[L,op - 3] = "X") ou (jogo[L,op - 3] = "O") entao
                  Escreval("Local já preenchido")
                  Escreval("Aperte enter e escolha outra opção")
                  Leia(a)
               Senao
                  jogo[L,op - 3] <- x
                  codRepetido()
               FimSe
               //Verifica se está entre 7 e 9
            Senao
               L <- 3
               Se (jogo[L,op - 6] = "X") ou (jogo[L,op - 6] = "O") entao
                  Escreval("Local já preenchido")
                  Escreval("Aperte enter e escolha outra opção")
                  Leia(a)
               Senao
                  jogo[L,op - 6] <- x
                  codRepetido()
               FimSe

            FimSe
         FimSe
         // Caso seja digitado algum valor fora de 1 a 9 ou 0 para
         //voltar ao menu inicial
      Senao
         Escreval("Opção inválida")
         Escreval("Aperte enter para continuar")
         Leia(a)
      FimSe
      Limpatela

      // verifica se existe um vencedor e soma no placar
      tabela()
   Ate(vencedor = verdadeiro) ou (vez = 9)

   Se(vencedor = verdadeiro) entao
      Se (x = "O") entao
         pontO <- pontO + 1
      Senao
         pontX <- pontX + 1
      FimSe
      Limpatela
      Se (x = "X") e (vencedor) entao
      MudaCor("Verde","Frente")
      EscrevaL("Jogador ", nomeX, " venceu!")
   Senao
   MudaCor("Verde","Frente")
   EscrevaL("Jogador ", nomeO, " venceu!")
FimSe
Escreval()
Escreval()
Senao
   Limpatela
   Escreval("Ninguém Ganhou")
   Escreval()
   Escreval()
FimSe


FimProcedimento
//-----------------------------------------------------------
Procedimento codRepetido()
Inicio
   vencedor <- verificarVencedor()
   vez <- vez + 1
   Se(vencedor = falso) entao
      Se (jogada % 2 <> 0) entao //determina a vez de cada jogador
         X <- "O"
      Senao
         X <- "X"
      FimSe
      jogada <- jogada + 1
   FimSe

FimProcedimento
//------------------------------------------------------------
funcao verificarVencedor() : logico
var
   venceu : logico
inicio
   venceu <- falso
   para i de 1 ate 3 faca   //verificar horizontal
      se ((jogo[i,1] = jogo[i,2]) e (jogo[i,2] = jogo[i,3])) entao
         venceu <- verdadeiro
      fimse
   fimpara
   para i de 1 ate 3 faca   //verificar vertical
      se (jogo[1,i] = jogo[2,i]) e (jogo[2,i] = jogo[3,i]) entao
         venceu <- verdadeiro
      fimse
   fimpara
   se (jogo[1,1] = jogo[2,2]) e (jogo[2,2] = jogo[3,3]) entao
      venceu <- verdadeiro
   fimse
   se (jogo[1,3] = jogo[2,2]) e(jogo[2,2] = jogo[3,1])entao
      venceu <- verdadeiro
   fimse
   retorne venceu
fimfuncao
//---------------------------------------------------------
Procedimento escolhernome
Inicio
   Escreval("Digite o nome do jogador X: ")
   Leia(nomeX)
   Escreval("Digite o nome do jogador O: ")
   Leia(nomeO)
   Limpatela

FimProcedimento
//----------------------------------------------------------
Procedimento trocarCor
Inicio
   Se (cor = 1) entao
   MudaCor("Preto","Frente")
MudaCor("Branco","Fundos")
Senao
MudaCor("Branco","Frente")
MudaCor("Preto","Fundos")
FimSe
FimProcedimento
//----------------------------------------------------------
var
   y ,cont, i, j, L, op, vez, jogada, quantvenc, n, fimJogada, pontX, pontO, cor: inteiro
   jogo: vetor[1..3, 1..3] de caractere
   x, a: caractere // guarda X e O
   vencedor: logico
   nomeX, nomeO: caractere

inicio

   Escreval("-----------------------COMO JOGAR-----------------------")
   Escreval("|Aqui temos um jogo da velha, cada coluna e linha tem |")
   Escreval("|número de 1 a 9, você digita o número que está dentro|")
   Escreval("|do quadrado que você for colocar a sua vez da partida|")
   Escreva("--------------------------------------------------------")

   Repita

      Escreval()
      Escreval()
      Escreval("----------------------------")
      Escreval("       MENU DE OPÇÕES")
      Escreval("----------------------------")
      Escreval("[1] JOGAR / JOGAR NOVAMENTE")
      Escreval("[2] VER O PLACAR")
      Escreval("[3] MUDAR O TEMA")
      Escreval("[4] TROCAR O NOME DO JOGADOR")
      Escreval("[5] SAIR")
      Escreva("OPÇÃO ESCOLHIDA: ")
      Leia(n)
      LimpaTela

Escolha n

      Caso 1
      MudaCor("Branco","Frente")

      Se (nomeX = "") e (nomeO = "") entao
         escolhernome()
      FimSe
      preencherMatriz()
      tabela()
      jogar()


      Caso 2
           MudaCor("Branco","Frente")
           Escreval(nomeX, " X " ,PontX, " VS" ,PontO, " O", nomeO)
           Escreval()

      Caso 3
           Escreva("Escolha [1] para tema claro e [2] para escuro: ")
           Leia(cor)

           trocarCor()


      Caso 4
           MudaCor("Branco","Frente")
           escolhernome()


FimEscolha
Ate (n = 5)

fimalgoritmo
