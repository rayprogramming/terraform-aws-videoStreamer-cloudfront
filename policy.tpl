{
    "Version": "2008-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Sid": "1",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${cloudfront}"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${domain}/*"
        }
    ]
}
