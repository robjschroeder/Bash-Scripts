The MUT is a multi-use tool that uses both Jamf Pro's classic API, and the new Jamf Pro API to make changes en masse to inventory records for Computers, Devices, and Users. The MUT can also be used to add, remove, or replace Computers and Mobile Devices in Static Groups and PreStage Enrollments.

Detailed Guides and Screenshots can be found here: https://github.com/mike-levenick/mut/blob/master/README.md

----------------------------------
Table of Contents:

1) Logging In
2) CSV Templates
    - 2a) Updating a Single Attribute
    - 2b) Clearing Values
    - 2c) Extension Attributes
3) Previewing CSV Data
4) Object View
5) Scope View
----------------------------------

1) Logging In

- When launched, The MUT prompts for:

a) Cloud instance or full URL. This field is expecting either:
    i) A full Jamf Pro URL
    ii) If using JamfCloud, the server instance name can be entered (for example, if you have "jssmut.jamfcloud.com" you could just enter "jssmut" as your instance name).
b) Username
c) Password

    The MUT uses the credentials provided to generate a session token that will be used for prestage API calls. This token is valid 30 minutes. If the 30 minute session has expired, the MUT can be relaunched to generate a new token.
----------------------------------

2) CSV Templates

    CSV Templates can be created after passing the authentication screen. The MUT verifies the headers of the CSV template being uploaded in order to determine which endpoints to use, so it is important to use the CSV templates provided without any alterations to the header row, except for adding extension attributes.

    When "Download CSV Templates" is selected, the MUT will place a folder inside of the Downloads directory, named "MUT Templates." If the directory already exists, the MUT will check for the presense of each individual template, the README, and the MUT.log. If any of these files already exist, they will not be overwritten.

- 2a) Updating a Single Attribute

    If a CSV template contains empty fields, those fields are ignored by The MUT. To update just one attribute, leave the other columns blank. The MUT will skip over those columns when submitting the changes to Jamf Pro.

    When previewing this data after uploading, the MUT will display "(unchanged)" in blue text for all values that will be skipped when submitting.

2b) Clearing Values

    Because the MUT ignores empty values, a specific string must be used to tell the MUT to clear those values, rather than skipping over them. The string is: CLEAR!

    When "CLEAR!" is entered for a value, the MUT will display this value in the preview table as "WILL BE CLEARED" in red text.

2c) Extension Attributes

    For Computers, Mobile Devices, and Users, extra columns can be added to the end of the CSV templates for Extension Attributes. The Extension Attribute to update must be designated by its ID in the Header Row of the CSV.

    An Extension Attribute's ID can be identified by visiting the Extension Attribute in a browser and viewing its URL.

    For example: If adding a Computer Extension attribute, navigate to Jamf Pro > Settings > Computer Management > Extension Attributes > Click on the Attribute in question.

    The Extension Attribute's ID can be found within the URL at this page. If the URL is:
    https://YourInstance.jamfcloud.com/computerExtensionAttributes.html?id=5&o=r
    Then the Extension Attribute's ID = 5.
    In the Header Row of the CSV add: EA_5
----------------------------------

3) Previewing CSV Data

    To select a CSV to preview, click "Browse for Filled Out CSV". The MUT checks the CSV to make sure the headers are formatted correctly, and will provide feedback if the headers are not correct.

    After verifying valid headers, the MUT automatically displays either the Object View or Scope View depending on the CSV headers.
----------------------------------

4) Object View

The Object view is displayed when any of the following CSV templates are selected:
    - ComputerTemplate
    - MobileDeviceTemplate
    - UserTemplate

    In the Object View, three columns are displayed. The far left column will display a list of every Computer, Mobile Device, or User in the CSV. Each entry in the far left column can be selected (by clicking on the entry) to view what specifically will be changed.

    The far right column is color coded for ease of reading. Values that appear as the default text color will be updated. Values that appear as "(unchanged)" in blue will not be updated by the MUT. Values that appear as "WILL BE CLEARED" in red will be cleared by the MUT.

    After verifying the imported data is correct, the updates from the CSV can be pushed to the Jamf Pro server by hitting the "Submit Updates" button.

    When updates are processing, a progress bar will appear indicating which line is currently being processed, and a "Cancel" button will appear. The "Cancel" button will stop the MUT at the line it is currently processing.
----------------------------------

5) Scope View

    If a single column CSV is selected, the Scope view is displayed.

    The table on the left side will display a list of all items in the CSV.

    Options must be selected in the dropdowns on the right side of the Scope view. The top dropdown determines the type of record to update. The options are:
        - Computer Prestage
        - Mobile Device Prestage
        - Computer Static Group
        - Mobile Device Static Group
        - User Object Static Group

    After an option is selected in the top dropdown, the second dropdown is selectable. In this dropdown choose to do one of three things:
        - Add: Keep existing members of the Group/Prestage in place, and add those in the CSV to the Group/Prestage
        - Remove: Remove the designated members from the Group/Prestage
        - Replace: Clear out the existing members of the Group/Prestage, and replace them with those the members in the CSV.

    Lastly, define the Prestage ID, or Static Group ID.

    This can be done by visiting the Prestage or Static Group in a web browser, and viewing the browser URL. Below are examples for both a Prestage and a Static Group:

    Prestage: If the URL is https://YourInstance.jamfcloud.com/mobileDevicePrestage.html?id=3&o=r
    then the ID = 3.
    In the Prestage ID field enter: 3

    Static Group: If the URL is https://YourInstance.jamfcloud.com/staticMobileDeviceGroups.html?id=4&o=r
    Then the ID = 4.
    In the Static Group ID field enter: 4

    After selecting the desired Static Group or PreStage, and the action to perform on that selection, the updates from the CSV can be pushed to the Jamf Pro server by hitting the "Submit Updates" button.

    When updates are processing, a progress bar will appear indicating which line is currently being processed, and a "Cancel" button will appear. The "Cancel" button will stop the MUT at the line it is currently processing.
