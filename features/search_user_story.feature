Feature: Searching for room status and free time
  As a user’s and staff
  So that I can see every room status
  I want to see room details and free time from database

Background: Startup with Homepage

 Given the following detail_rooms exist:
  | roomname     | amount    | 
  | ENGR303      | 30        |
  | ENGR304      | 30        |
  
  Given the following rooms exist:
  | roomname     | day       | first | second | third | fourth | fifth | sixth | seventh | eighth |
  | ENGR303      | monday    | free  |  free  | busy  | free   | free  | busy  | free    |  free  |
  | ENGR303      | tuesday   | free  |  free  | busy  | free   | free  | busy  | free    |  free  |
  | ENGR303      | wednesday | free  |  free  | busy  | free   | free  | busy  | free    |  free  |
  | ENGR303      | thursday  | free  |  free  | busy  | free   | free  | busy  | free    |  free  |
  | ENGR303      | friday    | free  |  free  | busy  | free   | free  | busy  | free    |  free  |
  | ENGR303      | saturday  | free  |  free  | busy  | free   | free  | busy  | free    |  free  |
  | ENGR303      | sunday    | free  |  free  | busy  | free   | free  | busy  | free    |  free  |

  And I am on the home page
  And I should see "ค้นหาห้องว่าง"
  When I follow "ค้นหาห้องว่าง"
  Then I should be on the search page

Scenario: Search base on volume
  When I fill in "Volume" with "20"
  And I press "ค้นหา"
  Then I should be on the search_result page
  And I should see "engr303"
  And I should see "engr304"

Scenario: Not fill all data
  When I fill in "Volume" with ""
  And I fill in "Room_id" with ""
  And I press "ค้นหา"
  Then I should be on the search page
  And I should see "please insert room name or volume"

Scenario: Not found room with match volume
  When I fill in "Volume" with "100"
  And I fill in "Room_id" with ""
  And I press "ค้นหา"
  Then I should be on the search page
  And I should see "Not found"



