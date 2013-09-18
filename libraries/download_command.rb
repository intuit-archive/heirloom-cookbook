class DownloadCommand

  def command(args)
    opts = []

    unless args[:name] && args[:output]
      raise ArgumentError, "Name and Output required"
    end

    opts << "--aws-access-key #{args[:aws_access_key]}" if args[:aws_access_key]
    opts << "--aws-secret-key #{args[:aws_secret_key]}" if args[:aws_secret_key]
    opts << "-b #{args[:bucket_prefix]}"                if args[:bucket_prefix]
    opts << "-e #{args[:environment]}"                  if args[:environment]
    opts << "-i #{args[:id]}"                           if args[:id]
    opts << "-l #{args[:level]}"                        if args[:level]
    opts << "-m #{args[:metadata_region]}"              if args[:metadata_region]
    opts << "-n #{args[:name]}"                         # required
    opts << "-o #{args[:output]}"                       # required
    opts << "-r #{args[:region]}"                       if args[:region]
    opts << "-s #{args[:secret]}"                       if args[:secret]
    opts << "--secret-file #{args[:secret_file]}"       if args[:secret_file]
    opts << "--use-iam-profile"                         if args[:use_iam_profile]
    opts << "-x"                                        if args[:extract]

    cmd = "heirloom download "
    cmd << opts.join(' ')
  end

end
