Feature: Log In to the staff page

  As an audiovisual education, faculty of Engineering, Thammasat university
  So that I can log in to the staff page

Background: Startup with Homepage

  Given the following rooms_users exist:
  | username     | password |
  | naideekub    | honhonhon |
  | koonnongchay | milkwarm |

  And I am on the home page
  Then I should see "สำหรับเจ้าหน้าที่"
  When I follow "สำหรับเจ้าหน้าที่"
  Then I should be on the log in page

  
Scenario: Can Log In to the staff page (Happy Path)
  When I am on the log in page
  And I should see "กรุณากรอก username และ password"
  When I fill in "Username" with "naideekub"
  And I fill in "Password" with "honhonhon"
  And I press "Log In"
  Then I should be on the staff page


Scenario: Can not Log In to the staff page (Sad Path)
  When I am on the log in page
  And I should see "กรุณากรอก username และ password"
  When I fill in "Username" with "username"
  And I fill in "Password" with "password"
  And I press "Log In"
  Then I should be on the log in page
  And I should see "ไม่สามารถเข้าสู่ระบบได้"

