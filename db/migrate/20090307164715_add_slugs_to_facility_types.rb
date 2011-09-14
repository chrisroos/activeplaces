class AddSlugsToFacilityTypes < ActiveRecord::Migration
  
  def self.up
    add_column :facility_types, :slug, :string
    
    FacilityType.find(:all).each do |facility_type|
      facility_type.update_attributes!(:slug => facility_type.filename_friendly_name)
    end
  end

  def self.down
    remove_column :facility_types, :slug
  end
  
end