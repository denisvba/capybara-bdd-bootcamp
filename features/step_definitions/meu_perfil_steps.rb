Dado("que eu autenticado com {string} e {string}") do |email, senha|
  visit("/")
  @login_page.login(email, senha)
end

Dado("acesso o meu perfil") do
  @aside.acessa_perfil
end

Quando("completo o meu cadastro com {string} e {string}") do |empresa, cargo|
    @meu_perfil_page.completa_cadastro(empresa, cargo)
end

Então("devo ver a mensagem de atualização cadastral:") do |mensagem_atualizacao|
    expect(@meu_perfil_page.mensagem_atualizacao_cadastral).to have_content mensagem_atualizacao
end

