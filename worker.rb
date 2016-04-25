class Worker
  include Sidekiq::Worker
  
  def perform(url)
    "./tscript.sh #{url}"
  end
end

