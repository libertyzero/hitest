Feature: Specify time to reserve room in case daily reserve

  As an audiovisual education, faculty of Engineering, Thammasat university
  So that I can reserve room
  I want to fill data and specify time to reserve room to database

Background: Startup with Staffpage
  
  Given the following rooms exist:
  | room_id      | status      |  volume  |
  | engr303      | available   |  30      |
  | engr304      | available   |  30      |
  | engr313      | unavailable |  50      |

  And I am on the staff page
  And I should see "ค้นหาห้องว่าง"
  When I follow "ค้นหาห้องว่าง"
  Then I should be on the search page

Scenario: Fill data and specify appropriate time to reserve room
  When I fill in "Room_id" with "engr303"
  And I press "ค้นหา"
  Then I should be on the search_result page
  And I should see "engr303"

Scenario: Fill data and specify inappropriate time to reserve room
  When I fill data into the form
  And I specify inappropriate time to reserve
  And I press "จองห้อง"
  Then I should be on the reserve page
  And I should see "ไม่สามารถจองห้องได้เนื่องจากช่วงเวลาไม่เหมาะสม"



