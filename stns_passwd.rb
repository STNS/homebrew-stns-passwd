require 'formula'

HOMEBREW_STNS_PASSWD_VERSION='0.1.0'
class StnsPasswd < Formula
  homepage 'https://github.com/STNS/stns-passwd'
  url "https://github.com/STNS/stns-passwd/releases/download/#{HOMEBREW_STNS_PASSWD_VERSION}/stns_darwin_amd64.zip"
  sha256 '81df1a4e716ea23051c298f189f0dd6c0cb82b7377972463a1e8c1fdeacccc35'
  version HOMEBREW_STNS_PASSWD_VERSION
  head 'https://github.com/STNS/stns-passwd.git', :branch => 'master'


  if build.head?
    depends_on 'go' => :build
    depends_on 'hg' => :build
  end

  def install
    if build.head?
      ENV['GOPATH'] = buildpath
      mkdir_p buildpath/'src/github.com/STNS'
      ln_s buildpath, buildpath/'src/github.com/STNS/stns-passwd'
      system 'go', 'get', 'github.com/STNS/libnss_stns/hash'
      system 'go', 'build'
    end
    bin.install 'stns-passwd'
  end

end


