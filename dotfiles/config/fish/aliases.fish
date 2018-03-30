# ssh aliases
alias ssh.nciec_old 'ssh -p 2222 nciec@site2'
alias ssh.kk 'ssh kkenney@site1'
alias ssh.kf 'ssh kf@site1'
alias ssh.rosalee 'ssh rosalee@site1'
alias ssh.nciec 'ssh nciec@site1'
alias ssh.pai 'ssh pai@site1'
alias ssh.diinst 'ssh diinst@site1'

# ruby
alias lb.chruby 'chruby (head -1 .ruby-version)'
alias be 'bundle exec'
alias rollback 'bundle exec rake db:rollback'
alias migrate 'bundle exec rake db:migrate'
alias migrate_test 'bundle exec rake db:migrate RAILS_ENV=test'
alias seed_rollback='bundle exec rake seed:rollback'
alias seed_migrate='bundle exec rake seed:migrate'


# linguabee
alias lb.maintenance.on 'heroku maintenance:on -a api-linguabee; heroku maintenance:on -a hive-linguabee; heroku maintenance:on -a linguabee'
alias lb.maintenance.off 'heroku maintenance:off -a api-linguabee; heroku maintenance:off -a hive-linguabee; heroku maintenance:off -a linguabee'
alias lb.app 'cd ~/Documents/linguabee/linguabee-app; lb.chruby; and bundle exec rails server -p 3000 -b 0.0.0.0'
alias lb.hive 'cd ~/Documents/linguabee/linguabee-hive; lb.chruby; and bundle exec rails server -p 3002 -b 0.0.0.0'
alias lb.skep 'cd ~/Documents/linguabee/linguabee-skep; lb.chruby; and bundle exec rails server -p 3004'
alias lb.hive.localhost 'cd ~/Documents/linguabee/linguabee-hive; and bundle exec rails server --binding=0.0.0.0 -p 3002'
alias lb.test.reset 'psql linguabee_api_development -c "drop schema public cascade; create schema public;"; and env DATABASE_URL=linguabee_api_development bundle exec rake db:migrate RAILS_ENV=test; and env DATABASE_URL=linguabee_api_development bundle exec rake db:seed:base RAILS_ENV=test'
alias lb.reset.develop 'psql linguabee_api_development -c "drop schema public cascade; create schema public;"'
alias lb.create.migration 'bundle exec rails g migration'
alias lb.kill.app 'kill -9 (cat /Users/damon/Documents/linguabee/linguabee-app/tmp/pids/server.pid)'
alias lb.kill.api 'kill -9 (cat /Users/damon/Documents/linguabee/linguabee-api/tmp/pids/server.pid)'
alias lb.kill.hive 'kill -9 (cat /Users/damon/Documents/linguabee/linguabee-hive/tmp/pids/server.pid)'
alias lb.kill.skep 'kill -9 (cat /Users/damon/Documents/linguabee/linguabee-skep/tmp/pids/server.pid)'
alias lb.backup_api 'heroku pg:backups capture -a api-linguabee; heroku pg:backups -a api-linguabee public-url | cat'
alias lb.backup_url 'heroku pg:backups -a api-linguabee public-url | cat'
alias lb.sidekiq 'bundle exec sidekiq -e development -q default -q mailers -q broadcast'
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

# swaps databases, ie lb.api feature-sa
function lb.api
  if test (count $argv) -ne 1
    set -g db_name "linguabee_api_production"
  else
    set -g db_name "linguabee_api_$argv[1]"
  end
  # set env variable for database.yml
  set -g -x DATABASE_URL $db_name
  echo "USING DATABASE: $db_name"
  cd ~/Documents/linguabee/linguabee-api
  lb.chruby
  bundle exec rails server -p 3001
end

function lb.test
  set -g db_name "linguabee_api_development"
  set -g -x DATABASE_URL $db_name
  echo "TESTING USING DATABASE: $db_name"
  cd ~/Documents/linguabee/linguabee-api
  lb.chruby
  env DATABASE_URL=$db_name bundle exec rake
end

function lb.guard
  set -g db_name "linguabee_api_development"
  cd ~/Documents/linguabee/linguabee-api
  lb.chruby
  env DATABASE_URL=$db_name env RAILS_ENV="test" bundle exec guard -d
end

# $ lb.update
#   will update linguabee_api_production with the local copy of latest.dump, does not download anything
# $ lb.update development
#   will update linguabee_api_development with latest dump
function lb.update_db
  cd ~/Documents/linguabee/linguabee-api

  if test (count $argv) -ne 1
    set -g db_name "linguabee_api_production"
  else
    set -g db_name "linguabee_api_$argv[1]"
  end

  echo "lb.update_db: using DB - $db_name"

  set -g -x DATABASE_URL $db_name
  /usr/local/bin/heroku pg:backups:capture -a api-linguabee
  curl -o latest.dump (/usr/local/bin/heroku pg:backups:url -a api-linguabee)
  lb.update_db.local_copy
end

function lb.update_db.local_copy
  psql $db_name -c "drop schema public cascade; create schema public;"
  pg_restore --verbose --clean --no-acl --no-owner -h localhost -U damon -d $db_name latest.dump
  bundle exec rake db:mask_emails
  bundle exec rake db:seed:base
end

function ffmpeg.videocopy
    echo "COPYING VIDEO, TRANSCODING AUDIO TO AAC"
    ffmpeg -i $argv[1] -vcodec copy -c:a libfaac -b:a 160k $argv[2]
end

function ffmpeg.videocopy.ac3
    echo "COPYING VIDEO, TRANSCODING AUDIO TO AC3"
    ffmpeg -i $argv[1] -map 0 -vcodec copy -c:a ac3 -b:a 160k $argv[2]
end

function ffmpeg.transcode
    echo "COPYING VIDEO, TRANSCODING AUDIO TO AC3"
    ffmpeg -i $argv[1] -map 0:v -vcodec copy -map 0:a:0 -acodec copy -map -0:s  $argv[2]
end

# ffmpeg -i DYUSA_SystematicOppression.mp4 -vf subtitles=DYUSA_SystematicOppression.en.vtt DYUSA_SystematicOppression.Subs.mp4
