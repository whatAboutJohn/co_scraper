#############################################||

####### Clasificados Online Scraper #########||

########## Author: John Molina ##############||

####### Email: john@pixelhipsters.com #######||

#############################################||

# Dir['co_scraper/*'].map do |file|
#   require file
#   p file + ' added.'
# end

require_relative 'co_scraper/vehicles/information'
require_relative 'co_scraper/version'

module CoScraper
  
  extend self

  include CoScraper::Information
  
  p Information.extract_total_pages

end
