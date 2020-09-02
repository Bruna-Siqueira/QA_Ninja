describe "Tabelas", :tabs do
    before(:each) do
        visit "https://training-wheels-protocol.herokuapp.com/tables"
    end

    it "deve exibir o salário do Stark" do
        atores = all("table tbody tr")
        # Vai iterar entre todas os elementos tr e vai retornar apenas o elemento do Robert Downey Jr
        stark = atores.detect { |ator| ator.text.include?("Robert Downey Jr") }
        expect(stark.text).to include "10.000.000"
    end

    it "deve exibir o salário do Vin Diesel" do
        # Outra técnica para o cenário anterior
        diesel = find("table tbody tr", text: "@vindiesel")
        expect(diesel).to have_content "10.000.000"
    end

    it "deve exibir o filme velozes" do
        diesel = find("table tbody tr", text: "@vindiesel")
        movie = diesel.all("td")[2].text
        expect(movie).to eql "Velozes e Furiosos"
    end

    it "deve exibir o insta do Chris Evans" do
        evans = find("table tbody tr", text: "Chris Evans")
        insta = evans.all("td")[4].text
        expect(insta).to eql "@teamcevans"
    end

    it "deve selecionar Chris Pratt para edição" do
        pratt = find("table tbody tr", text: "Chris Pratt")
        pratt.find("a", text: "edit").click
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql "Chris Pratt foi selecionado para edição!"
        sleep 3
    end
end