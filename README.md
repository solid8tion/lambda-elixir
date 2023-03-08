# Lambda Elixir Docker image

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