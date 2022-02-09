class CadastroUsuarioPage

    include Capybara::DSL
    def cadastro_de_usuario(nome, email, senha)
        find("#register_name").set nome
        find("#register_email").set email
        find("#register_password").set senha
        click_button "Cadastrar"
    end
    
    def mensagem_alerta
        find(".alert-message")
    end
end