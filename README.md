# Lambda Elixir Docker image

Recommended usage as part of a multi-stage Docker build.

Example: https://github.com/solid8tion/hnkeywords/blob/master/Dockerfile

## Public Repo

* https://gallery.ecr.aws/p2t7j0q6/lambda-elixir


## Build
```
docker build -t lambda-elixir .
```

## Create AWS ECR Public Repo
```
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws
aws ecr-public create-repository --repository-name lambda-elixir --catalog-data file://repositorycatalogdata.json --region us-east-1
```

## Publish to AWS ECR Public Repo
```
# $repositoryUri is from the create-repository call 
docker tag lambda-elixir:latest $repositoryUri
docker push $repositoryUri
```

## References

* https://docs.aws.amazon.com/AmazonECR/latest/public/getting-started-cli.html
* https://docs.aws.amazon.com/AmazonECR/latest/public/public-repository-catalog-data.html
* https://renehernandez.io/snippets/cleaning-local-docker-cache/
* https://docs.docker.com/engine/reference/commandline/builder_prune/