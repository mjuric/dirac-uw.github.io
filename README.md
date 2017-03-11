# dirac-uw.github.io -- DIRAC website experiments

## Where is the result

https://dirac-uw.github.io

## Getting the source

This website has been build with [Hugo](http://gohugo.io/). It pulls in
themes via `git submodule`s, so the first thing you'll want to do after
cloning is something like:
```
git submodule init
git submodule update
```

## Building the source

Install hugo (e.g., `brew install hugo`) and then run:

```
hugo server -b http://localhost:1313/ --watch
```

in the root directory to build and test it (on http://localhost:1313).

## Deploying

Once you're happy with your additions, run `deploy.sh` to deploy into production.
You have to have write access to git@github.com:dirac-uw/dirac-uw.github.io.git
for deplyoment to work.
