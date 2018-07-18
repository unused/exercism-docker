# Exercism Docker Environment

Setup [exercism.io][website] for development using [Docker] and
[docker-compose].

TL;DR

```
$ git clone git@github.com:unused/exercism-docker.git # Download this repository
$ cd exercism-docker # Change directory
$ make # Run the setup steps via Makefile
$ make init # One-time initialization (database migration)
```

Note: The prepared setup steps will use a pre-built Docker image from
[unused/exercism\_rails][dockerhub] but you can also build the image yourself
using `make build`.

## Setup Steps

Requires some basic knowledge about [Docker] and a Docker installation.

Note: The setup is described for a unix-like operating system, if you have any
troubles please feel free to open an issue.

```
$ echo "host" > server_identity # Set server identity file
$ docker-compose -p exercism up # Start the local development environment
$ docker-compose -p exercism exec rails bin/rails exercism:setup # Setup database and git repos

$ docker-compose -p exercism down # Remove local environment
$ docker rmi exercism_rails # Cleanup build docker image
```

## Setup without using Docker

To setup a local development environment you'll have either to prepare your
local system with a ruby environment (ruby, rubygems, bundler) and JavaScript
runtime nodejs include package manager yarn. The [projects][project] README
will provide you with all background information needed.

## Contribution Guide

```
# Fork https://github.com/exercism/website
$ git remote add origin git@github.com:<your-github-username>/website.git
$ git checkout -b <short-descriptive-branch-name> # create a new branch
# ... do some changes
$ make test # check tests
$ git push origin <short-descriptive-branch-name> # push your changes
```

Create a pull request on [GitHub][project] and

## Update Your Fork

Rebasing your fork with the upstream repository.

```
$ git rebase upstream/master # update your master branch on demand
```

## Notes

If you use selinux like I do, you have to adapt the volume in the
docker-compose.yml and add the selinux-flag `./workspace/:/opt/rails/:Z`.


[Docker]: https://www.docker.com/what-docker "What is Docker?"
[docker-compose]: https://docs.docker.com/compose/ "Docker Compose"
[project]: https://github.com/exercism/website "Exercism Website on GitHub"
[webiste]: https://exercism.io/ "Exercism Website"
[dockerhub]: https://hub.docker.com/r/unused/exercism_rails/
