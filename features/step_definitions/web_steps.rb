# frozen_string_literal: true

require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'support', 'paths'))
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'support', 'selectors'))

module WithinHelpers
    def with_scope(locator, &block)
        locator ? within(*selector_for(locator), &block) : yield
    end
end
World(WithinHelpers)

Given(/^(?:|I )am on (.+)$/) do |page_name|
    visit path_to(page_name)
end

When(/^(?:|I )go to (.+)$/) do |page_name|
    visit path_to(page_name)
end

When(/^(?:|I )press "([^"]*)"$/) do |button|
    click_button(button)
end

When(/^(?:|I )follow "([^"]*)"$/) do |link|
    click_link(link)
end

When(/^(?:|I )fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
    fill_in(field, with: value)
end

Then(/^(?:|I )should see "([^"]*)"$/) do |text|
    if page.respond_to? :should
        page.should have_content(text)
    else
        assert page.has_content?(text)
    end
end

Then(/^(?:|I )should not see "([^"]*)"$/) do |text|
    if page.respond_to? :should
        page.should have_no_content(text)
    else
        assert page.has_no_content?(text)
    end
end

When(/^(?:|I )press "([^"]*)"$/) do |button|
    click_button(button)
end
