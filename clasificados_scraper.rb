require 'open-uri'
require 'nokogiri'

# Fetch HTML document
document =  Nokogiri::HTML( 
	open 'http://www.clasificadosonline.com/UDTransListingADV.asp?Marca=0&TipoC=0&FromYear=0&ToYear=2014&LowPrice=0&HighPrice=999999999&Submit2=Buscar+-+Go'
)

# Extract data
document.css('form table[3] tr[2] td').map do |x| 
	x.text.gsub(/\r\n/, ' ').strip
end

# Get all links
document.css('form table[3] tr a').map do |x| 
	x[:href]
end

# Get all text
document.css('form table[3] tr td').map do |x| 
	x.text.gsub(/\r\n/, ' ').strip
end # => Array Object

# Drop unnecesary data
document_text.drop(8)

# Add data into new array and eliminate empty ones
cleaned_data = []
document_text.map do |x| 
	cleaned_list << x unless x == ""
end

# Get amount of pages
page_count = document.css('.Ver12C')[82].text

# Extract amount of pages
page_count.scan(/\d+/)[2]


# Extract links
document_links = document.css('form table[3] tr a').map do |x|
	x[:href]
end

cleaned_links = document_links.map do |x| 
	x unless !!(/PartnersListing/ =~ x)
end
cleaned_links = cleaned_links.delete_if {|x| x.nil? }
