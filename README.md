## AWS Secure S3 creation with IAM user allowed resrtictive access to it

Terraform module creates an S3 bucket with supplied name. It also creates an IAM user & gives this user resrictive access to the created bucket. The access allowed is GetObject, PutObject & DeleteObject. 

## Usage
```
terraform apply [-var 'publicFolder=<name of the public folder'] 
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

## Example

```terraform apply -var 'publicFolder=myPubFolder'```

## Output
 - Assuming that the user supplied name for the bucket was 'sample-bucket-for-blog' (without the quotes)
 - And ################# - readacted on purpose from the readme

```Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_user.s3: Creating...
aws_iam_user.s3: Creation complete after 3s [id=sample-bucket-for-blog-s3]
aws_iam_user_policy.s3_policy: Creating...
aws_iam_access_key.s3: Creating...
aws_s3_bucket.bucket: Creating...
aws_iam_access_key.s3: Creation complete after 1s [id=#################]
aws_iam_user_policy.s3_policy: Creation complete after 1s [id=sample-bucket-for-blog-s3:sample-bucket-for-blog-policy-s3]
aws_s3_bucket.bucket: Still creating... [10s elapsed]
aws_s3_bucket.bucket: Creation complete after 15s [id=sample-bucket-for-blog]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

Outputs:

bucket = sample-bucket-for-blog
bucket_id = sample-bucket-for-blog
iam_access_key_id = #################
iam_access_key_secret = #################
iam_user_name = sample-bucket-for-blog-s3
```

## AWS console screen shot
##### Bucket Policy
<img src="https://github.com/c0n71nu3/s3ProactiveSecure/blob/master/bucketPolicy.png" width="600" height="600">

##### IAM Policy
<img src="https://github.com/c0n71nu3/s3ProactiveSecure/blob/master/iamPolicy.png" width="600" height="600">
