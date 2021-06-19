class Contas
  attr_accessor :saldo, :shouldDeposit, :mensagem, :shouldDraw, :maxLimtDep, :maxLimtSaque

  def initialize(saldo)
    self.saldo = saldo
  end

  def deposita(valor, expDep)
    self.maxLimtDep = 700.00
    self.shouldDeposit = expDep
    if self.shouldDeposit != valor
      puts self.mensagem = "Valor divergente ao informado! Transação Cancelada!"
    elsif self.saldo < 0
      puts self.mensagem = "Saldo Negativo!"
      self.saldo += valor
    elsif valor > self.maxLimtDep
      puts self.mensagem = "Limite de depósito é de R$#{self.maxLimtDep}"
    else
      puts self.mensagem = "Transação efetuada com sucesso!"
      self.saldo += valor
    end
  end

  def saca(valor, expSaque)
    self.maxLimtSaque = 700.00
    self.shouldDraw = expSaque
    if self.shouldDraw != valor
      puts self.mensagem = "Valor divergente ao informado! Transação Cancelada!"
    elsif self.saldo < valor
      puts self.mensagem = "Saldo insuficiente para completar Transação"
    elsif valor > self.maxLimtSaque
      puts self.mensagem = "Limite de depósito é de R$#{self.maxLimtSaque}" 
    else
      puts self.mensagem = "Transação efetuada com sucesso!"
      self.saldo -= valor
    end
  end
end

class ContaCorrente < Contas
  def deposita(valor, expDep)
    super
  end

  def saca(valor, expSaque)
    super
  end

end

class ContaPoupanca < Contas
  def deposita(valor, expDep)
    super
  end

  def saca(valor, expSaque)
    super
  end
end
