package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"

	"encoding/json"

	"gopkg.in/yaml.v3"
)

const READ_FROM_STDIN = "-"
const JSON_INDENT = "  "

func yaml2json(data []byte) ([]byte, error) {
	var unmarshaled map[string]interface{}
	if err := yaml.Unmarshal(data, &unmarshaled); err != nil {
		return nil, fmt.Errorf("Failed to unmarshal YAML: %w", err)
	}

	marshaled, err := json.MarshalIndent(unmarshaled, "", JSON_INDENT)
	if err != nil {
		return nil, fmt.Errorf("Failed to marshal to JSON: %w", err)
	}

	return marshaled, nil
}

func getFile(filename string) (*os.File, error) {
	var file *os.File

	if filename == READ_FROM_STDIN {
		file = os.Stdin
	} else {
		var err error
		file, err = os.Open(filename)
		if err != nil {
			return nil, fmt.Errorf("Failed to open file %s: %w", filename, err)
		}
	}

	return file, nil
}

func main() {
	if len(os.Args) != 2 {
		log.Fatal("Usage: yaml2json [filename or -]")
	}

	filename := os.Args[1]

	file, err := getFile(filename)
	if err != nil {
		log.Fatal(err)
	}

	data, err := ioutil.ReadAll(file)
	if err != nil {
		log.Fatalf("Failed to read file %s: %v", filename, err)
	}

	converted, err := yaml2json(data)
	if err != nil {
		log.Fatalf("Failed to yaml2json %s: %v", filename, err)
	}

	fmt.Println(string(converted))
}
