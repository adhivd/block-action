require "application_system_test_case"

class LawsuitsTest < ApplicationSystemTestCase
  setup do
    @lawsuit = lawsuits(:one)
  end

  test "visiting the index" do
    visit lawsuits_url
    assert_selector "h1", text: "Lawsuits"
  end

  test "creating a Lawsuit" do
    visit lawsuits_url
    click_on "New Lawsuit"

    fill_in "Completed", with: @lawsuit.completed
    fill_in "Deadline", with: @lawsuit.deadline
    fill_in "Description", with: @lawsuit.description
    fill_in "Eligibility", with: @lawsuit.eligibility
    fill_in "Name", with: @lawsuit.name
    fill_in "Settlement", with: @lawsuit.settlement
    fill_in "User", with: @lawsuit.user_id
    click_on "Create Lawsuit"

    assert_text "Lawsuit was successfully created"
    click_on "Back"
  end

  test "updating a Lawsuit" do
    visit lawsuits_url
    click_on "Edit", match: :first

    fill_in "Completed", with: @lawsuit.completed
    fill_in "Deadline", with: @lawsuit.deadline
    fill_in "Description", with: @lawsuit.description
    fill_in "Eligibility", with: @lawsuit.eligibility
    fill_in "Name", with: @lawsuit.name
    fill_in "Settlement", with: @lawsuit.settlement
    fill_in "User", with: @lawsuit.user_id
    click_on "Update Lawsuit"

    assert_text "Lawsuit was successfully updated"
    click_on "Back"
  end

  test "destroying a Lawsuit" do
    visit lawsuits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lawsuit was successfully destroyed"
  end
end
