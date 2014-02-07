#############################################||

####### Clasificados Online Scraper #########||

########## Author: John Molina ##############||

####### Email: john@pixelhipsters.com #######||

#############################################||

# information.rb: Scrape all of the available 
# vehicles listed.

require_relative 'setup'

module CoScraper

  module Information
    
    include CoScraper::Setup
    
    extend self

    def setup
      Setup
    end

    # Get all vehicles in the current page
    def extract_vehicles_data
      vehicles = setup.fetch_page.css('form table[3] tr td').map do |x|
        x.text.gsub(/\r\n/, ' ').strip
      end
    end

    # Eliminate unnecesary fields and empty fields
    def clean_vehicle_list
      cleaned_list = setup.extract_vehicle_data.drop(8)
      cleaned_list.map { |x| cleaned_list << x unless x.empty? }
    end

    # Get the amount of pages to iterate in
    def extract_total_pages
      pag = setup.fetch_page.css('.Ver12C')[70].text
      pag.scan(/\d+/)[2].to_i
    end

  end

end
