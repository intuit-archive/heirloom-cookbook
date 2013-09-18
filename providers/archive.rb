action :download do

  cmd = DownloadCommand.new.command new_resource.to_hash
  id = new_resource.id || "latest"

  execute "Downloading Heirloom archive: #{new_resource.name}/#{id}" do
    command cmd
  end

  new_resource.updated_by_last_action true
end
