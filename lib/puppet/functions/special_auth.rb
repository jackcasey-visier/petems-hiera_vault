require 'vault'

def authenticate(type, config, client)

  auth_types = {
    'aws_iam' => method(:aws_iam_auth)
  }

  auth_types[type].(config, client)

  client

end


def aws_iam_auth(config, client)

  role = config['role']

  client.auth.aws_iam(role, Aws::InstanceProfileCredentials.new)

  client

end
