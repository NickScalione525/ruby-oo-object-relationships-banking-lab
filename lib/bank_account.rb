require 'pry'

class BankAccount
    attr_accessor :balance
    attr_writer
    attr_reader :name, :status

    

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        end

def deposit(amount)
    @balance += (amount) 
end
def display_balance
    "Your balance is $#{self.balance}."
end
def status=(status)
    @status = status
end
def valid?
    if self.status == "open" && self.balance > 0 
        true
    else
        false
    end
end
def close_account
    self.status = "closed"
end

end