if Rails.env.development?
  Rack::MiniProfiler.config.position = 'top-left'
  Rack::MiniProfiler.config.start_hidden = false
  Rack::MiniProfiler.config.enable_advanced_debugging_tools = true
end
