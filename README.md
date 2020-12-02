

This is a **Public Repo** which includes:
A cloudformation script for checking the AWS cli-login api and send notification to slack.
A terraform script for assuming role between two accounts, in order to fetch the slack webhook-url from parameter-store of another account.

The Slack notification would look like this:

---

*AWSLogin via CLI*

AccountId: $AccountId

UserName: $UserName

RoleArn: arn:aws:iam::$AccountId:role/SAML-AdministratorRole

SourceIPAddress: $IP

EventName: AssumeRoleWithSAML

EventTime: $EventTime

---
