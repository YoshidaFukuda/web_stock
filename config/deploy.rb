    set :application, 'web-stock'
    #=> アプリケーション名
    
    set :repo_url, 'git@bitbucket.org:yu01/webstock.git'
    
    #=> githubのurl。プロジェクトのgitホスティング先を指定する
    
    #ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
    set :branch, 'master'
    #> デプロイするのはマスターブランチに固定
    
    set :deploy_to, '/var/www/html'
    #> デプロイ先のサーバーのディレクトリ。フルパスで指定した。
    
    set :scm, :git
    #> Version管理はgitですよ、と
    
    set :format, :pretty
    set :log_level, :debug # :info or :debug
    #> ログはたくさん見れるようにしておきます。
    
    # set :pty, true
    
    #set :linked_files, %w{config/database.yml}

    #set :linked_files, %w{config/database.yml config/resque.yml}
    #>　デプロイ先のサーバーの :deploy_to/shared/config/database.yml のシンボリックリンクを
    #  :deploy_to/current/config/database.yml にはる。
    # 先にshared以下にファイルをアップロードする必要あり
    # 説明下記に
    
    set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets}
    #>同じくsharedに上記のディレクトリを生成し、currentにシンボリックリンクを張る
    
    
    # set :default_env, { path: "/opt/ruby/bin:$PATH" }
    
    set :keep_releases, 5
    #> 5リリース分保持しておく。
    #
    
    
    namespace :deploy do
    
      #>アプリの再起動を行うタスク
      desc 'Restart application'
      task :restart do
        on roles(:app), in: :sequence, wait: 5 do
          execute :mkdir, '-p', release_path.join('tmp')
          execute :touch, release_path.join('tmp/restart.txt')
        end
      end
    
       #> 上記linked_filesで使用するファイルをアップロードするタスク 
       #  deployが行われる前に実行する必要がある。
      desc 'upload importabt files'
      task :upload do
        on roles(:app) do |host|
          upload!('config/database.yml',"#{shared_path}/config/database.yml")
        end
      end
    
      #> webサーバー再起動時にキャッシュを削除する
      after :restart, :clear_cache do
        on roles(:web), in: :groups, limit: 3, wait: 10 do
          # Here we can do anything such as:
          within release_path do
            execute :rmdir, '-rf', release_path.join('tmp/cache')
          end
        end
      end
    
      #> Flowのbefore,afterのタイミングで上記タスクを実行する.
      # 詳細のhookタイミングはここでcheck:http://www.capistranorb.com/documentation/getting-started/flow/
      before :started, 'deploy:upload'
    
      after :finishing, 'deploy:cleanup'
    
    end
    
    #> dbサーバーのデータベースを生成するタスク。
    #> デプロイ前に実行する必要がある。
    task :db_create do
      on roles(:db) do |host|
        q1 = 'CREATE DATABASE IF NOT EXISTS web-stock;'
        q2 = 'GRANT ALL ON web-stock.* TO ec2-user@localhost IDENTIFIED BY "<app_passsword>";'
        q3 = "FLUSH PRIVILEGES;"
        sql = "#{q1}#{q2}#{q3}"
        execute "mysql --user=<mysql_user> --password=<msql_password> -e '#{sql}' "
      end
    end