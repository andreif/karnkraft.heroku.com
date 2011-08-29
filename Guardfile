# A sample Guardfile
# More info at https://github.com/guard/guard#readme
require 'guard/guard'

module ::Guard
  class GitPushOrigin < ::Guard::Guard
    def run_all
      system 'git push origin'
      true
    end

    def run_on_change(paths)
      system 'git push origin'
      if paths.find { |e| e =~ /master$/ }
        Dir['.git/refs/remotes/*'].each do |remote|
          remote = File.basename(remote)
          system "git push #{remote} master" unless remote == 'origin'
        end
      end
      true
    end
  end
end

guard 'git_push_origin' do
  watch(%r{^\.git/refs/heads/.+$})
end


guard 'spork', rspec_env:{'RAILS_ENV'=>'test'}, cucumber_env:{'RAILS_ENV'=>'test'} do # , bundler: false, cucumber: false
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/routes.rb')
  watch(%r{^config/environments/.+\.rb$})
  watch(%r{^config/initializers/.+\.rb$})
  watch('spec/spec_helper.rb')
  watch('spec/factories.rb')
end

guard 'bundler' do
	watch('Gemfile')
end


guard 'cucumber', cli: '--drb --require features/step_definitions --tags @focus' do
  watch(%r{^(features/.+\.feature)$})
  watch(%r{^features/support/.+$})          { 'features' }
  watch(%r{^app/(.+)\.rb$})          { 'features' }
  watch('config/routes.rb')          { 'features' }
  watch(%r{^app/views/(.+)/.*\.(erb|haml|builder)$})          { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
end


guard 'rspec', version: 2, cli: '--drb --format doc' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch('spec/factories.rb')  { "spec" }
  # Rails example
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  
  watch(%r{^app/models/(.+)\.rb$})  { |m| ["spec/models/#{m[1]}_spec.rb", "spec/requests/#{m[1]}s_spec.rb"] }
  
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('spec/spec_helper.rb')                        { "spec" }
  watch('config/routes.rb')                           { "spec/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
  # Capybara request specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml|builder)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }
end


