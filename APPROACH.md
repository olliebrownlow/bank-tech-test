# Approach

## 01/07/2019

## Order of execution

### First steps:
- Make directory to store the project
- create APPROACH.md, BRIEF.md and README.md
- `run git init`

- make first commit

### Environment set up

- Create Gemfile including
  - rubocop
  - rspec
  - simplecov
- Run bundle to install the gems and generate the Gemfile.lock
- Run Rspec --init
- Create lib folder for code
- Run `rspec` to check it is working
- Add `--color --format documentation` to .rspec file
- Add .gitignore file
- Add .ruby-version file with `2.6.3`
- Add Scaffolint .rubocop.yml file and update errors for new rubocop version
- require simplecov in the spec_helper
- Run `rspec` to check coverage stats are working

- make second commit

### Start the TDD process

- Design tests for each user story, writing code to pass each fail as the tests are run.

### Refactoring

- Rubocop and code refactors

### Blog

I began by implementing the program all in one class. On reflection, and due to Separation of Concerns, I believe a program with 3 classes would be more desirable. I therefore endeavored to split the program into Account, Transaction and Statement. I did this on a separate branch (this one), and have it fully tested with a coverage of 100%.