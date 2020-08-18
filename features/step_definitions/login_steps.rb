Quando('eu faço login com {string} e {string}') do |email, password|
    @login.go
    @login.with(email, password)
    sleep 3
end

Então('devo ser autenticado') do
    expect(get_token.length).to be 147        # um token válido tem 147 caracteres
end

Então('devo ver {string} na área logada') do |expect_name|
    expect(@sidebar.logged_user).to eql expect_name
end

Então('não devo ser autenticado') do
    expect(get_token).to be nil
end

Então('devo ver a mensagem de alerta {string}') do |expect_message|
    expect(@login.alert).to eql expect_message
end