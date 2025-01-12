package main

// running my static website dynamically
// TODO: make this work with files outside the site path. 

import (
	"net/http"
	"io/ioutil"
	"fmt"
	"log"
)

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8000", nil))
}

func handler(w http.ResponseWriter, r *http.Request) {
	path := "./docs" + r.URL.Path
	content, err := ioutil.ReadFile(path)

	if err != nil {
		panic(err)
	}

	fmt.Fprintf(w, string(content))
}
