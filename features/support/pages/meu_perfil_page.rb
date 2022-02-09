class MeuPerfilPage

    include Capybara::DSL
    def completa_cadastro(empresa, cargo)
        find("#profile-company").set empresa
        combo = find("select[name$=job]")
        combo.find("option", text: cargo).select_option
        click_button "Salvar"
    end

    def mensagem_atualizacao_cadastral
        find(".alert-login")
    end
end