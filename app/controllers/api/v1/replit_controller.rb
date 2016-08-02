require 'openssl'
require 'date'
require 'base64'

class Api::V1::ReplitController < ApiController
  def show
    render json: gen_token, status: :ok
  end

  private

  # method from Repl.it API docs
  # https://repl.it/site/blog/api-docs
  def gen_token
    digest = OpenSSL::Digest.new('sha256')
    secret = ENV['REPLIT_SECRET_KEY']
    time_created = Time.now.to_i * 1000 # convert to ms
    hmac = OpenSSL::HMAC.digest(digest, secret, time_created.to_s)

    {
      msg_mac: Base64.encode64(hmac).strip,
      time_created: time_created
    }
  end
end
