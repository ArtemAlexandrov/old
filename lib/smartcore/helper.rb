require 'base64'
module Smartcore
  module Helper

    def convert_file_to_base64(file_path)
      Base64.encode64(File.open(file_path, 'rb').read)
    end


    module_function :convert_file_to_base64
  end
end