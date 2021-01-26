require 'pry'

class Transfer
  attr_accessor :status, :sender, :receiver, :amount

    def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if @sender.balance < @amount || !self.valid?
        @status = "rejected" 
        return "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
         "Transaction was already excuted"
    else
     @sender.balance -= @amount
     @receiver.balance += @amount
     @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
     @receiver.balance -= @amount
     @status = "reversed"
    end
  end

end
