@category1 = Category.create(name:"アジア")

category1s = ["日本","中国"]

category1s.each do |category|
 @category1.children.create(name:"#{category}")
end