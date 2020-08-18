#language: pt

Funcionalidade: Cadastro de filmes
    Para que eu possa disponibilizr novos títulos no catálogo
    Sendo um gestor de catálogo
    Posso cadastrar um novo filme

    @new_movie
    Esquema do Cenario: Novo filme
        O gestor de catálogo cadastra um novo filme através do formulário
        e um novo registro é inserido no catálogo NijaFlix.

        Dado que <codigo> é um novo filme
        Quando eu faço o cadastro deste filme
        Então devo ver o novo filme na lista

        Exemplos:
        |codigo     |
        |"ultimato" |
        |"spider"   |
        |"jocker"   |