# Universiteto pagalbinė sistema

Deatalus idėjos aprašymas

# Komanda

- Juozas Natkevičius
- Arnas Radzevičius
- Eimantas Markunas
- Tomas Macikas
- Mantas Kemėšius

## Run console app

From /app directory run this command if you are unix user:
```ruby main.rb```

## Run tests
From /app directory run this command if you are unix user:
```rspec tests/*```

## Run rubocop-rspec

Code style checking for RSpec files: https://github.com/rubocop-hq/rubocop-rspec

```rubocop --require rubocop-rspec```

## Run reek

Code smell detector for Ruby: https://github.com/troessner/reek

```reek src/*```

## Run mutant 

Mutation testing for Ruby: https://github.com/mbj/mutant

## SimpleCov

Code coverage for Ruby 1.9+ with a powerful configuration library and automatic merging of coverage across test suites
https://github.com/colszowka/simplecov
