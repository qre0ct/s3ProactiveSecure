locals {
  public_policy = <<EOF
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${var.name}/${var.publicFolder}/*"
        },
  EOF
}

resource "aws_s3_bucket" "bucket" {
  bucket        = "${var.name}"
  acl           = "private"
  force_destroy = "true"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
	${local.public_policy}
        {
            "Effect": "Allow",
            "Principal": {
            "AWS": "${aws_iam_user.s3.arn}"
            },
            "Action": ["s3:DeleteObject", "s3:PutObject", "s3:GetObject"],
            "Resource": [
                "arn:aws:s3:::${var.name}",
                "arn:aws:s3:::${var.name}/*"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_user" "s3" {
  name          = "${var.name}-s3"
  force_destroy = "true"
}

resource "aws_iam_access_key" "s3" {
  user = "${aws_iam_user.s3.name}"
}

resource "aws_iam_user_policy" "s3_policy" {
  name = "${var.name}-policy-s3"
  user = "${aws_iam_user.s3.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:DeleteObject", "s3:PutObject", "s3:GetObject"],
      "Resource": [
        "arn:aws:s3:::${var.name}",
        "arn:aws:s3:::${var.name}/*"
      ]
    }
  ]
}
EOF
}
