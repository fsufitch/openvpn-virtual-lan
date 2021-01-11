package main

import (
	"fmt"
	"log"
	"os"

	cli "github.com/urfave/cli/v2"
)

var app = &cli.App{
	Name:  "openvpn-vlan-util",
	Usage: "configure or interact with your OpenVPN VLAN",
	Action: func(c *cli.Context) error {
		fmt.Println("inside app again2")
		return nil
	},
}

func main() {
	err := app.Run(os.Args)
	if err != nil {
		log.Fatal(err)
	}
}
