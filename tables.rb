require "selenium-webdriver"
require "webdrivers"
require "rspec"

describe "automating tables" do
  it "search for record" do
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to "https://demoqa.com/webtables"

    search_box = driver.find_element(id:'searchBox')

    #input last name in box
    search_box.send_keys('Gentry')

    #wait for autofill/verify record
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until { driver.find_element(css:'#app > div > div > div.row > div.col-12.mt-4.col-md-6 > div.web-tables-wrapper > div.ReactTable.-striped.-highlight > div.rt-table > div.rt-tbody > div:nth-child(1) > div > div:nth-child(1)').displayed? }
  end

  it "automates adding record" do
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to 'https://demoqa.com/webtables'

    #click add button
    add_new = driver.find_element(id:'addNewRecordButton')
    add_new.click

    #wait for modal
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until {driver.find_element(id:'registration-form-modal').displayed?}

    #fill form
    driver.find_element(id:'firstName').send_keys('Courtney')
    driver.find_element(id:'lastName').send_keys('Yi')
    driver.find_element(id:'userEmail').send_keys('courtney.lue@gmail.com')
    driver.find_element(id:'age').send_keys('30')
    driver.find_element(id:'salary').send_keys('75000')
    driver.find_element(id:'department').send_keys('QA')

    #submit
    driver.find_element(css:'#submit').click
    end


  end
