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
alias migrate_test 'bundle exec rake db:migrate RAILS_ENV=test'
alias seed_rollback='bundle exec rake seed:rollback'
alias seed_migrate='bundle exec rake seed:migrate'

# linguabee
alias lb.web 'chruby 2.3.0; and cd ~/Documents/linguabee/linguabee-app; and bundle exec rails server -p 3000'
alias lb.api 'chruby 2.3.0; and cd ~/Documents/linguabee/linguabee-api; and bundle exec rails server -p 3001'
alias lb.hive 'chruby 2.3.0; and cd ~/Documents/linguabee/linguabee-hive; and bundle exec rails server -p 3002'
alias lb.reset.test 'psql linguabee_api_test -c "drop schema public cascade; create schema public;"; and bundle exec rake db:migrate RAILS_ENV=test; and bundle exec rake db:seed:base RAILS_ENV=test'

function .runsudo --description 'Run previous command as root'
    set cursor_pos (echo (commandline -C) + 5 | bc)
    commandline -C 0
    commandline -i 'sudo '$history[1]
    commandline -C "$cursor_pos"
end
bind \es ".runsudo"

# python aliases
alias v 'workon'
alias v.quit 'deactivate'
alias v.mk 'mkvirtualenv --python python3'
alias v.rm 'rmvirtualenv'
alias v.cd 'cdvirtualenv'
alias v.ls 'lssitepackages'
