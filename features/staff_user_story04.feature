Feature: Modify room data

  As an audiovisual education, faculty of Engineering, Thammasat university
  So that I can modify room data
  I want to modify room data in database

Background: Startup with Staffpage

  Given the following detail_rooms exist:
  | roomname     | amount    | 
  | ENGR303      | 30        |
  | ENGR304      | 30        |

  Given the following staff exist:
  | username     | password |
  | naidkub      | honhon   |

  Given the following rooms exist:
  | roomname     | day       | first | second | third | fourth | fifth | sixth | seventh | eighth |
  | ENGR303      | monday    | free  |  free  | busy  | free   | free  | busy  | free    |  free  |
  | ENGR303      | tuesday   | free  |  free  | busy  | free   | free  | busy  | free    |  free  |
  | ENGR303      | wednesday | free  |  free  | busy  | free   | free  | busy  | free    |  free  |
  | ENGR303      | thursday  | free  |  free  | busy  | free   | free  | busy  | free    |  free  |
  | ENGR303      | friday    | free  |  free  | busy  | free   | free  | busy  | free    |  free  |
  | ENGR303      | saturday  | free  |  free  | busy  | free   | free  | busy  | free    |  free  |
  | ENGR303      | sunday    | free  |  free  | busy  | free   | free  | busy  | free    |  free  |

  Given the following tools exist:
  | roomname     | amplifier | microphone | computer | overhead_projector | lcd_projector | television | voice_recorder | video_recorder | visualizer | loudspeaker |
  | ENGR303      | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |

  And I am on the log in page
  When I login with "naidkub" and "honhon"
  Then I should be on the staff page
  When I follow "Room list"
  Then I should be on the room list page

Scenario: Modify room data in database 
  When I follow "ดูสถานะห้อง ENGR303"
  Then I should be on the "ENGR303" room detail page
  When I follow "แก้ไขข้อมูลห้อง ENGR303"
  Then I should be on the edit room "ENGR303" page
  And I should see "ENGR303"
  When I fill in "Roomname" with "ENGR305"
  And I press "ยืนยันการแก้ไขข้อมูลห้อง"
  Then I should be on the "ENGR305" room detail page
  And I should not see "ENGR303"

  
