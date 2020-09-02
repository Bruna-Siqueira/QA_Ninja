def get_column_index(column_name)
    column = all("table thead th span").map(&:text)
    column.index{ |x| x==column_name}
end

describe "Tabelas", :tabs, :smoke do
    before(:each) do
        visit "/tables"
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
        movie = diesel.all("td")[get_column_index("Filme")].text
        expect(movie).to eql "Fast & Furious"
    end

    it "deve exibir o insta do Chris Evans" do
        evans = find("table tbody tr", text: "Chris Evans")
        insta = evans.all("td")[get_column_index("Instagram")].text
        expect(insta).to eql "@teamcevans"
    end

    it "deve selecionar Chris Pratt para edição" do
        pratt = find("table tbody tr", text: "Chris Pratt")
        pratt.find("a", text: "edit").click
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql "Chris Pratt foi selecionado para edição!"
        page.driver.browser.switch_to.alert.accept
        sleep 3
    end
end
