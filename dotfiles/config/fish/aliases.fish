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
alias lb.app 'chruby 2.3.0; and cd ~/Documents/linguabee/linguabee-app; and bundle exec rails server -p 3000'
alias lb.hive 'chruby 2.3.0; and cd ~/Documents/linguabee/linguabee-hive; and bundle exec rails server -p 3002'
alias lb.reset.test 'psql linguabee_api_test -c "drop schema public cascade; create schema public;"; and bundle exec rake db:migrate RAILS_ENV=test; and bundle exec rake db:seed:base RAILS_ENV=test'
alias lb.reset.develop 'psql linguabee_api_development -c "drop schema public cascade; create schema public;"'
alias lb.create.migration 'bundle exec rails g migration'

# from chad
# alias backup_dl 'curl -o latest.dump'
# alias wipedb 'psql linguabee_api_development -c "drop schema public cascade; create schema public;"'
# alias restoredb 'pg_restore --verbose --clean --no-acl --no-owner -h localhost -U damon -d linguabee_api_development latest.dump'
# alias maskemails 'bundle exec rake db:mask_emails'

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

# fish aliases
alias fish.reload 'source ~/.config/fish/config.fish'

function lb.api

  if test (count $argv) -ne 1
    set -g db_name "linguabee_api_production"
  else
    set -g db_name "linguabee_api_$argv[1]"
  end
  # set env variable for database.yml
  set -g -x FLIP_TABLE $db_name
  echo "USING DATABASE: $db_name"
  chruby 2.3.0; and cd ~/Documents/linguabee/linguabee-api; and bundle exec rails server -p 3001
end


# $ lb.update linguabee_api_invoices "http://long-assed-url-to-db"
function lb.update_db
  if test (count $argv) -eq 2
    set -g db_name "linguabee_api_$argv[1]"
    set -g url $argv[2]
  else if test (count $argv) -eq 1
    set -g db_name "linguabee_api_production"
    set -g url $argv[1]

  else
    echo lb.update_db: Expected at least one argument, the url
    return 1

  end

  echo "lb.update_db: running DB: $db_name"
  echo "lb.update_db: running url: $url"

  set -g -x FLIP_TABLE $db_name
  curl -o latest.dump $url
  psql $db_name -c "drop schema public cascade; create schema public;"
  pg_restore --verbose --clean --no-acl --no-owner -h localhost -U damon -d $db_name latest.dump
  bundle exec rake db:mask_emails
end

function ffmpeg.videocopy
    echo "COPYING VIDEO, TRANSCODING AUDIO"
    ffmpeg -i $argv[1] -vcodec copy -c:a libfaac -b:a 160k $argv[2]
end
