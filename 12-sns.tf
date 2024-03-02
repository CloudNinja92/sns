resource "aws_sns_topic" "autoscaling_notifications" {
  name = "autoscaling-notifications"
  //kms_master_key_id = aws_kms_key.sns_key.arn
}

resource "aws_sns_topic_subscription" "autoscaling_notifications_email" {
  topic_arn = aws_sns_topic.autoscaling_notifications.arn
  protocol  = "email"
  endpoint  = "cgilber92@gmail.com"
}

resource "aws_sns_topic_subscription" "autoscaling_notifications_email1" {
  topic_arn = aws_sns_topic.autoscaling_notifications.arn
  protocol  = "email"
  endpoint  = "enlightenedcoder82@gmail.com"
}

resource "aws_sns_topic_subscription" "autoscaling_notifications_email2" {
  topic_arn = aws_sns_topic.autoscaling_notifications.arn
  protocol  = "email"
  endpoint  = "theowaf@gmail.com"
}

resource "aws_autoscaling_notification" "autoscaling_notifications" {
  group_names = [
    aws_autoscaling_group.ninjas_asg.name
  ]
   notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
    "autoscaling:TEST_NOTIFICATION" 
  ]
  topic_arn =  aws_sns_topic.autoscaling_notifications.arn
}