FROM golang:1.6-alpine

ARG git_commit=unknown
ARG version="5.2.8.0"

LABEL org.cyverse.git-ref="$git_commit"
LABEL org.cyverse.version="$version"

COPY . /go/src/github.com/cyverse-de/saved-searches
RUN go install -v -ldflags="-X main.appver=$version -X main.gitref=$git_commit" github.com/cyverse-de/saved-searches

EXPOSE 60000
ENTRYPOINT ["saved-searches"]
CMD ["--help"]
