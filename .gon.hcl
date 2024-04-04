source = ["./dist/macos_darwin_amd64_v1/gon"]
bundle_id = "com.conductorone.gon"

apple_id {
  username = "justin.gallardo@conductorone.com"
  password = @env:AC_PASSWORD
}

sign {
  application_identity = "Developer ID Application: Justin Gallardo (858DKH55XL)"
}

zip {
  output_path = "./dist/gon_macos.zip"
}
