require 'hpricot'

module ActivePlacesHelper
  
  USER_AGENT = 'http://chrisroos.co.uk (chris@seagul.co.uk)'
  ACTIVE_PLACES_COOKIE_FILE = File.join(Rails.root, 'tmp', 'activeplaces.cookie')

  SEED_DATA_DIR             = File.join(Rails.root, 'data')
  DOWNLOAD_DATA_DIR         = ENV['DATA_DIR'] || File.join(Rails.root, 'data', 'downloads')
  CSV_DATA_DIR              = File.join(Rails.root, 'data', 'csv')
  SEARCH_FORM_HTML_FILE     = File.join(DOWNLOAD_DATA_DIR, 'search-form.html')
  SEARCH_RESULTS_DIRECTORY  = File.join(DOWNLOAD_DATA_DIR, 'search-results')
  SITE_DETAILS_DIRECTORY    = File.join(DOWNLOAD_DATA_DIR, 'site-details')
  
  FileUtils.mkdir_p DOWNLOAD_DATA_DIR
  FileUtils.mkdir_p SEARCH_RESULTS_DIRECTORY
  FileUtils.mkdir_p SITE_DETAILS_DIRECTORY
  
  def curl(url)
    unless File.exists?(ACTIVE_PLACES_COOKIE_FILE) # Get the cookie if we don't have it yet
      `curl "http://activeplaces.com/Index_lowgraphic.asp" -c"#{ACTIVE_PLACES_COOKIE_FILE}" -A"#{USER_AGENT}" -s`
    end
# puts url
    `curl "#{url}" -b"#{ACTIVE_PLACES_COOKIE_FILE}" -A"#{USER_AGENT}" -s`
  end
  
  def create_file_with_metadata(filename, data)
    datetime = Time.now.strftime("%Y%d%m%H%M%S")
    File.open(filename, 'w') { |f| f.puts(data) }
    File.open("#{filename}.updated_at", 'w') { |f| f.puts(datetime) }
  end
  
end