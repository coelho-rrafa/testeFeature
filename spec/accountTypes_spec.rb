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

    context 'Quando saldo não é suficiente' do
      before(:all) do
        @cc = ContaCorrente.new(0.00)
        @cc.saca(100.00, 100.00)
      end
      it 'Então exibe mensagem' do
        expect(@cc.mensagem).to eql "Saldo insuficiente para completar Transação"
      end
      it 'Então exibe saldo atualizado' do
        expect(@cc.saldo).to eql 0.00
      end
    end

    context 'Quando o valor do saque é divergente ao informado' do
      before(:all) do
        @cc = ContaCorrente.new(500.00)
        @cc.saca(100.00, 110.00)
      end
      it 'então exibe mensagem de negação' do
        expect(@cc.mensagem).to eql "Valor divergente ao informado! Transação Cancelada!"
      end
      it 'então exibe saldo é atualizado' do
        expect(@cc.saldo).to eql 500.00
      end
    end

    context 'Quando Limite de Saque é ultrapassado' do
      before(:all) do
        @cc = ContaCorrente.new(1000.00)
        @cc.saca(701.00, 701.00)
      end
      it 'então exibe mensagem de negação' do
        expect(@cc.mensagem).to eql "Limite de depósito é de R$700.0"
      end
    end
  end
end
