:aws_access_key_id      => ENV['S3_KEY'],     # required
:aws_secret_access_key  => ENV['S3_SECRET'],  # required
:region                 => ENV['S3_REGION'],
...
:config.fog_directory =  ENV['S3_BUCKET']     # required