
Nome: Jdunaide Ernesto
Histórias de usuário (Gherkin)

Feature: Configuração de produto na EBAC-SHOP

  Scenario Outline: Seleção de cor, tamanho e quantidade de um produto
    Given que estou na página de um produto na EBAC-SHOP
     When  seleciono a cor "<cor>", o tamanho "<tamanho>" e a quantidade "<quantidade>"
    Then vejo a seleção de cor, tamanho e quantidade refletidas no produto.

  Scenario: Seleção de cor, tamanho e quantidade obrigatórias
    Given que estou na página de um produto na EBAC-SHOP
    When não seleciono a cor, o tamanho e/ou a quantidade
    Then vejo uma mensagem de erro indicando que a seleção é obrigatória

  Scenario: Limite de 10 produtos por venda
    Given que estou na página de um produto na EBAC-SHOP
    When tento adicionar mais de 10 produtos ao carrinho
    Then vejo uma mensagem de erro indicando que excedi o limite de produtos por venda

  Scenario: Limpar seleção de cor, tamanho e quantidade
    Given que selecionei a cor, o tamanho e a quantidade de um produto
    When clico no botão "Limpar"
    Then a seleção de cor, tamanho e quantidade é reiniciada ao estado original

    Examples:
Cor:	  Tamanho	 Quantidade	        Resultado
Preta  |	XL	        05	             Inserir produto no carrinho
Azul   |    L	        11	             Limite excedido
Azul   |    -	        02	             Seleção obrigatória de todos campos
 -	   |    43          08	             Seleção obrigatória de todos campos
Branca |    20	        10	             Inserir produto no carrinho



Feature: Login na EBAC-SHOP

Scenario Outline: Login com dados válidos
    Given que estou na página de login da EBAC-SHOP
    When insiro um usuário "<usuario>" e senha "<senha>" válidos
    Then devo ser direcionado para a tela de checkout
    And devo visualizar os meus pedidos

    Examples:
    Usuário 	    Senha	            Mensagem
|Jose Antônio 	   |Jose123	           |Log in feito com sucesso
|Morgan Freeman	   |Morgan123	       |Log in feito com sucesso
|Jessica Antunes   |Jessica123	       |Log in feito com sucesso


Scenario Outline: Login com dados inválidos
    Given que estou na página de login da EBAC-SHOP
    When insiro um <usuário> ou <senha> inválidos
    Then devo ver a mensagem de alerta "Usuário ou senha inválidos"

    Examples: 
Usuário 	      Senha	                      Mensagem
|Joao Lote	     |Artur01	           |Usuário ou senha inválidos 
|Mia Alfredo	 |Morgan123	           |Usuário ou senha inválidos 
|Morgan Freeman	 |Jose123	           |Usuário ou senha inválidos 

s


Feature: Conclusão do cadastro na EBAC-SHOP

  Scenario: Cadastro com todos os dados obrigatórios
    Given que estou na página de cadastro da EBAC-SHOP
    And preencho todos os campos obrigatórios marcados com asteriscos
    When confirmo o cadastro
    Then meu cadastro é concluído e posso finalizar minha compra

    Examples:
Usuário 	           Senha	                      Email	                        Resultado
|Jose Antônio	      |Jose123	             |joao@gmail.com                     |Finalizar compra
|Morgan Freeman	      |Morgan123	         |morgan@gmail.com                   |Finalizar compra
|Artur Melo	          |Artur01	             |artur@gmail.com                    |Finalizar compra
|Jessica Antunes	  |Jessica123	         |jessica@yahoo.com                  |Finalizar compra
|Joao Lote	          |Joao01	             |joao01@gmail.com                   |Finalizar compra


  Scenario: Cadastro com e-mail em formato inválido
    Given que estou na página de cadastro da EBAC-SHOP
    And insiro um e-mail inválido no campo de e-mail
    When tento confirmar o cadastro
    Then devo ver uma mensagem de erro indicando que o e-mail está em formato inválido

    Examples:
    Usuário 	               Senha	                  Email	                           Resultado
|Jose Antônio	             |Jose123	           |joao@com                       |Formato de email inválido 
|Morgan Freeman	             |Morgan123	           |morgan@gmail.com               |Cadastro feito com sucesso
|Artur Melo	                 |Artur01	           |artur@gmail.com                |Cadastro feito com sucesso
|Soraia de Assis	         |Soraia123	           |soraia0@yahoo.com              |Formato de email inválido
|Jessica Antunes	         Jessica123	           |jessica@yahoo.com              |Formato de email inválido
|Joao Lote	                 |Joao01	           |joao01@gmail.com               |Formato de email inválido
|Mia Alfredo	             |Mia1234	           |mia@yahoo.com                  |Cadastro feito com sucesso


  Scenario: Cadastro com campos vazios
    Given que estou na página de cadastro da EBAC-SHOP
    And deixo algum campo obrigatório em branco
    When tento confirmar o cadastro
    Then devo ver uma mensagem de alerta indicando os campos em branco

    Examples:
    Usuário 	    Senha	             Email	               Resultado
Jose Antônio		  ---               joao@gmail.com         Atenção: Campo de senha branco
Morgan Freeman	    Morgan123		      ---                  Atenção: Campo de e-mail em branco
Artur Melo		       -                artur@gmail.com        Atenção: Campo de senha branco
     ---            Soraia123	        soraia0@yahoo.com      Atenção: Campo de usuário em branco
Jessica Antunes		      ---           jessica@yahoo.com      Atenção: Campo de senha branco











