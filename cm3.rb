require 'formula'

class Cm3 < Formula
  desc 'Critical Mass Modula-3'
  homepage 'http://modula3.org/'
  url 'http://www.opencm3.net/releng/cm3-bin-core-AMD64_DARWIN-5.8.5-RC5.tgz'
  sha256 'd4cb63c69b1d8160680f64fec75a201915da4e49c5ceda19cd6e34c2ddd0efdd'

  depends_on :arch => :x86_64

  def install
    system './cminstall', prefix

    inreplace bin/'cm3.cfg', 'path()', "\"#{bin}\""

    # Note: the cm3.cfg file has to be in same directory as cm3.
    # Do not install bin/config/ because we edited cm3.cfg to point
    # to it in the Cellar and don't need it in bin.
    bin.install Dir['bin/cm3',
                    'bin/cm3.cfg',
                    'bin/cm3cg',
                    'bin/cm3ide',
                    'bin/m3bundle',
                    'bin/m3cggen',
                    'bin/mklib']
    share.install prefix/'man'
  end
end
