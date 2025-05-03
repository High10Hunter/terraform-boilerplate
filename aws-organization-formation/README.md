# SpaceDF organization formation

## Usage

### 1) Prepare AWS Credentials 
Ensure you have AWS credentials **mangement account** configured either through environment variables or AWS CLI configuration.

### 2) Operation on organization resources
Creates a local organization formation file
```
org-formation init organization.yml --region ap-southeast-1
```

Creates a changeset that can be reviewed and later applied for changes in `organization.yml`
```
org-formation create-change-set organization.yml --change-set-name <name_of_the_change>
```

Apply the changeset to organization resources
```
org-formation execute-change-set <name_of_the_change>
```

