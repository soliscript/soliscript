# Soliscript

soliscript - run blockchain contracts in rubidity (with 100%-solidity compatible data types & abis) on an ethereum simulacrum in your own home for fun & profit (for free)
 

* home  :: [github.com/soliscript/soliscript](https://github.com/soliscript/soliscript)
* bugs  :: [github.com/soliscript/soliscript/issues](https://github.com/soliscript/soliscript/issues)
* gem   :: [rubygems.org/gems/soliscript](https://rubygems.org/gems/soliscript)
* rdoc  :: [rubydoc.info/gems/soliscript](http://rubydoc.info/gems/soliscript)



## What's Solidity?!  What's Rubidity?!

See [**Solidity - Contract Application Binary Interface (ABI) Specification** »](https://docs.soliditylang.org/en/latest/abi-spec.html)

See [**Rubidity - Ruby for Layer 1 (L1) Contracts / Protocols with "Off-Chain" Indexer**  »](https://github.com/s6ruby/rubidity)



## Usage

Let's try the contract samples from 
the free (online) booklet titled ["Programming Crypto Blockchain Contracts Step-by-Step Book / Guide"](https://github.com/s6ruby/programming-crypto-contracts)
in Soliscript (Rubidity with Ethereum Simulacrum)!




### Simple Ponzi - Investment of a Lifetime!

Let's start with a simple ponzi scheme contract:


``` ruby
class SimplePonzi < Contract

    storage current_investor:   Address,
            current_investment: UInt


    sig []
    def constructor
      @current_investor  = msg.sender
    end

    sig [] 
    def receive         # @payable default function
      minimum_investment = @current_investment * 11/10
      assert  msg.value >= minimum_investment, 
             'new investments must be 10% greater than current'  
  
      # record new investor
      previous_investor   = @current_investor
      @current_investor   = msg.sender
      @current_investment = msg.value
  
      # pay out previous investor
      previous_investor.send( msg.value )
    end
  
end # class SimplPonzi
```

(Source: [`ponzi_simple.rb`](sandbox/ponzi_simple.rb))


Let's look at the first simple ponzi contract script. The idea is:

The money sent in by the latest investor
gets paid out to the previous investor and because every
new investment must be at least 10% larger than the last
investment - EVERY INVESTOR WINS! (*)

(*): Except the last "sucker" is HODLing the bag waiting for a greater fool.


Let's setup some test accounts with funny money:

``` ruby
genesis   = '0x'+'11'*20  #=> '0x1111111111111111111111111111111111111111'
alice     = '0x'+'aa'*20  #=> '0xaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
bob       = '0x'+'bb'*20  #=> '0xbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
charlie   = '0x'+'cc'*20  #=> '0xcccccccccccccccccccccccccccccccccccccccc'

## setup test accounts with starter balance
Account[ genesis ].balance   = 0
Account[ alice   ].balance   = 1_000_000
Account[ bob     ].balance   = 1_000_000
Account[ charlie ].balance   = 1_000_000

## (pp) pretty print  all known accounts with balance
pp Account.all
```

(Source: [`run_ponzi_simple.rb`](sandbox/run_ponzi_simple.rb))


printing:

```
[#<account 0x1111...111111 @balance=0,       @nonce=0,
 #<account 0xaaaa...aaaaaa @balance=1000000, @nonce=0,
 #<account 0xbbbb...bbbbbb @balance=1000000, @nonce=0,
 #<account 0xcccc...cccccc @balance=1000000, @nonce=0]
```




And let's invest:

``` ruby
## genesis - create contract
ponzi = Simulacrum.send_transaction( from: genesis, data: SimplePonzi ).contract
#=> #<SimplePonzi @current_investment=0, @current_investor="0x1111">

Simulacrum.send_transaction( from: alice, to: ponzi, value: 100_000 )
#=> #<SimplePonzi @current_investment=100000, @current_investor="0xaaaa">

Simulacrum.send_transaction( from: bob, to: ponzi, value: 111_000 )
#=> #<SimplePonzi @current_investment=111000, @current_investor="0xbbbb">

Simulacrum.send_transaction( from: charlie, to: ponzi, value: 200_000 )
#=> #<SimplePonzi @current_investment=200000, @current_investor="0xcccc">

## (pp) pretty print all known accounts with balance
pp Account.all
```

Resulting in:

```
[#<account 0x1111...111111 @balance=100000,  @nonce=1,
 #<account 0xaaaa...aaaaaa @balance=1011000, @nonce=1,
 #<account 0xbbbb...bbbbbb @balance=1089000, @nonce=1,
 #<account 0xcccc...cccccc @balance=800000,  @nonce=1]
```

The "Genesis" `0x1111` account made a 100000 X profit of 100000 out-of-thin air.
The "Alice" `0xaaaa` account made an investment of 100000 and got 111000. 11000 profit! Yes, it works!
The "Bob" `0xbbbb` account made an investment of 111000 and got 200000. 89000 profit! Yes, it works!
The "Charlie" `0xcccc` account is still waiting for a greater fool and is HODLing the bag.
To the moon!


And so on.  To be continued ...







## Bonus - More Blockchain (Crypto) Tools, Libraries & Scripts In Ruby

See [**/rubidity**](https://github.com/s6ruby/rubidity) at the small, smart, secure, safe, solid & sound ruby (s6ruby) org.

See [**/blockchain**](https://github.com/rubycocos/blockchain) 
at the ruby code commons (rubycocos) org.
