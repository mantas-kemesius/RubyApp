# Universiteto pagalbinė sistema

Norime sukurti pagalbinę sistemą universitetui, kuri būtų patogi studentams bei dėstytojams. Studentai galės registruotis i paskaitas, atlikinėti testus, gauti namų darbų užduotis, laikyti egzaminus, taip pat užsiregistruoti į bendrabutį, rašyti prašymus studijų skyriui dėl stipendijų. Dėstytojai galės įkelinėti testus, užduotis, konspektus, peržiūrėti bei vertinti studentų darbus.

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
```rspec```

## Run rubocop-rspec

Code style checking for RSpec files: https://github.com/rubocop-hq/rubocop-rspec
edit "rubocop.yml" to ".rubocop.yml"
```rubocop```

## Run reek

Code smell detector for Ruby: https://github.com/troessner/reek

```reek```

## Run mutant 

Mutation testing for Ruby: https://github.com/mbj/mutant

## SimpleCov

Code coverage for Ruby 1.9+ with a powerful configuration library and automatic merging of coverage across test suites
https://github.com/colszowka/simplecov

Check tests coverage in: ```app/coverage/index.html``` page
