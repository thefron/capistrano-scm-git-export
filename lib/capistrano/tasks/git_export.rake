namespace :git_export do
  archive_name = 'archive.tar.gz'

  desc 'Archive files to #{archive_name}'
  sh "git archive #{fetch(:branch)} --format=tar | bzip2 > #{archive_name}"

  desc 'Deploy #{archive_name} to release_path'
  task :deploy => archive_name do |t|
    tarball = t.prerequisites.first
    on roles :all do

      # Make sure the release directory exists
      execute :mkdir, '-p', release_path

      # Create a temporary file on the server
      tmp_file = capture('mktemp')

      # Upload the archive, extract it and finally remove the tmp_file
      upload!(tarball, tmp_file)
      execute :tar, '-xvf', tmp_file, '-C', release_path
      execute :rm, tmp_file
    end

    Rake::Task['git_export:clean'].invoke

  end

  task :clean do |t|
    # Delete the local archive
    File.delete archive_name if File.exists? archive_name
  end

  task :create_release => :deploy

  task :check

  task :set_current_revision
end
