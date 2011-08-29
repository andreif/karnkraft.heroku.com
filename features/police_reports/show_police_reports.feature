Feature: Show recent police reports
  In order to know what's going around
  As a security freak
  I want to see recent police reports
    
  Background:
    Given a police report created from the following feed item
      """
      <item>
      <title>2011-08-06 13:54, Trafikolycka, personskada, Södertälje</title>
      <link>http://www.polisen.se/sv/Aktuellt/Handelser/Stockholms-lan/2011-08-06-1354-Trafikolycka-personskada-Sodertalje/</link>
      <description>E 20/Tpl Saltskog</description>
      <pubDate>Sat, 06 Aug 2011 11:56:13 GMT</pubDate>
      </item>
      """
    
  @focus
  Scenario: Item in the police report list has all fields 
    When I go to the police reports page
    Then I should see "Aug 6, 13:54"
    And I should see "Trafikolycka, personskada"
    And I should see "Södertälje"
    And I should see "Stockholms län"
    And I should see a link to the first police report with text "Read"
  
  @focus  
  Scenario: Item in the police report list has all fields
    When I go to the first police report page
    Then I should see "Place: Södertälje"
    And I should see "Type: Trafikolycka, personskada"
    And I should see "Region: Stockholms län"
    And I should see "Date: 2011-08-06 13:54"
    And I should see "Published: 2011-08-06 13:56"
    And I should see a link to "http://www.polisen.se/sv/Aktuellt/Handelser/Stockholms-lan/2011-08-06-1354-Trafikolycka-personskada-Sodertalje/" with text "Polisen.se"
    And I should see a link to "the police reports page" with text "Show the latest police reports"
    
  