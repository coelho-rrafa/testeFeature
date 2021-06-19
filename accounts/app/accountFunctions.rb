require_relative 'accountTypes'

puts "Informe Saldo disponível: R$"
accountBalance = gets.chomp.to_f #simula uma informação do banco de dados

cc = ContaCorrente.new(accountBalance) #Simula um Retorno de Banco de dados
sleep 1

puts "Saldo em conta: R$" + accountBalance.to_s
puts " "
sleep 2

optionSelected = 0 #Recebe a funcionalidade selcionada para o cliente
endCondition = false #Condição de finalização para o laço

while endCondition == false
  puts "Selecione uma das opções abaixo:
  [1] - Depósito
  [2] - Saque
  [3] - Encerrar Aplicação"
  optionSelected = gets.chomp.to_i

  if optionSelected == 1 #Chama a função de depósito
    puts "DEPÓSITOS"
    sleep 0.2
    puts "Valor de Depósito: R$"
    bankDeposit = gets.chomp.to_f #Informa o valor do depósito
    sleep 0.5

    puts "Confirme o valor do Depósito: R$"
    confirmDeposit = gets.chomp.to_f #Confirma o valor do depósito
    sleep 0.3
    puts " "
    puts "Processando Transação!"
    sleep 2

    cc.deposita(bankDeposit, confirmDeposit) #Recebe os valores de depósito e confirmação da função

    puts " "
    puts "saldo atualizado #{cc.saldo}"
    puts " "
    puts "Deseja efetuar outra transação?"
  elsif optionSelected == 2
    puts "SAQUES"
    sleep 0.2
    puts "Valor do saque: R$"
    bankWithdraw = gets.chomp.to_f #Informa o valor do saque
    sleep 0.5

    puts "Confirme valor do Saque: R$"
    mustDraw = gets.chomp.to_f #Confirma o valor do saque
    sleep 0.3
    puts " "
    puts "Processando Transação!"
    sleep 2

    cc.saca(bankWithdraw, mustDraw) #Recebe os valores de saque e confirmação da função

    puts " "
    puts "saldo atualizado #{cc.saldo}"
    puts " "
    puts "Deseja efetuar outra transação?"
  elsif optionSelected == 3
    endCondition = true #Condição de finalizacão do laço
    puts "Encerrando aplicação!"
    sleep 3
    puts "Aplicação Encerrada"
  else
    puts "Opção inválida!"
    puts " "
    sleep 0.2
  end
end
