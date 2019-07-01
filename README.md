

### User stories

```
As an account holder
In order to see how much money there is in my account
I want to be able to check my account balance

require './lib/account.rb'
a = Account.new
a.balance
```

```
As an account holder
In order to put money into my account
I want to be able to make a deposit

require './lib/account.rb'
a = Account.new
a.balance
a.deposit(100)
```

```
As an account holder
In order to withdraw money from my account
I want to be able to make a withdrawal

require './lib/account.rb'
a = Account.new
a.balance
a.deposit(500)
a.withdraw(100)
```

```
As an account holder
In order to check my history
I want to be able to print a statement

require './lib/account.rb'
a = Account.new
a.balance
a.deposit(1000)
a.deposit(2000)
a.withdraw(500)
a.statement
```


