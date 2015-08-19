desc "Read excel"
require 'roo'

task :readExcel => :environment do

  puts"read excel"

  # s = Roo::Spreadsheet.open('/DataCreation.xls', extension: :xls)

  xlsx = Roo::Excel.new("public/DataCreation.xls")

  xlsx.each_with_pagename do |name, sheet|
    lastrow = sheet.last_row
    # puts name
    
   if name ==  "township_masters"
     TownshipMaster.delete_all     
    (2..lastrow).each do |row|
      data = TownshipMaster.new
      sheet.row(row).each_with_index do |a, index|
        if index == 0
        data.townshipname = a
        elsif index == 1
          data.activeflag = a
        elsif index == 2
          data.address1 = a
        end         
      end
      data.save
    end
    puts "township_masters end"
   end
    
   if name ==  "association_masters"
     AssociationMaster.delete_all
    (2..lastrow).each do |row|
      data = AssociationMaster.new
      sheet.row(row).each_with_index do |a, index|
        if index == 0
        data.associationname = a
        elsif index == 1
          data.township_master_id = a
        end         
      end
      data.save
    end
    puts "association_masters end"
   end
    
   if name ==  "society_masters"
     SocietyMaster.delete_all
    (2..lastrow).each do |row|
      data = SocietyMaster.new
      sheet.row(row).each_with_index do |a, index|
      if index == 0
        data.societyname = a
        elsif index == 1
        data.association_master_id = a        
      end
      end
      data.save
    end
    puts "society_masters end"
   end
    
   if name ==  "building_masters"
     BuildingMaster.delete_all
    (2..lastrow).each do |row|
      data = BuildingMaster.new
    sheet.row(row).each_with_index do |a, index|
        if index == 0
        data.buildinname = a
        elsif index == 1
          data.society_master_id = a
        elsif index == 2
          data.activeflag = a
        end         
      end
      data.save
    end
    puts "building_masters end"
   end
    
   if name ==  "flat_master"
     Flat.delete_all
    (2..lastrow).each do |row|
      data = Flat.new
      sheet.row(row).each_with_index do |a, index|
        if index == 0
        data.flat = a
        elsif index == 1
          data.flat_types = a
        elsif index == 2
          data.building_master_id = a
        elsif index == 3
          data.active_flag = a
        end         
      end
      data.save
    end
    puts "flat_masters end"
   end
   
    if name == "society_member_masters"
      SocietyMemberMaster.delete_all
    (2..lastrow).each do |row|
      data = SocietyMemberMaster.new
      sheet.row(row).each_with_index do |a, index|
        if index == 0
        data.society_master_id = a
        elsif index == 1
          data.flat_id = a
        elsif index == 2
          data.fullname = a
        elsif index == 3
          data.mobileno = a
        elsif index == 4
          data.ownertype = a
        elsif index == 5
          data.membertyper = a
        elsif index == 6
          data.activeflag = a
        end         
      end
      data.save
    end
    puts "society_member_masters end"
   end
 
  end
end