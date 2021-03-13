require 'sidekiq-scheduler'

class ParsingScheduler
  include Sidekiq::Worker

  def perform(*args)

  end
end
