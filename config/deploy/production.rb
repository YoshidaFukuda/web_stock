set :stage, :production
    
    
    #サーバーのロールを指定.ついでにユーザーも指定しています。
    role :app, %w{ec2-user@54.249.12.46}
    role :web, %w{ec2-user@54.249.12.46}
    role :db,  %w{ec2-user@54.249.12.46}
    
    
    # you can set custom ssh options
    # it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
    # you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
    # set it globally
    #> サーバーにアクセスするためのsshkeyを指定する.
    #> サーバーから直接githubのプライベートリポジトリにアクセスするためにforward_agentをtrueにしておく。
    set :ssh_options, {
      keys: [File.expand_path('~/.ssh/Dev_server.pem')],
      forward_agent: true
    }
    
    #>　サーバー個別の設定が多い場合は下記の方がいいかも。
    # and/or per server
    # server 'example.com',
    #   user: 'user_name',
    #   roles: %w{web app},
    #   ssh_options: {
    #     user: 'user_name', # overrides user setting above
    #     keys: %w(/home/user_name/.ssh/id_rsa),
    #     forward_agent: false,
    #     auth_methods: %w(publickey password)
    #     # password: 'please use keys'
    #   }
    # setting per server overrides global ssh_options
    
    #fetch(:default_env).merge!(rails_env: :production)