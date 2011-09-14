require File.join(File.dirname(__FILE__), '..', 'config', 'environment')
require File.join(File.dirname(__FILE__), 'active_places_helper')
include ActivePlacesHelper

%%
select sites.id, sites.name, sites.telephone, sites.address 
from sites 
inner join facilities 
on sites.id = facilities.site_id 
where facilities.public = true 
group by sites.id, sites.name, sites.telephone, sites.address;
%

sites = Site.find(:all, :include => [:facilities], :conditions => 'facilities.public = true AND latitude is not null')

xml = Builder::XmlMarkup.new
xml.instruct! :xml
xml.kml(:xmlns => "http://earth.google.com/kml/2.2", 'xmlns:atom' => "http://www.w3.org/2005/Atom") do
  xml.Document {
    xml.name
    sites.each do |site|
      xml.Placemark() {
        xml.name(site.name.titleize)
        xml.description "#{site.address}\n#{site.telephone}\n#{site.facilities.collect { |f| f.facility_type.name }.uniq.join("\n")}"
        xml.Point {
          xml.coordinates "#{site.longitude},#{site.latitude}"
        }
      }
    end
  }
end

f = File.new('activeplaces.kml', 'w')
f.write(xml.target!)
f.close