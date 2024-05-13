resource "aws_lb_target_group" "my_target_group" {
    name        = "my-target-group"
    port        = 80
    protocol    = "HTTP"
    vpc_id      = aws_vpc.wordpress-vpc.id
    target_type = "instance"
}

resource "aws_lb_target_group_attachment" "my_target_group_attachment" {
    target_group_arn = aws_lb_target_group.my_target_group.arn
    target_id        = aws_instance.wordpress.id
    port             = 80
}

resource "aws_alb" "my_alb" {
    name            = "my-alb"
    internal        = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.web_sg.id]
    subnets         = aws_subnet.public-subnet[*].id
    tags = {
        Name = "my-alb"
    }
}

resource "aws_lb_listener" "my_listener" {
    load_balancer_arn = aws_alb.my_alb.arn
    port              = "80"
    protocol          = "HTTP"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.my_target_group.arn
    }
}