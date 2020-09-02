describe "iframes" do
    describe "bom", :nice_iframe do
        before(:each) do
            visit "https://training-wheels-protocol.herokuapp.com/nice_iframe"
        end

        it "adicionar ao carrinho" do
            # O Capybara só trabalha com iframe se ele possuir um id ou um name.
            within_frame("burgerId") do
                produto = find(".menu-item-info-box", text: "REFRIGERANTE")
                produto.find("a").click
                expect(find("#cart")).to have_content "R$ 4,50"
                sleep 3
            end
        end
    end

    describe "ruim", :bad_iframe do
        before(:each) do
            visit "https://training-wheels-protocol.herokuapp.com/bad_iframe"
        end

        it "carrinho deve estar vazio" do
            # Isso é uma gambiarra para inserir um id temporário para que seja possível testar
            script = '$(".box-iframe").attr("id", "tempId");'
            page.execute_script(script)
            within_frame("tempId") do
                expect(find("#cart")).to have_content "Seu carrinho está vazio!"
            end
        end
    end
end