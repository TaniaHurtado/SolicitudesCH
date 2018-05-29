class Informe < ApplicationRecord
	mount_uploader :archivo, InformeUploader
	#has_one_attached :file
end
