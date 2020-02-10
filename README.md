# AWS Secure S3 creation with IAM user allowed resrtictive access to it

Terraform module creates an S3 bucket with supplied name. It also creates an IAM user & gives this user resrictive access to the created bucket. The access allowed is GetObject, PutObject & DeleteObject. 

## Usage
```
terraform apply -var 'publicFolder=myPubFolder' 
```
The above would prompt user for bucket name. The custom public subfolder name can be supplied like in the above with the -var flag. In case it is not supplied, the default value for the variable 'publicFolder' is 'public'

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | Name of the S3 bucket | string | - | yes |
| publicFolder | Path to the public directory | string | `public` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket | Name of the S3 bucket which is created |
| bucket_id |  The S3 bucket ID|
| iam_user_name | IAM user name that would have restricted access to the bucket|
| iam_access_key_id | IAM user access key id |
| iam_access_key_secret | IAM user access key secret |


