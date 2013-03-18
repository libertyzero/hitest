Feature: See room detail
  As a Staff’s
  So that I can making an online reservation
  I want to filling reservation data and sending requests

Background: Startup with Homepage

  Given the following detail_rooms exist:
  | roomname     | amount    | 
  | ENGR303      | 30        |
  | ENGR304      | 30        |
  
  Given the following rooms exist:
  | roomname     | day       | 
  | ENGR303      | monday    |
  | ENGR303      | tuesday   |
  | ENGR303      | wednesday |
  | ENGR303      | thursday  |
  | ENGR303      | friday    |
  | ENGR303      | saturday  |
  | ENGR303      | sunday    |

  Given the following staff exist:
  | username     | password |
  | naidkub      | honhon   |

  And I am on the log in page
  When I login with "naidkub" and "honhon"
  Then I should be on the staff page
  When I follow "Room list"
  Then I should be on the room list page
  When I follow "ดูสถานะห้อง ENGR303"
  Then I should be on the "ENGR303" room detail page

Scenario: See room detail
  When I am on the "ENGR303" room detail page
  Then I should see "ENGR303"
  And I should see 7 days



