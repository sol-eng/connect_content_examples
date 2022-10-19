# publish_plumber_api.R

library(rsconnect)
library(connectapi)

# Define a client to publish to
client <- connect(
  server = Sys.getenv("CONNECT_SERVER"),
  api_key = Sys.getenv("CONNECT_API_KEY")
)

# Create a manifest file for specify app
rsconnect::writeManifest(appDir = "R/plumber",
                         verbose = TRUE)

# Create a .tar.gz to use as bundle
tar(tarfile = "plumber_api.tar.gz",
    files = c("R/plumber/plumber.R", "R/plumber/manifest.json"),
    compression = "gzip",
    tar = "tar")

# Deploy the bundle to Connect
connectapi::deploy(client,
                   name = "plumber_api_example",
                   bundle_path("plumber_api.tar.gz"))
