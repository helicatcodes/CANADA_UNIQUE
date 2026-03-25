namespace :tasks do
  desc "Import tasks from Excel file on Cloudinary"
  task import: :environment do
    puts "Starting task import..."
    TaskImporter.new.call
    puts "Done."
  end
end
