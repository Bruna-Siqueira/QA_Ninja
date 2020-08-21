class Carro
    attr_accessor :nome

    def ligar
        puts 'O carro está pronto para iniciar o trajeto.'
    end
end

civic = Carro.new
puts civic.class

civic.nome = 'Civic'
puts civic.nome
civic.ligar
