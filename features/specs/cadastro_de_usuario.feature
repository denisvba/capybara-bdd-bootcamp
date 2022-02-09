#language:pt

Funcionalidade: Cadastro de usuário
    Para que eu possa acessar o sistema e cadastrar  minhas tarefas
    Sendo um usuário
    Quero criar o meu perfil com meu email e senha
    
    Contexto: Acessar a página de cadastro
    Dado que eu acesso a página de cadastro do usuário
    
    @cadastro
    Cenário: Cadastro de usuário
    Quando faço meu cadastro com meu nome, email e senha
    Então meu perfil é cadastrado com sucesso
    
    @tentativacadastro
    Esquema do Cenário: Tentativa de cadastro
    Quando faço meu cadastro com meu "<nome>", "<email>" e "<senha>"
    Então devo ver a seguinte "<mensagem>"
    
    Exemplos:
    | nome  | email           | senha  | mensagem                                   |
    |       | maria@maria.com | 123456 | Nome é obrigatório.                        |
    | Maria |                 | 123456 | Email é obrigatório.                       |
    | Maria | maria@maria.com |        | Informe uma senha.                         |
    | Maria | maria#maria.com | 123456 | Informe um email válido.                   |
    | Maria | maria@maria.com | 12345  | Sua senha deve ter pelo menos 6 caracteres |