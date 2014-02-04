#############################################||

####### Clasificados Online Scraper #########||

########## Author: John Molina ##############||

####### Email: john@pixelhipsters.com #######||

#############################################||

# information.rb: Scrape all of the available 
# vehicles listed.

include Setup

module CoScraper
  
  module Information

    def self.included(base)
      base.extend self
    end

    # Get all vehicles in the current page
    def extract_vehicles_data
      vehicles = fetch_page.css('form table[3] tr td').map do |x|
        x.text.gsub(/\r\n/, ' ').strip
      end
    end

    # Eliminate unnecesary fields and empty fields
    def clean_vehicle_list
      cleaned_list = extract_vehicle_data.drop(8)
      cleaned_list.map { |x| cleaned_list << x unless x.empty? }
    end

    # Get the amount of pages to iterate in
    def extract_total_pages
      pag = fetch_page.css(document.css('.Ver12C')[82].text)
      pag.scan(/\d+/)[2].to_i
    end

  end

end
