# Bank Tech Test

The project is a practice tech test in which the idea is to design a simple bank account capable of storing a balance and conducting withdrawal and deposit transactions, as well as printing a simple statement of recent transactions. The full brief can be found [here](./BRIEF.md), and a bit about my approach [here](./APPROACH.md).

## Getting started

Navigate to your desired folder to store the project.

Run `git clone https://github.com/olliebrownlow/bank-tech-test.git`

Run `bundle` to install dependencies

## Usage

The project runs on a REPL like irb.

Open irb and run `require './lib/account.rb'`
You can then interact with the program as per the irb commands below each user story below:

## Testing

Run `rspec` on the command line

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
a.print_statement
```


