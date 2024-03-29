##
# a simple ponzy (scheme) contract
#   last investor (or sucker) HODLing the bag


class SimplePonzi < Contract

    storage current_investor:    Address,
            current_investment:  UInt


    sig []
    def constructor
      @current_investor  = msg.sender
    end

    sig [] 
    def receive         # @payable default function
      minimum_investment = @current_investment * 11/10
      assert  msg.value >= minimum_investment, 'new investments must be 10% greater than current'  
  
      # record new investor
      previous_investor   = @current_investor
      @current_investor   = msg.sender
      @current_investment = msg.value
  
      # pay out previous investor
      previous_investor.send( msg.value )
    end
  
  end # class SimplPonzi