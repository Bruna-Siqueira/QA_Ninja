describe "IDs Dinâmicos", :ids_dinamicos do
    before(:each) do
        visit "https://training-wheels-protocol.herokuapp.com/access"
    end

    it "cadastro" do
        find("input[id$=UsernameInput").set "Bruna"
        find("input[id^=PasswordInput").set "12345"
        find("a[id*=GetStartedButton]").click
        expect(page).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
        sleep 3
    end
end