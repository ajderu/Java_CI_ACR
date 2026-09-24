package main

import (
	"fmt"
	"net/http"

	"github.com/labstack/echo/v4"
)

func main() {
	msg := sayHello("HCLTech Innovation Lab RO")
	fmt.Println(msg)
	echoTheGo()
}

func sayHello(name string) string {
	return fmt.Sprintf("Hello %s", name)
}

func echoTheGo() {
	e := echo.New()
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, Volante people! I'm a Go app!")
	})
	e.Logger.Fatal(e.Start(":8080"))
}