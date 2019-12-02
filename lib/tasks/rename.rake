task :rename do
  STDOUT.puts "Enter new project name:"

  tmp_name = STDIN.gets.strip
  success = system("rails g rename:app_to '#{tmp_name}'")
  puts(success ? 'Success!' : 'Something went wrong!')

  new_dir_name = Rails.root.to_s.gsub('rails-api-template', tmp_name.parameterize)

  if success
    loop{ break if File.directory?(new_dir_name) }

    system("rm #{new_dir_name}/CONTRIBUTING.md")
    system("rm #{new_dir_name}/README.md")

    system("mv README.md.sample README.md")
  end
end
