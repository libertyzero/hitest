Feature: delete room data

  As an audiovisual education, faculty of Engineering, Thammasat university
  So that I can delete room data
  I want to delete room data


Scenario: can delete room data that want to delete

  Given the following rooms exist:
  | room_id      | status      |  volume  |
  | engr303      | available   |  30      |
  | engr304      | available   |  30      |
  | engr305      | unavailable |  30      |
  | engr313      | unavailable |  50      |

  And I am on the room "engr303" status page for staff
  Then I should see "Delete"
  When I press "Delete"
  Then I should see "Are you sure?"
  When I press "ok"
  Then I should be on staff page 
  And I should see "Room "engr303" was successfully deleted."





