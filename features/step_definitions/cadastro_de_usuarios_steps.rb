require "faker"

Dado("que eu acesso a página de cadastro do usuário") do
  visit("/")
  click_link "Clique aqui"
end

Quando("faço meu cadastro com meu nome, email e senha") do
  @nome = Faker::FunnyName.name
  @cadastro_de_usuario_page.cadastro_de_usuario(@nome,"#{Faker::Lorem.characters(number: 8)}@denisvba.com", "123456")
  sleep(5)
end

Então("meu perfil é cadastrado com sucesso") do
  expect(find("#task-board")).to have_content "Olá, #{@nome}"
end


Quando("faço meu cadastro com meu {string}, {string} e {string}") do |nome, email, senha|
  @cadastro_de_usuario_page.cadastro_de_usuario(nome, email, senha)
end

Então("devo ver a seguinte {string}") do |msgalerta|
  expect(@cadastro_de_usuario_page.mensagem_alerta).to have_content msgalerta
end

