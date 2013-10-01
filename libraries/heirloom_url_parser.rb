require 'uri'
class HeirloomURLParser
  def initialize(object_uri)
    @uri = URI.parse object_uri
  end

  def bucket_prefix
    @uri.host.gsub(/-[a-z]{2}-[a-z]{4,}-\d/, '')
  end

  def id
    path[1]
  end

  def name
    path[0]
  end

  private
  def path
    @path ||= @uri.path.scan /[\w-]+/
  end

end
