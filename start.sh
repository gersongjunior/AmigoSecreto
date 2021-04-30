#instala as gems
bundle check || bundle install
#roda o servidor puma
bundle exec puma -C config/puma.rb