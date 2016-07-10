@domain
Feature: Listing tasks

  Scenario: Verifying the format shape
    Given a project:
      | ID          | 54f8419c-3f22-4cba-b194-5f8b4727ccfd |
      | NAME        | Sample Project                       |
      | DESCRIPTION | A small sample project               |
      | STATE       | active                               |
    And a task:
      | ID          | 5d2da7f9-e06e-4ac0-ab38-91fa48d455dc |
      | NAME        | Sample Task                          |
      | DESCRIPTION | This is a sample task                |
      | PROJECT_ID  | 54f8419c-3f22-4cba-b194-5f8b4727ccfd |
    When I request the tasks for that project
    Then I get the data:
      """
      {
        tasks: [
          {
            id: '5d2da7f9-e06e-4ac0-ab38-91fa48d455dc',
            name: 'Sample Task',
            description: 'This is a sample task',
            project_id: '54f8419c-3f22-4cba-b194-5f8b4727ccfd',
            state: 'todo'
          }
        ],
        count: 1,
        current_page_number: 1,
        total_page_count: 1
      }
      """
