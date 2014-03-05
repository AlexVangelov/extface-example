listen "#{ENV['OPENSHIFT_RUBY_IP']}:#{ENV['OPENSHIFT_RUBY_PORT']}"
pid "#{ENV['OPENSHIFT_RUBY_SERVER_PID']}"
stdout_path "#{ENV['OPENSHIFT_RUBY_LOG_DIR']}/unicorn_stdout.log"
stderr_path "#{ENV['OPENSHIFT_RUBY_LOG_DIR']}/unicorn_stderr.log"

worker_processes Integer(ENV['WEB_CONCURRENCY'] || 6)
timeout 15
preload_app true

before_fork do |server, worker|
  Signal.trap 'SIGKILL' do
  end
  Signal.trap 'TERM' do
    p 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  if defined? ActiveRecord::Base
    ActiveRecord::Base.connection.disconnect!
  end

  if defined? Extface
  end
end

after_fork do |server, worker|
  Signal.trap 'SIGKILL' do
  end
  Signal.trap 'TERM' do
    p 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end

  if defined? Extface
  end
end