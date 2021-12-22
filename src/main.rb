require 'watir'

Watir.default_timeout = 0.5

def get_all_links(browser)
  links = []
  tds = browser.tds
  tds.each_with_index do |td, i|
    begin
      p "Checking element #{i+1} / #{tds.length}"
      links << td.link.href
    rescue
      next
    end
  end
  links
end

def get_site_with_answers(link, browser)
  browser.goto link
  puts browser.title
  browser.execute_script("[...document.querySelectorAll('ins')].map(e => {e.parentNode.removeChild(e)})")
  buttons = browser.buttons(class: "large button")
  buttons.each do |button|
    if button.text == "Check answers"
      button.click
    end
  end
  browser
end

def get_content_and_store_locally(links, browser)
  links.each do |link|
    current_site = get_site_with_answers(link, browser)
    store_file(current_site)
  end
end

def store_file(current_site)
  generate_file_name = "output/#{current_site.title.gsub("/", "-").gsub(" | ", "").gsub(" ","_")}-#{Time.now.to_i}.html"
  File.open(generate_file_name, 'w') {|f| f.write current_site.html }
end

def main
  browser = Watir::Browser.new
  page_url = "http://whyfund.net/RUBY%20Programming/"

  browser.goto page_url
  links = get_all_links(browser)
  get_content_and_store_locally(links, browser)

  browser.close
end
 

main()
