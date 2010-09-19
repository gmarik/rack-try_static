require 'rack/static'

module ::Rack
  class TryStatic

    def initialize(app, options)
      @app = app
      @static = ::Rack::Static.new(lambda {[404, {}, []]}, options)
      @try = ([''] + Array(options.delete(:try)) + [''])
    end

    def call(env)
      @next = 0
      while @next < @try.size && 404 == (resp = @static.call(try_next(env)))[0] 
        @next += 1
      end
      404 == resp[0] ? @app.call(env) : resp
    end

    private
    def try_next(env)
      try_path = env['PATH_INFO'] + @try[@next]
      env.merge('PATH_INFO' => try_path)
    end
  end
end
