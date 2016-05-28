require 'formula'

HOMEBREW_STNS_PASSWD_VERSION='0.1.0'
class StnsPasswd < Formula
  homepage 'https://github.com/STNS/stns-passwd'
  url "https://github.com/STNS/stns-passwd/releases/download/#{HOMEBREW_STNS_PASSWD_VERSION}/stns_darwin_amd64.zip"
  sha1 'b110438b0852dc3ebfa7a33be33ae087e0199024'
  version HOMEBREW_STNS_PASSWD_VERSION
  head 'https://github.com/STNS/stns-passwd.git', :branch => 'master'

  def install
    bin.install Dir['bin/*']
  end
end


