require 'sidekiq-scheduler'

class ParsingScheduler
  include Sidekiq::Worker

  def perform(page = 1)
    puts "----------- STARTED PARSING ------------"
    ParsingDataService.parsing_hacker_news(page)
    puts "----------- END PARSING ------------"
  end
end
