# ssh aliases
alias ssh.nciec_old 'ssh -p 2222 nciec@site2'
alias ssh.kk 'ssh kkenney@site1'
alias ssh.kf 'ssh kf@site1'
alias ssh.rosalee 'ssh rosalee@site1'
alias ssh.nciec 'ssh nciec@site1'
alias ssh.pai 'ssh pai@site1'
alias ssh.diinst 'ssh diinst@site1'

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
alias lb.skep 'chruby 2.3.0; and cd ~/Documents/linguabee/linguabee-skep; and bundle exec rails server -p 3004'
alias lb.hive.localhost 'chruby 2.3.0; and cd ~/Documents/linguabee/linguabee-hive; and bundle exec rails server --binding=0.0.0.0 -p 3002'
alias lb.test.reset 'psql linguabee_api_test -c "drop schema public cascade; create schema public;"; and bundle exec rake db:migrate RAILS_ENV=test; and bundle exec rake db:seed:base RAILS_ENV=test'
alias lb.reset.develop 'psql linguabee_api_development -c "drop schema public cascade; create schema public;"'
alias lb.create.migration 'bundle exec rails g migration'
alias lb.kill.app 'kill -9 (cat /Users/damon/Documents/linguabee/linguabee-app/tmp/pids/server.pid)'
alias lb.kill.hive 'kill -9 (cat /Users/damon/Documents/linguabee/linguabee-hive/tmp/pids/server.pid)'
alias lb.kill.skep 'kill -9 (cat /Users/damon/Documents/linguabee/linguabee-skep/tmp/pids/server.pid)'
alias lb.backup_api 'heroku pg:backups capture -a api-linguabee; heroku pg:backups -a api-linguabee public-url | cat'
alias lb.backup_url 'heroku pg:backups -a api-linguabee public-url | cat'
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
  set -g -x DATABASE_URL $db_name
  echo "USING DATABASE: $db_name"
  chruby 2.3.0; and cd ~/Documents/linguabee/linguabee-api; and bundle exec rails server -p 3001
end


# $ lb.update
#   will update linguabee_api_production with the local copy of latest.dump, does not download anything
# $ lb.update "long-assed-url-to-db"
#   will update linguabee_api_production with latest dump
# $ lb.update invoices "http://long-assed-url-to-db"
#   will update linguabee_api_invoices with the latest dump
function lb.update_db
  if test (count $argv) -eq 2
    set -g db_name "linguabee_api_$argv[1]"
  else if test (count $argv) -eq 1
    set -g db_name "linguabee_api_production"
  end

  echo "lb.update_db: running DB: $db_name"

  set -g -x DATABASE_URL $db_name
  heroku pg:backups:capture -a api-linguabee
  curl -o latest.dump (heroku pg:backups:url -a api-linguabee)
  psql $db_name -c "drop schema public cascade; create schema public;"
  pg_restore --verbose --clean --no-acl --no-owner -h localhost -U damon -d $db_name latest.dump
  bundle exec rake db:mask_emails
  bundle exec rake db:seed:base
end

function ffmpeg.videocopy
    echo "COPYING VIDEO, TRANSCODING AUDIO"
    ffmpeg -i $argv[1] -vcodec copy -c:a libfaac -b:a 160k $argv[2]
end

function ffmpeg.videocopy.ac3
    echo "COPYING VIDEO, TRANSCODING AUDIO"
    ffmpeg -i $argv[1] -map 0 -vcodec copy -c:a ac3 -b:a 160k $argv[2]
end

# ffmpeg -i DYUSA_SystematicOppression.mp4 -vf subtitles=DYUSA_SystematicOppression.en.vtt DYUSA_SystematicOppression.Subs.mp4
