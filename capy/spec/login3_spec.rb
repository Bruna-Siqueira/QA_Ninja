describe "Login com Cadastro", :login3 do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/access"
  end

  it "login com sucesso 1" do
    # Modo 1
    #login_form = find("#login")
    #login_form.find("input[name=username]").set "stark"
    #login_form.find("input[name=password").set "jarvis!"
    #click_button "Entrar"

    # Modo 2 (melhor) estabelece um escopo na página e faz um find somente dentro desse escopo
    within("#login") do
      find("input[name=username]").set "stark"
      find("input[name=password").set "jarvis!"
      click_button "Entrar"
    end

    expect(find('#flash')).to have_content "Olá, Tony Stark. Você acessou a área logada!"
  end

  it "cadastro com sucesso" do
    within("#signup") do
      find("input[name=username]").set "Bruna"
      find("input[name=password").set "123456"
      click_link "Criar Conta"
      sleep 3
    end
    expect(page).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
  end
end
