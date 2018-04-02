@controller @update
Feature: Updating a record in registry

  Background:
    Given a valid entity record
    And the record is created in the registry

  Scenario: Updating a non-existent record
    Given a non-existent record id
    When updating the record in the registry
    Then updating the record should be unsuccessful
    And update api error message is Entity does not exist

  Scenario: Updating an existing record with invalid data
    Given an invalid data for updating a record
    When updating the record in the registry
    Then updating the record should be unsuccessful
    And update api error message is Data validation failed!
    And validation error message is 14 does not have datatype xsd:integer

  Scenario: Updating values for an existing record
    Given valid data for updating a record
    When updating the record in the registry
    Then updating the record should be successful