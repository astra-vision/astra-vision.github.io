# jekyll-imagemagick 1.4 invokes `convert`, which is a disk utility on Windows.
# ImageMagick 7 provides image conversion through `magick` instead.
require 'jekyll-imagemagick'

if Gem.win_platform?
  module WindowsImagemagickCommand
    def run_cmd(command)
      super(command.sub(/\Aconvert(?=\s)/, 'magick'))
    end
  end

  JekyllImagemagick::ImageConvert.singleton_class.prepend(WindowsImagemagickCommand)
end
