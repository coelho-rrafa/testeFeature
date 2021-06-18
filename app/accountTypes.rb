class Contas
  attr_accessor :saldo, :shouldDeposit, :mensagem, :shouldDraw

  def initialize(saldo)
    self.saldo = saldo
  end

  def deposita(valor, expDep, max)
    self.shouldDeposit = expDep
    if self.shouldDeposit != valor
      puts self.mensagem = "Valor divergente ao informado! Transação Cancelada!"
    elsif self.saldo < 0
      puts self.mensagem = "Saldo Negativo!"
      self.saldo += valor
    elsif valor > max
      puts self.mensagem = "Limite de depósito é de R$" + max.to_s
    else
      puts self.mensagem = "Transação efetuada com sucesso!"
      self.saldo += valor
    end
  end

  def saca(valor, expSaque, max)
    self.shouldDraw = expSaque
    if self.shouldDraw != valor
      puts self.mensagem = "Valor divergente ao informado! Transação Cancelada!"
    elsif self.saldo < valor
      puts self.mensagem = "Saldo insuficiente para completar Transação"
    elsif valor > max
      puts self.mensagem = "Limite de depósito é de R$" + max.to_s
    else
      puts self.mensagem = "Transação efetuada com sucesso!"
      self.saldo -= valor
    end
  end
end

class ContaCorrente < Contas
  def deposita(valor, expDep, max = 500.00)
    super
  end

  def saca(valor, expSaque, max = 700.00)
    super
  end
end

class ContaPoupanca < Contas
  def deposita(valor, expDep, max = 1000.00)
    super
  end

  def saca(valor, expSaque, max = 500.00)
    super
  end
end
