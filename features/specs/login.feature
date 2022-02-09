#language:pt

Funcionalidade: Login
    Para que eu possa cadastrar e gerenciar minhas tarefas
    Sendo um usuário
    Posso acessar o sistema com email e senha previamente cadastrados.
    
    Contexto: Home
        Dado que eu acesso o sistema

    @login
    Cenário: Usuário autenticado
    Quando faço login com email e senha
    Então vejo a mensagem de boas vindas

    @tentativalogin
    Esquema do Cenário: Tentativa de login
    Quando faço login com um "<email>" e "<senha>"
    Então vejo o alerta de "<mensagem>"

    Exemplos:
    | email               | senha  | mensagem                   |
    | lorem@faker.net     | 123456 | Usuário não cadastrado.    |
    |                     | 123456 | Email incorreto ou ausente. |
    | lorem@faker.net     |        | Senha ausente.             |
    | denisvba@denisvba.net | 123456 | Senha inválida.            |
    | denisvba#denisvba.net | 123456 | Email incorreto ou ausente. |