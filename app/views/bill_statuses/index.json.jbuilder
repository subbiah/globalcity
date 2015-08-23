json.array!(@bill_statuses) do |bill_status|
  json.extract! bill_status, :id, :society_master_id, :building_master_id, :user_id, :bill_amt, :fy, :month, :status, :upload_status, :deletion_flag
  json.url bill_status_url(bill_status, format: :json)
end
