actions :download
default_action :download

attribute :aws_access_key,  :kind_of => String
attribute :aws_secret_key,  :kind_of => String
attribute :bucket_prefix,   :kind_of => String
attribute :environment,     :kind_of => String
attribute :id,              :kind_of => String
attribute :level,           :kind_of => String
attribute :metadata_region, :kind_of => String
attribute :name,            :kind_of => String, :required => true, :name_attribute => true
attribute :output,          :kind_of => String
attribute :region,          :kind_of => String
attribute :secret,          :kind_of => String
attribute :secret_file,     :kind_of => String
attribute :use_iam_profile, :kind_of => [ TrueClass, FalseClass ], :default => false
attribute :extract,         :kind_of => [ TrueClass, FalseClass ], :default => false
