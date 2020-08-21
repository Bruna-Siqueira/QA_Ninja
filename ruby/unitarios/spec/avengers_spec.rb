class AvengersHeadQuarter
    attr_accessor :list

    def initialize
        self.list = []
    end

    def put(avenger)
        self.list.push(avenger)
    end
end

# TDD (Desenvolvimento Guiado por Teste)
# Quando é um teste de unidade, usa-se o nome da classe para nomear a suite de testes
describe AvengersHeadQuarter do
    it 'deve adicionar um vingador' do
        hq = AvengersHeadQuarter.new
        hq.put('Spiderman')
        # Verificar se na lista contém o Spiderman
        expect(hq.list).to eql ['Spiderman']
        expect(hq.list).to include 'Spiderman'
    end

    it 'deve adicionar uma lista de vingadores' do
        hq = AvengersHeadQuarter.new
        hq.put('Thor')
        hq.put('Hulk')
        hq.put('Spiderman')
        # Verifica se Thor existe na lista
        expect(hq.list).to include 'Thor'
        # Verifica o total de itens na lista
        expect(hq.list.size).to be > 0
        res = hq.list.size > 0
        expect(res).to be true
    end

    it 'Thor deve ser o primeiro da lista' do
        hq = AvengersHeadQuarter.new
        hq.put('Thor')
        hq.put('Hulk')
        hq.put('Spiderman')
        expect(hq.list).to start_with('Thor')
    end

    it 'Ironman deve ser o ultimo da lista' do
        hq = AvengersHeadQuarter.new
        hq.put('Thor')
        hq.put('Hulk')
        hq.put('Spiderman')
        hq.put('Ironman')
        expect(hq.list).to end_with('Ironman')
    end

    it 'deve conter o sobrenome' do
        avenger = 'Peter Parker'
        expect(avenger).to match(/Parker/)
        expect(avenger).not_to match(/Bruna/)
    end
end