require File.join(File.dirname(__FILE__), '..', 'config', 'environment')
require File.join(File.dirname(__FILE__), 'active_places_helper')
include ActivePlacesHelper

File.open(File.join(CSV_DATA_DIR, 'facilities.csv'), 'w') do |file|
  Facility.all.each do |facility|
    file.puts [facility.id, facility.site_id, facility.facility_type_id, facility.facility_sub_type_id, facility.public?].join(',')
  end
end

File.open(File.join(CSV_DATA_DIR, 'facility-types.csv'), 'w') do |file|
  FacilityType.all.each do |facility_type|
    file.puts [facility_type.id, facility_type.name].join(',')
  end
end

File.open(File.join(CSV_DATA_DIR, 'facility-sub-types.csv'), 'w') do |file|
  FacilitySubType.all.each do |facility_sub_type|
    file.puts [facility_sub_type.id, facility_sub_type.name, facility_sub_type.facility_type_id].join(',')
  end
end