output "bucket" {
  value = "${aws_s3_bucket.bucket.bucket}"
}

output "bucket_id" {
  value = "${aws_s3_bucket.bucket.id}"
}

output "iam_user_name" {
  value = "${aws_iam_user.s3.name}"
}

output "iam_access_key_id" {
  value = "${aws_iam_access_key.s3.id}"
}

output "iam_access_key_secret" {
  value = "${aws_iam_access_key.s3.secret}"
}
