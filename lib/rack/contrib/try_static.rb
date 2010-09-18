require 'rack/static'

module ::Rack
  class TryStatic < Static

    def initialize(app, options)
      super
      @try = ([''] + Array(options.delete(:try)) + [''])
    end

    def call(env)
      @next = 0
      while @next < @try.size && 404 == (resp = super(try_next(env)))[0] 
        @next += 1
      end
      404 == resp[0] ? @app.call : resp
    end

    private
    def try_next(env)
      env.merge('PATH_INFO' => env['PATH_INFO'] + @try[@next])
    end
  end
end
