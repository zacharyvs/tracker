@domain @api
Feature: Creating tasks

  Rules:
  - A project must be specified
  - Task name is required
  - Created tasks should default to "todo" state

  Background:
    Given a project:
      | ID          | 54f8419c-3f22-4cba-b194-5f8b4727ccfd |
      | NAME        | Sample Project                       |
      | DESCRIPTION | A small sample project               |
      | STATE       | active                               |

  Scenario: Creating a task with all fields
    When I create a task with:
      | NAME        | Sample Task                          |
      | DESCRIPTION | This is a sample task                |
      | PROJECT_ID  | 54f8419c-3f22-4cba-b194-5f8b4727ccfd |
    Then the project has the tasks:
      | NAME           | STATE  |
      | Sample Task    | todo   |

  Scenario: Trying to create a task without a name
    When I try to create a task with:
      | DESCRIPTION | This is a sample task                |
      | PROJECT_ID  | 54f8419c-3f22-4cba-b194-5f8b4727ccfd |
    Then the project has 0 tasks
    And I get the error "Name can't be blank"

