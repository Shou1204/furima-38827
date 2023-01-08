#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
# bundle exec rake db:migrate #本番環境のDBリセットのため一時的にコメントアウト
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake db:migrate:reset #８行目コメントアウト、９行目追加（後で戻すこと）