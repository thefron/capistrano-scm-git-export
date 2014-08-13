# capistrano-scm-git-export

Adds scm strategy archives your local git for Capistrano 3.x.
Useful when your deployment environment cannot reach remote git repository.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-scm-git-export'

## Usage

Set `:scm` as `:git_export`, and `:branch` as you want in `config/deploy.rb` or `config/deploy/ENVIRONMENT`.

```ruby
  set :scm, :git_export
  set :branch, 'master'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
