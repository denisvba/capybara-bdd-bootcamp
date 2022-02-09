class MenuLateral

    include Capybara::DSL
    def acessa_perfil
        within("aside[class=navigation") do
            click_link "Perfil"
        end 
    end
end