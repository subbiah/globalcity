class BillStatus < ActiveRecord::Base
  

def self.import(file)
  puts "3333333333333333333333333333333333333333"
  puts file.original_filename
  spreadsheet = open_spreadsheet(file)
    # spreadsheet  = Roo::Excel.new(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    puts row['bill amt']
    @bill = BillStatus.new
    row.each do |key, value|
          puts key
          if key == "BuildingNo"
            @bill.building_master_id = value
          end
          if key == "BillAmount"
            @bill.bill_amt = value
          end
          
          @bill.user_id = "4"
          @bill.society_master_id = "5"
          @bill.month = "jan"
          @bill.save
          
    end
  end
end

def self.open_spreadsheet(file)
 case File.extname(file.original_filename)
   when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
   when '.xls' then Roo::Excel.new(file.path, :ignore)
   when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
   else raise "Unknown file type: #{file.original_filename}"
  end
end



end
