Feature: User can reserve available room
  As a user’s
  So that I can making an online reservation
  I want to filling reservation data and sending requests

Background: Startup with Homepage
  Given the following rooms exist:
  | room_id      | status      |  volume  |
  | engr303      | available   |  30      |
  | engr304      | available   |  30      |
  | engr305      | unavailable |  30      |
  | engr313      | unavailable |  50      |

  And I am on the room "engr303" status page
  And I should see "จองห้อง"
  When I follow "จองห้อง"
  Then I should be on the reserve page for "engr303" room

Scenario: reserve the engr303 with day is not today
  When I fill in "Name" with "koonoath"
  And I select "2013" from "year"
  And I select "March" from "month"
  And I select "13" from "day"
  And I check "08.00-09.30"
  And I press "จองห้อง"
  Then I should be on the reserve submit for "engr303" page
  And I should see "koonoath"

Scenario: reserve the engr303 with date is today
  When I fill in "Name" with "koonoath"
  And I select "2013" from "year"
  And I select "March" from "month"
  And I select "10" from "day"
  And I check "08.00-09.30"
  And I press "จองห้อง"
  Then I should be on the reserve page for "engr303" room
  And I should see "Cannot reserve room for today, please contact staff"
