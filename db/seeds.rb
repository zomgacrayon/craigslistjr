category_name = ["sport", "economy", "politic", "health", "entertainment"]

category_name.each do |category|
  # puts category
  Category.create(name: category)
end
