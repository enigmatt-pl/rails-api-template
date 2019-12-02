namespace :test do
  task :all do
    BUNDLE = 'bundle exec'

    test_types = {
      brakeman: { command: "#{BUNDLE} brakeman", success: true },
      bundle_audit: { command: "#{BUNDLE} bundle audit --update", success: true },
      rubocop: { command: "#{BUNDLE} rubocop", success: true },
      rspec: { command: "#{BUNDLE} rspec", success: true },
    }

    tmp_errors = []

    test_types.each do |k, v|
      v[:success] = system("#{v[:command]}")
      tmp_errors << "#{k}" unless v[:success]
    end

    puts(tmp_errors.any? ? "Errors found in: #{tmp_errors.join(', ')}" : 'Success! No errors found!')
  end
end
