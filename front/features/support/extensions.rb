module CucumberExtensions  
  def save_png
    if page.driver.respond_to?(:render)
      file_path = "tmp/capybara/screenshot-#{Time.now}.png"
      page.driver.render(file_path, full: true)
      puts "saved png: #{file_path}"
    else
      puts "#{page.driver.class} do not respond to :render"
    end
  end
end
World(CucumberExtensions)