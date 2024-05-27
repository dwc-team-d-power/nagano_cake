Admin.create!(
   email: "admin@admin",
   password: "testtest"
)

Admin.find_or_create_by(id: 1) do |admin|
  admin.email = "admin@admin"
  admin.encrypted_password = "testtest"
end