class Transfer


  attr_reader :sender, :receiver, :status, :amount 
  
    def initialize(sender, receiver, amount)
      @status = "pending"
      @sender = sender 
      @receiver = receiver
      @amount = amount 
    end

    def valid?
      @sender.valid? && @receiver.valid? 
      end
      
    def execute_transaction
      
    if @status == "pending" && @sender.balance > @amount && valid? 
      @sender.balance -= @amount
      @receiver.balance += @amount 
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
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