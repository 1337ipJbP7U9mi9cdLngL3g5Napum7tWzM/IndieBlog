namespace :bundle do
  desc 'Make bundle install work again'
  task :custom do
    on roles(:web) do
      execute 'bundle install --path /home/doom/IndieHackerJourney/shared/bundle '
    end

  end
end
