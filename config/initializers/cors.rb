# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # Allow all origins for development. Restrict in production.

    resource '*',
      headers: %w[Authorization Content-Type Accept],
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      expose: ['Authorization'] # Optional: exposes Authorization header in response
  end
end
