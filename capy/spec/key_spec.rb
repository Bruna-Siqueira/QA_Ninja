describe "Teclado", :key do
    before(:each) do
        visit "https://training-wheels-protocol.herokuapp.com/key_presses"
    end

    it "enviando teclas" do
        # %i indica um array de símbolos em ruby
        teclas = %i[tab escape space enter shift control alt]
        teclas.each do |t|
            find("#campo-id").send_keys t
            expect(page).to have_content "You entered: " + t.to_s.upcase
            sleep 1
        end
        # enviar um único símbolo
        find("#campo-id").send_keys :tab
        expect(page).to have_content "You entered: TAB"
    end

    it "enviando letras" do
        # %w indica um array de strings em ruby
        letras = %w[a s d f g h j k l]
        letras.each do |l|
            find("#campo-id").send_keys l
            expect(page).to have_content "You entered: " + l.to_s.upcase
            sleep 1
        end
    end
end