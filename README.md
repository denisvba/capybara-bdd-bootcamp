# Material from Venturus Bootcamp training in 2019
## Web automation testing with Ruby, Cucumber, Capybara, RSpec, and Selenium WebDriver

- Just porting from previous internal git, no updates since 2019, except for mass change of unecessary IPs and access info.
- Most of it is in ptBR
- To be revisited sometime in the near future.

------------------------------------------------------------------


Run: $ bundle init

Edit your newly created "Gemfile" file with your requirements (delete anything else):

# frozen_string_literal: true

source "https://rubygems.org"
{code}
gem "capybara"
gem "cucumber"
gem "rspec"
gem "selenium-webdriver"
{code}

Save and run: $ bundle install

Edit your newly created "env.rb" with:

{code}
require "capybara/cucumber"
require "selenium-webdriver"

Capybara.configure do |config|
    config.default_driver = :selenium_chrome_headless
    config.app_host = "http://localhost:30100/" # add here proper IP
end
{code}
use your own host link, if available.

Then, save and run: $ cucumber --init

Create a new folder named "specs" inside "features".
Create a new file, with a name like "Cadastro de usuário.feature"

To change supported Gherkin languages, start the file with {{#language:pt}} where pt is the lang code.
The basic format is:

{code}
Feature:<Feature name>
    <feature description>

    Context:<Context name> # recurrent action or pre-requisite (Given)
        Given <given expected origin description>
    Scenario:<scenario name>
    When <when condition description>
    Then <then expected result>

    Scenario outline: <outline name> # to execute series of similar actions
    When <when condition description with blank spot >
    Then <then expected result>

    Exemplos: # each missing or wrong at some point
    |nome|email|senha|mensagem|
    ||maria@maria.com.br|123456|Nome é obrigatório.|
    |Maria||123456|Email é obrigatório.|
    |Maria|maria@maria.com.br||Informar uma senha.|
    |Maria|maria#maria.com.br|123456|Informe um email váido.|
    |Maria|maria@maria.com.br|12345|Sua senha deve ter pelo menos 6 caracteres|

{code}

Run $ cucumber
and copy the steps output to a new file, "cadastro_de_usuario_steps.rb" under step_definitions

Create a folder named "pages" under "support". Then create a file "cadastro_de_usuarios_page.rb" inside this new folder.

Since we are using capybara, start the file with:

{code}
class CadastroUsuarioPage

    include Capybara::DSL
    def cadastro_de_usuario(nome, email, senha) # this is a new method
    find("#register_name").set nome
    find("#register_email").set email
    find("#register_password").set senha
    click_button "Cadastrar"
{code}

Find in the Chrome console if the id is visible: $("#register_name");

add {{gem "faker"}} to the Gemfile and run bundle install again

Create a file "hooks.rb" under support.
add the following lines to it:
{code}
Before do
    @cadastro_de_usuario_page = CadastroUsuarioPage.new
end
{code}
This initializes an object pointing to "cadastro_de_usuarios_page.rb" file

Refactor the "cadastro_de_usuarios_steps.rb" with:
{code}
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
{code}

Great!! This is our first test running.

You can watch it run if you erase the "_headless" from this line {{config.default_driver = :selenium_chrome}} in the env.rb file.

The test is using Faker to generate name and strings. 
When you call for @nome, it calls for the object we defined in the  hooks.rb. 
Using "#{Faker::Lorem.characters(number: 8)}@denisvba.com" we concatenate the Faker generated string to @denisvba.com.

To set a default timeout to Capybara, add to the env.rb:
{{Capybara.default_max_wait_time = 5}}

Append to cadastro_de_usuario_page.rb:
{code}

    def mensagem_alerta
        find(".alert-message")
    end
{code}

Make sure any strings used in the Cadastro de usuario.feature are correct for the expected results.

Now replace the last lines the cadastro_de_usuario_steps.rb:
{code}
Quando("faço meu cadastro com meu {string}, {string} e {string}") do |nome, email, senha|
  @cadastro_de_usuario_page.cadastro_de_usuario(nome, email, senha)
end

Então("devo ver a seguinte {string}") do |msgalerta|
  expect(@cadastro_de_usuario_page.mensagem_alerta).to have_content msgalerta
end
{code}