alias vim nvim

# ssh aliases



alias cdhive 'cd ~/Documents/linguabee/linguabee-hive; lb.chruby'
alias cdapi 'cd ~/Documents/linguabee/linguabee-api; lb.chruby'
alias cdapp 'cd ~/Documents/linguabee/linguabee-app; lb.chruby'

alias gfhs 'git flow hotfix start'
alias gfhf 'git flow hotfix finish -n'
alias gs 'git status'

alias be 'bundle exec'

alias lb.chruby 'chruby (head -1 .ruby-version)'
alias lb.rollback 'bundle exec rake db:rollback'
alias lb.rollback.journal 'bundle exec rake journal:db:rollback'
alias lb.migrate 'bundle exec rake db:migrate; bundle exec rake db:seed:base; bundle exec rake journal:db:migrate'
alias lb.seed 'bundle exec rake db:seed:base'


# ruby
alias lb.console.api 'heroku run rails console -a api-linguabee'
alias lb.console.stage 'heroku run rails console -a stage-api-linguabee'

alias lb.migrate.stage 'heroku run rake db:migrate -a stage-api-linguabee'
alias lb.migrate.api 'heroku run rake db:migrate -a api-linguabee'

alias lb.seed.api 'heroku run rake db:seed:base -a api-linguabee'
alias lb.seed.stage 'heroku run rake db:seed:base -a stage-api-linguabee'
# set PATH -gx /Users/damon/.gem/ruby/2.3.0/bin /Users/damon/.rubies/ruby-2.3.0/lib/ruby/gems/2.3.0/bin /Users/damon/.rubies/ruby-2.3.0/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin
# set PATH -gx /Users/damon/.gem/ruby/2.5.0/bin /Users/damon/.rubies/ruby-2.5.0/lib/ruby/gems/2.5.0/bin /Users/damon/.rubies/ruby-2.5.0/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin
alias lb.add_prep_time 'heroku run rake db:prep_timer -a api-linguabee'
# linguabee
alias lb.maintenance.on 'heroku maintenance:on -a api-linguabee; heroku maintenance:on -a hive-linguabee; heroku maintenance:on -a linguabee'
alias lb.maintenance.off 'heroku maintenance:off -a api-linguabee; heroku maintenance:off -a hive-linguabee; heroku maintenance:off -a linguabee'
alias lb.app 'cd ~/Documents/linguabee/linguabee-app; lb.chruby; and bundle exec rails server -p 3000 -b 0.0.0.0'
alias lb.hive 'cd ~/Documents/linguabee/linguabee-hive; lb.chruby; and bundle exec rails server -p 3002 -b 0.0.0.0'
alias lb.skep 'cd ~/Documents/linguabee/linguabee-skep; lb.chruby; and bundle exec rails server -p 3004'
alias lb.hive.localhost 'cd ~/Documents/linguabee/linguabee-hive; and bundle exec rails server --binding=0.0.0.0 -p 3002'
alias lb.create.migration 'bundle exec rails g migration'
alias lb.kill.app 'kill -9 (cat /Users/damon/Documents/linguabee/linguabee-app/tmp/pids/server.pid)'
alias lb.kill.api 'kill -9 (cat /Users/damon/Documents/linguabee/linguabee-api/tmp/pids/server.pid)'
alias lb.kill.hive 'kill -9 (cat /Users/damon/Documents/linguabee/linguabee-hive/tmp/pids/server.pid)'
alias lb.kill.skep 'kill -9 (cat /Users/damon/Documents/linguabee/linguabee-skep/tmp/pids/server.pid)'


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
# alias v 'workon'
# alias v.quit 'deactivate'
# alias v.mk 'mkvirtualenv --python python3'
# alias v.rm 'rmvirtualenv'
# alias v.cd 'cdvirtualenv'
# alias v.ls 'lssitepackages'

# fish aliases
alias fish.reload 'source ~/.config/fish/config.fish'

# swaps databases, ie lb.api feature-sa
function lb.api
  # if test (count $argv) -ne 1
  #   set -g db_name "linguabee_api_production"
  # else
  #   set -g db_name "linguabee_api_$argv[1]"
  # end
  # # set env variable for database.yml
  # set -g -x DATABASE_URL $db_name
  # echo "USING DATABASE: $db_name"

  set -g -x ENABLE_SIDEKIQ_TESTING false
  cdapi
  bundle exec rails server -p 3001
end

function lb.api.sidekiq
  set -g -x ENABLE_SIDEKIQ_TESTING true
  cdapi
  bundle exec rails server -p 3001
end

# function lb.test
#   # set -g db_name "linguabee_api_development"
#   # set -g -x DATABASE_URL $db_name
#   # echo "TESTING USING DATABASE: $db_name"
#   cd ~/Documents/linguabee/linguabee-api
#   lb.chruby
#   bundle exec rake --trace
# end
alias lb.guard.hive 'cd ~/Documents/linguabee/linguabee-hive; lb.chruby; bundle exec guard'
alias lb.guard.app 'cd ~/Documents/linguabee/linguabee-app; lb.chruby; bundle exec guard'
function lb.guard
  # set -g db_name "linguabee_api_development"
  cd ~/Documents/linguabee/linguabee-api
  lb.chruby
  # env DATABASE_URL=$db_name env RAILS_ENV="test" bundle exec guard -d
  bundle exec guard
end

function lb.console
  cd ~/Documents/linguabee/linguabee-api
  lb.chruby
  bundle exec rails console
end

function lb.test.reset
  cd ~/Documents/linguabee/linguabee-api
  lb.chruby
  psql linguabee_api_test -c "drop schema public cascade; create schema public;"
  psql linguabee_journal_test -c "drop schema public cascade; create schema public;"
  be rake db:migrate RAILS_ENV=test
  be rake journal:db:migrate RAILS_ENV=test
  be rake db:seed:base RAILS_ENV=test
end

#
# if test (count $argv) -ne 1
#   set -g db_name "linguabee_api_production"
# else
#   set -g db_name "linguabee_api_$argv[1]"
# end
#
# echo "lb.update_db: using DB - $db_name"
#
# set -g -x DATABASE_URL $db_name

# $ lb.update
#   will update linguabee_api_production with the local copy of latest.dump, does not download anything
# $ lb.update development
#   will update linguabee_api_development with latest dump
function lb.update_db
  lb.update_db.download_only
  lb.update_db.local_copy
end

function lb.update_db.download_only
  cd ~/Documents/linguabee/linguabee-api
  lb.chruby
  /usr/local/bin/heroku pg:backups:capture -a api-linguabee
  curl -o latest.dump (/usr/local/bin/heroku pg:backups:url -a api-linguabee)
end

function lb.update_db.journal
  cd ~/Documents/linguabee/linguabee-api
  lb.chruby
  /usr/local/bin/heroku pg:backups:capture postgresql-shallow-35928 -a api-linguabee
  curl -o latest_journal.dump (/usr/local/bin/heroku pg:backups:url -a api-linguabee)
  lb.update_db.journal.local_copy
end

function lb.update_db.local_copy
  psql linguabee_api_development -c "drop schema public cascade; create schema public;"
  pg_restore --verbose --clean --no-acl --no-owner -h localhost -U damon -d linguabee_api_development latest.dump
  bundle exec rake db:mask_emails
  bundle exec rake db:seed:base
end

function lb.update_db.journal.local_copy
  psql linguabee_journal_development -c "drop schema public cascade; create schema public;"
  pg_restore --verbose --clean --no-acl --no-owner -h localhost -U damon -d linguabee_journal_development latest_journal.dump
  bundle exec rake db:mask_emails
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

function nvim.plugin.add
  set dir (pwd)
  cd ~/.local/share/nvim/site
  set splits (string split / $argv[1])
  set folder (string replace ".git" "" $splits[-1])
  git submodule add $argv[1] pack/thornomad/start/$folder
  cd $dir
end

function nvim.plugin.list
  set dir (pwd)
  cd ~/Documents/dotfiles
  git submodule | awk -F '/' '{ print $9 }'
  cd $dir
end

# this does not seem to work, but adding does:
# https://gist.github.com/manasthakur/d4dc9a610884c60d944a4dd97f0b3560
function nvim.plugin.remove
  set dir (pwd)
  cd ~/Documents/dotfiles
  git submodule deinit dotfiles/local/share/nvim/site/pack/thornomad/start/$argv[1]
  git rm -r dotfiles/local/share/nvim/site/pack/thornomad/start/$argv[1]
  rm -Rf .git/modules/dotfiles/local/share/nvim/site/pack/thornomad/start/$argv[1]
  cd $dir
end

# ffmpeg -i DYUSA_SystematicOppression.mp4 -vf subtitles=DYUSA_SystematicOppression.en.vtt DYUSA_SystematicOppression.Subs.mp4
