 # Load DSL and Setup Up Stages
    require 'capistrano/setup'
    
    # Includes default deployment tasks
    require 'capistrano/deploy'
    
    # Includes tasks from other gems included in your Gemfile
    #
    # For documentation on these, see for example:
    #
    #   https://github.com/capistrano/rvm
    #   https://github.com/capistrano/rbenv
    #   https://github.com/capistrano/chruby
    #   https://github.com/capistrano/bundler
    #   https://github.com/capistrano/rails/tree/master/assets
    #   https://github.com/capistrano/rails/tree/master/migrations
    #
    
    # rbenvを使用しているので or 'capistrano/rvm'
    require 'capistrano/rbenv'
    
    #rbenvをシステムにインストールした or ユーザーローカルにインストールした
    set :rbenv_type, :'ec2-user'  # :user or :system
    # rubyのversion
    set :rbenv_ruby, '2.1.0-rc1'
    
    # Rails,bundlerをデプロイするので必須
    require 'capistrano/bundler'
    require 'capistrano/rails'
    
    # Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
    Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }

