## String Calculator

The String Calculator is a simple Ruby class that parses and adds numbers from a given input string. This project includes a suite of RSpec tests to ensure the functionality works as expected.

## Features

- Add numbers from a comma-separated string.
- Handle newline characters as delimiters.
- Support custom single-character and multi-character delimiters using format: "//[delimiter]\n" or "//[delim1][delim2]\n".
- Ignore numbers greater than 1000.
- Raise an exception when negative numbers are encountered.



#### Prerequisites

- Ruby (version 2.5 or later)
- Bundler

#### Installation

##### 1. Check out the repository

```bash
git clone https://github.com/ravendra-01/string-calculator.git
```

##### 2. Install the required gems

Run the following commands to install gems.

```ruby
bundle install
```

##### 3. Run tests

Run the following commands to run tests.

```ruby
rspec
```
