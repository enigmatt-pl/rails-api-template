# yolo!
task :rename do
  $stdout.puts "Enter new project name:"

  old_app_name = 'rails-api-template'

  tmp_name = $stdin.gets.strip&.gsub(' ', '-')&.parameterize
  success = system("rails g rename:into '#{tmp_name}'")

  puts(success ? 'Success!' : 'Something went wrong!')

  new_app_dir = Rails.root.to_s.gsub(old_app_name, tmp_name)

  if success
    loop{ break if File.directory?(new_app_dir) }

    system("rm #{new_app_dir}/CONTRIBUTING.md")
    system("rm #{new_app_dir}/README.md")

    system("mv README.md.sample README.md")

    system("cd #{new_app_dir}")
  end
end
