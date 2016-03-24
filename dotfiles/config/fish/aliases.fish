# ssh aliases
alias ssh.nciec 'ssh -p 2222 nciec@site2'
alias ssh.kk 'ssh kkenney@site1'
alias ssh.kf 'ssh kf@site1'
alias ssh.rosalee 'ssh rosalee@site1'

# ruby
alias chruby.lb 'chruby 2.3.0'
alias be 'bundle exec'
alias rollback 'bundle exec rake db:rollback'
alias migrate 'bundle exec rake db:migrate'
alias seed_rollback='bundle exec rake seed:rollback'
alias seed_migrate='bundle exec rake seed:migrate'

# linguabee
alias runserver.lb_web 'chruby 2.3.0; and cd ~/Documents/linguabee/linguabee-app; and bundle exec rails server -p 3000'
alias runserver.lb_api 'chruby 2.3.0; and cd ~/Documents/linguabee/linguabee-api; and bundle exec rails server -p 3001'
alias runserver.lb_hive 'chruby 2.3.0; and cd ~/Documents/linguabee/linguabee-hive; and bundle exec rails server -p 3002'

function .runsudo --description 'Run previous command as root'
    set cursor_pos (echo (commandline -C) + 5 | bc)
    commandline -C 0
    commandline -i 'sudo '$history[1]
    commandline -C "$cursor_pos"
end
bind \es ".runsudo"
