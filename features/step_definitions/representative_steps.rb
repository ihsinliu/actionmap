# frozen_string_literal: true

Then(/^I should (not )?see the following representatives: (.*)$/) do |no, reps_list|
    reps = reps_list.split(', ')
    reps.each do |rep|
        if no.nil?
            expect(page).to have_content(rep)
        else
            expect(page).not_to have_content(rep)
        end
    end
end

When(/^I press "(.*)" button/) do |button|
    click_button button
end
