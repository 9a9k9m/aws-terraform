# scale up alarm

resource "aws_autoscaling_policy" "example-cpu-policy" {
    name                            = "example-cpu-policy"
    autoscaling_group_name          = "aws_autoscaling_group.example-autoscaling.name"
    adjustment_type                 = "ChangeInCapacity"
    scaling_adjustment              = "1"
    cooldown                        = "300"
    policy_type                     = "SimpleScaling"
}


resource "aws_cloudwatch_metric_alarm" "example-cpu-example" {
    alarm_name                  = "example-cpu-alarm"
    alarm_description           = "example-cpu-alarm"
    comparison_operator         = "GreaterThanOrEqualToThershold"
    evaluation_periods          = "2"
    metric_name                 = "cpu-utilization"
    namespace                   = "aws/ec2"
    period                      = "60"
    statistic                   = "Average"
    threshold                   = "30"

    dimensions = {
        "autoScalingGroupName"  = aws_autoscaling_group.example-autoscaling.name
    }

    actions_enabled = true
    alarm_actions    = [aws_autoscaling_policy.example-cpu-policy.arn]
}

# scale down alarm

resource "aws_autoscaling_policy" "example-cpu-policy-scaledown" {
    name                        = "example-cpu-policy-scaledown"
    autoscaling_group_name      = aws_autoscaling_group.example-autoscaling.name
    adjustment_type             = "changeInCapacity"
    scaling_adjustment          = "-1"
    cooldown                    = "300"
    policy_type                 = "simpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "example-cpu-alarm-scaledown" {
    alarm_name             = "example-cpu-example-scaledown"
    alarm_description       = "example-cpu-alarm-scaledown"
    comparison_operator     = "lessThanOrEqualToThreshold"
    evaluation_periods      = "2"
    metric_name             = "cpuutilization"
    namespace               = "aws/ec2"
    period                  = "60"
    statistic               = "Avarage"
    threshold               = "10"

    dimensions = {
        "AutoScalingGroupName" = aws_autoscaling_group.example-autoscaling.name
    }


    action_enabled = true
    alarm_actions  = [aws_autoscaling_policy.example-cpu-policy-scaledown.arn]
}