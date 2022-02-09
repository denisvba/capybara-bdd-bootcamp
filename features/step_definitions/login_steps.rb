Dado("que eu acesso o sistema") do
  visit("/")
end

Quando("faço login com email e senha") do
  @login_page.login("denisvba@denisvba.net", "denisvba")
  sleep(5)
end

Então("vejo a mensagem de boas vindas") do
  expect(find("#task-board")).to have_content "Olá, Denis"
end


Quando("faço login com um {string} e {string}") do |email, senha|
  @login_page.login(email, senha)
end

Então("vejo o alerta de {string}") do |mensagem|
  expect(@login_page.login_alerta).to have_content mensagem
end

