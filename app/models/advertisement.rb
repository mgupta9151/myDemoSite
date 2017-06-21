class Advertisement < ApplicationRecord
	mount_uploader :image ,ImageUploader
end
