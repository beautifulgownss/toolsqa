require "selenium-webdriver"
require "webdrivers"
require "rspec"

describe "automating buttons" do
  it "clicks buttons" do
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to "https://demoqa.com/buttons"

    double_btn = driver.find_element(id:'doubleClickBtn')
    driver.action.double_click(double_btn).perform

    wait = Selenium::WebDriver::Wait.new(timeout: 5)
    wait.until { driver.find_element(id:'doubleClickMessage').displayed? }

    right_btn = driver.find_element(id:'rightClickBtn')
    driver.action.context_click(right_btn).send_keys(
        :arrow_down).send_keys(
        :arrow_down).send_keys(
        :arrow_down).send_keys(
        :enter).perform

    wait = Selenium::WebDriver::Wait.new(timeout: 5)
    wait.until { driver.find_element(id:'rightClickMessage').displayed? }

    #TODO find the right locator for a dynamic button
    dynamic = driver.find_element(xpath:'//*[@id="lkZMz"]')
    dynamic.click


    wait = Selenium::WebDriver::Wait.new(timeout: 15)
    wait.until { driver.find_element(id:'dynamicClickMessage').displayed? }

  end
end
