require_relative '../app/accountTypes'

describe ContaCorrente do
  
  describe 'Saque' do
    context 'Quando saldo é positivo!' do
      before(:all) do
        @cc = ContaCorrente.new(1000.00)
        @cc.saca(200.00, 200.00)
      end
      it 'Então atualiza saldo' do
        expect(@cc.saldo).to eql 800.00
      end
      it 'Então exibe mensagem' do
        expect(@cc.mensagem).to eql "Transação efetuada com sucesso!"
      end
    end
  end
end
