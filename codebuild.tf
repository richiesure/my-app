resource "aws_codebuild_project" "my_app_build" {
  name          = "MyAppCodeBuildProject"
  description   = "Build project for my-app"

  service_role = "arn:aws:iam::150297827048:role/CodePipelineDeploymentRole"

  artifacts {
    type = "S3"
    location = aws_s3_bucket.artifacts.bucket
    packaging = "ZIP"
    name = "build-output.zip"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = false
  }

  source {
    type      = "GITHUB"
    location  = "https://github.com/richiesure/my-app.git"
    buildspec = "buildspec.yml"
    git_clone_depth = 1
    report_build_status = true
  }

  timeout_in_minutes = 10
}
