class LoginPage

    include Capybara::DSL
    def login(email, senha)
        find("#login_email").set email
        find("#login_password").set senha
        click_button "Login"
    end
    
    def login_alerta
        find(".alert-login")
    end
end