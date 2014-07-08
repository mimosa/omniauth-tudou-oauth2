# OmniAuth TuDou OAuth2

TuDou OAuth2 Strategy for OmniAuth 1.0.

Read TuDou OAuth2 docs for more details: http://open.tudou.com/wiki/%E6%8A%80%E6%9C%AF%E6%96%87%E6%A1%A3/%E9%AA%8C%E8%AF%81%E6%8E%88%E6%9D%83

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-tudou-oauth2'
```

Then `bundle install`.

Or install it yourself as:

    $ gem install omniauth-tudou-oauth2

## Usage

`OmniAuth::Strategies::TuDou` is simply a Rack middleware. Read the OmniAuth 1.0 docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :tudou, ENV['TUDOU_KEY'], ENV['TUDOU_SECRET']
end
```

## Authentication Hash

Here's an example *Authentication Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  :provider => 'tudou',
  :uid => '123',
  :info => {
    :nickname => 'kdgsliu',
    :name => 'kdgsliu',
    :location => '',
    :image => 'http://u4.tdimg.com/u/U-04.gif',
    :description => ''
  },
  :credentials => {
    :token => '123', # OAuth 2.0 access_token, which you may wish to store
    :expires_at => 3600, # when the access token expires (if it expires)
    :expires => true # if you request `offline_access` this will be false
  },
  :extra => {
    :raw_info => {
      ... # data from /users/myinfo.json, check by yourself
    }
  }
}
```
*PS.* Built and tested on MRI Ruby 1.9.3

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request