describe "Mouse Hover", :hovers do
    before(:each) do
        visit "https://training-wheels-protocol.herokuapp.com/hovers"
    end

    it "quando passo o mouse sobre o blade" do
        card = find('img[alt=Blade]')
        card.hover
        expect(page).to have_content "Nome: Blade"
    end

    it "quando passo o mouse sobre o pantera negra" do
        # Regex: procurar por elemento que comece com Pantera 'img[alt^=Pantera]'
        # Regex: procurar por elemento que termine com Negra 'img[alt$=Negra]'
        # Regex: procurar por elemento que contem Pantera 'img[alt*=Pantera]'
        card = find('img[alt="Pantera Negra"]')
        card.hover
        expect(page).to have_content "Nome: Pantera Negra"
    end

    it "quando passo o mouse sobre o homem aranha" do
        card = find('img[alt="Homem Aranha"]')
        card.hover
        expect(page).to have_content "Nome: Homem Aranha"
    end

    after(:each) do
        sleep 2
    end
end