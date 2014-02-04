#############################################||

####### Clasificados Online Scraper #########||

########## Author: John Molina ##############||

####### Email: john@pixelhipsters.com #######||

#############################################||

# setup.rb: Contains the basic configuration
# methods.

require 'open-uri'
require 'nokogiri'

module CoScraper

  module Setup

    def self.included(base)
      base.extend self
    end

    def fetch_document(url)
      Nokogiri::HTML open url 
    end

    def based_url_for_all_vehicles
      'http://www.clasificadosonline.com/UDTransListingADV.asp?Marca=0&TipoC=0&FromYear=0&ToYear=2014&LowPrice=0&HighPrice=999999999&Submit2=Buscar+-+Go'
    end

    def fetch_page
      fetch_document( based_url_for_all_vehicles )
    end

  end

end
