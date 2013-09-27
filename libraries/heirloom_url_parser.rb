require 'uri'
class HeirloomURLParser
  def initialize(object_uri)
    @uri = URI.parse object_uri
  end

  def bucket(region)
    strip_region @uri.host,region

  end

  def id
    path[2].split(".")[0]
  end

  def name
    path[1]
  end

  private
  def path
    @uri.path.split("/")
  end

  def strip_region(bucket,region)
    bucket.gsub("-#{region}","")
  end
end
