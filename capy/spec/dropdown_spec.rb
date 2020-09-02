describe "Caixa de opções", :dropdown do
    it "item específico simples" do
        visit "/dropdown"
        # O select funciona apenas com elementos do tipo select que possuam id
        select("Loki", from: "dropdown")
        sleep 3
    end

    it "item específico com o find" do
        visit "/dropdown"
        drop = find(".avenger-list")
        drop.find("option", text: "Scott Lang").select_option
        sleep 3
    end

    it "qualquer item" , :sample do
        visit "/dropdown"
        drop = find(".avenger-list")
        # "sample" é um recurso do ruby para selecionar um item randômico de um array
        drop.all("option").sample.select_option
        sleep 2
    end
end