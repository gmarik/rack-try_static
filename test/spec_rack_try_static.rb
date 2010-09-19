require 'test/spec'

require 'rack'
require 'rack/contrib/try_static'
require 'rack/mock'

class DummyApp
  def call(env)
    [200, {}, ["Hello World"]]
  end
end


def request(options = {})
  options.merge!({
    :urls => %w[/],
    :root => ::File.expand_path(::File.dirname(__FILE__)),
  })

  @request = 
    Rack::MockRequest.new(
      Rack::TryStatic.new( 
        DummyApp.new, options))
end

describe "Rack::TryStatic" do
  context 'when tries fail' do
    it 'should not serve' do
      res = request(:try => ['html']).get('/documents')
      res.should.be.ok
      res.body.should == "Hello World"
    end
  end

  context 'when tries succeed' do
    it 'should serve first found' do
      res = request(:try => ['.html', '/index.html', '/index.htm']).get('/documents')
      res.should.be.ok
      res.body.strip.should == "index.html"
    end
  end

  context 'when tries not needed' do
    it 'should serve existing' do
      res = request(:try => ['/index.html']).get('/documents/existing.html')
      res.should.be.ok
      res.body.strip.should == "existing.html"
    end
  end

end
