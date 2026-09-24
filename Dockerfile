# The stage at which the application is built
FROM --platform=linux/amd64 golang:1.19-alpine AS builder
RUN apk update && apk add --no-cache git
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /app/main

# The stage at which the application is deployed
FROM --platform=linux/amd64 alpine:3.16
COPY --from=builder /app/main /app/main
EXPOSE 8080
ENTRYPOINT ["/app/main"]
