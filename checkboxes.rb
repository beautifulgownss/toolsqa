require "selenium-webdriver"
require "webdrivers"
require "rspec"

describe "automating checkboxes" do
  it "opens checkbox menu, clicks all buttons, unchecks all checkboxes" do
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to "https://demoqa.com/checkbox"
    driver.find_element(css:'#tree-node > ol > li > span > button').click

    wait = Selenium::WebDriver::Wait.new(timeout: 5)
    wait.until { driver.find_element(css:'#tree-node > ol > li > ol > li:nth-child(1) > span').displayed? }

    driver.find_element(css:'#tree-node > ol > li > ol > li:nth-child(1) > span > label > span.rct-checkbox').click
    driver.find_element(css:'#tree-node > ol > li > ol > li:nth-child(2) > span > label > span.rct-checkbox').click
    driver.find_element(css:'#tree-node > ol > li > ol > li:nth-child(3) > span > label > span.rct-checkbox').click

    driver.find_element(css:'#tree-node > ol > li > span > label > span.rct-checkbox').click

  end
end
