task :default do
  puts "Running CI tasks..."

  sh("JEKYLL_ENV=production bundle exec jekyll build")
  puts "Jekyll successfully built"

  sh("echo 'travelsizelife.com' >> _site/CNAME")
  puts "CNAME created"
end
