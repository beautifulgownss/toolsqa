require "selenium-webdriver"
require "webdrivers"
require "rspec"

describe "automating radio buttons" do
  it "" do
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to "https://demoqa.com/radio-button"
    yes = driver.find_element(css:'#app > div > div > div.row > div.col-12.mt-4.col-md-6 > div:nth-child(1) > div:nth-child(2) > label')
    yes.click

    wait = Selenium::WebDriver::Wait.new(timeout: 5)
    wait.until { driver.find_element(class:'text-success').displayed? }

    impressive = driver.find_element(css:'#app > div > div > div.row > div.col-12.mt-4.col-md-6 > div:nth-child(1) > div:nth-child(3)')
    impressive.click

    wait = Selenium::WebDriver::Wait.new(timeout: 5)
    wait.until { driver.find_element(class:'text-success').displayed? }
  end
end
