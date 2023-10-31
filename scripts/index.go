// Reviewdogをテストするための`index.go`

package main

import "fmt"

func add(a int, b int) int {
	return a + b
}

func sub(a int, b int) int {
	return a - b
}

func mul(a int, b int) int {
	return a * b
}

func div(a int, b int) float64 {
	if b == 0 {
		return 0
	}
	return float64(a) / float64(b)
}

func main() {
	fmt.Println("Hello, World!")
	fmt.Println("-------------")
	fmt.Println(add(1, 2))
	fmt.Println(sub(1, 2))
	fmt.Println(mul(1, 2))
	fmt.Println(div(1, 2))
}
