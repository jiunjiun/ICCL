class Banner < ActiveRecord::Base

    mount_uploader :file, BannerUploader

    # #one convenient method to pass jq_upload the necessary information
    include Rails.application.routes.url_helpers
    def to_jq_upload
        {
            "id"          => self.id,
            "name"        => read_attribute(:name),
            "size"        => read_attribute(:size),
            "url"         => self.file_url(),
            "small_url"   => self.file_url(:small),
            "index"       => self.index,
            "delete_url"  => admin_banner_path(self),
            "delete_type" => "DELETE"
        }
    end

    before_save :update_banner_attributes

    private
    def update_banner_attributes
        if file.present? && file_changed?
          self.name         = file.file.filename
          self.size         = file.file.size
          self.content_type = file.file.content_type

          index = Banner.maximum(:index)
          if index.nil?
            self.index        = 1
          else
            self.index        = index + 1
          end

        end
    end
end
