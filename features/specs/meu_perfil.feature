#language:pt
Funcionalidade: Meu Perfil
    Para que eu possa manter meus dados atualizados
    Sendo um usuário
    Posso completar o meu cadastro do perfil.
    
    @meuperfil
    Esquema do Cenário: Atualizar perfil
    Dado que eu autenticado com "<email>" e "<senha>"
    E acesso o meu perfil
    Quando completo o meu cadastro com "<empresa>" e "<cargo>"
    Então devo ver a mensagem de atualização cadastral: 
    """
    Perfil atualizado com sucesso.
    """

    Exemplos:
    | email                     | senha      | empresa  | cargo      |
    | qa-denisvba@denisvba.net    | QAdenisvba  | Venturus | QA         |
    | dev-denisvba@denisvba.net   | DEVdenisvba | Facebook | Developer  |
    | cto-denisvba@denisvba.net   | CTOdenisvba | Google   | CTO        |