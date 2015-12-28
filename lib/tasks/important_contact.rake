desc "important contact excel"
require 'roo'

task :impcont => :environment do

  puts"read excel"
  # s = Roo::Spreadsheet.open('/DataCreation.xls', extension: :xls)
  xlsx = Roo::Excel.new("public/ImportantContact.xls")
  xlsx.each_with_pagename do |name, sheet|
    lastrow = sheet.last_row
    # puts name
    (2..lastrow).each do |row|
     imcont = ImportantContact.new
      sheet.row(row).each_with_index do |a, index|
        if index == 3
       imcont.name =  a.to_s
        elsif index == 1
         imcont.phno = a.to_s
        elsif index == 2
           imcont.email = a.to_s
        end   
      end
     imcont.save
    end
  end
end