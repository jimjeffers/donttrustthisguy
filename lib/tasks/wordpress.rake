namespace :wordpress do
  desc "Import wordpress data."
  task :import_posts => :environment do
    WpPost.all.each do |p|
      Post.create({ :url => p.guid,
                    :title => p.post_title,
                    :content => p.post_content,
                    :created_at => p.post_date,
                    :updated_at => p.post_date,
                    :slug => p.post_name}) if p.post_type =="post" and p.post_status == "publish"
    end
  end
end