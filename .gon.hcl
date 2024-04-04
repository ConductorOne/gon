source = ["./dist/macos_darwin_amd64_v1/gon"]
bundle_id = "com.conductorone.gon"

apple_id {
  username = "justin.gallardo@conductorone.com"
}

sign {
  application_identity = "Developer ID Application: Justin Gallardo (858DKH55XL)"
}

zip {
  output_path = "./dist/gon-darwin-amd64.signed.zip"
 }
