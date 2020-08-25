describe "Forms" do
  it "login com sucesso" do
    visit "https://training-wheels-protocol.herokuapp.com/login"

    # O "fill_in" do Capybara funciona para elementos name e id
    fill_in "userId", with: "stark"
    fill_in "passId", with: "jarvis!"

    # Assistir a aula de redimensionamento de janela
    page.current_window.resize_to(1366, 768)

    click_button "Login"

    expect(find('#flash').visible?).to be true

    # Ambos tem o mesmo resultado
    expect(find('#flash').text).to include "Olá, Tony Stark. Você acessou a área logada!"
    expect(find('#flash')).to have_content "Olá, Tony Stark. Você acessou a área logada!"
  end

  it "senha incorreta" do
    visit "https://training-wheels-protocol.herokuapp.com/login"
    fill_in "username", with: "stark"
    fill_in "password", with: "jarvis"
    click_button "Login"
    expect(find('#flash')).to have_content "Senha é invalida!"
  end

  it "usuário não cadastrado" do
    visit "https://training-wheels-protocol.herokuapp.com/login"
    fill_in "username", with: "starqui"
    fill_in "password", with: "jarvis!"
    click_button "Login"
    expect(find('#flash')).to have_content "O usuário informado não está cadastrado!"
  end
end
