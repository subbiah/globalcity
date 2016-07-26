class BillStatus < ActiveRecord::Base
  

def self.import(file,user_id,soceity_id,month,fy)
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

          if key == "FlatNo"
            @bill.flat_id = value
          end
    end
      puts ":::::::::::::::::::::::::::::::::::::: begin"
      @prev_bill = BillStatus.where(:user_id => user_id, :society_master_id => soceity_id, :building_master_id => @bill.building_master_id, :fy => fy, :month => month, :flat_id => @bill.flat_id, :deletion_flag => "CREATED")
      if @prev_bill != []
        puts ":::::::::::::::::::::::::::::::::::::::::"
        puts "previous bill found"
        puts @prev_bill[0].inspect
        puts ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
        @prev_bill[0].deletion_flag = "DELETED"
        @prev_bill[0].save
      end

      @bill.user_id = user_id
      @bill.society_master_id = soceity_id
      @bill.month = month
      @bill.fy = fy
      @bill.status = "Due"
      @bill.deletion_flag = "CREATED"

      if @bill.bill_amt <= 0
        @bill.status = "Confirmed"
        @bill.payment_mode = "Other"
        @bill.ref_no = "Other"
        @bill.confirmed_status = "Paid"
      end

      @bill.save

      puts ":::::::::::::::::::::::::::::::::::::: end"
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
