json.array!(@branches) do |branch|
  json.extract! branch, :id, :name, :brancheCategory_id
  json.url branch_url(branch, format: :json)
end
