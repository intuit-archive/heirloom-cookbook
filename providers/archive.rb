action :download do

  cmd = DownloadCommand.new.command new_resource.to_hash

  execute "Downloading Heirloom archive with cmd: '#{cmd}'" do
    command cmd
  end

  new_resource.updated_by_last_action true
end
