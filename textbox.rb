require "selenium-webdriver"
require "webdrivers"
require "rspec"

describe "automating a form " do
  it "it fills out a form" do
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to "https://demoqa.com/text-box"

    driver.find_element(id:"userName").send_keys('Courtney Yi')
    driver.find_element(id:'userEmail').send_keys('courtney@gmail.com')
    driver.find_element(id:'currentAddress').send_keys('3446 Lantern View Lane Scottdale, Ga 30079')
    driver.find_element(id:'permanentAddress').send_keys('3446 Lantern View Lane Scottdale, Ga 30079')

  end
end
