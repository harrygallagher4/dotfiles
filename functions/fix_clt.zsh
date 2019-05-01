# fixes some library issues with xcode command line tools
# run after upgrading them
function fix_clt {
  sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
}

