.DEFAULT_GOAL := all

TEST_PATH=./

help:
	@echo "    clean"
	@echo "        Remove python artifacts and build artifacts."
	@echo "    train-nlu"
	@echo "        Trains a new nlu model using the projects Rasa NLU config"
	@echo "    train-core"
	@echo "        Trains a new dialogue model using the story training data"

clean:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f  {} +
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf docs/_build
	rm -rf models/

all: train-nlu train-core

train-nlu:
	python3 -m rasa_nlu.train -c nlu_config.yml --data data/nlu -o models --fixed_model_name nlu --project trakhees --verbose

train-core:
	python3 -m rasa_core.train -d domain.yml -s data/core -o models/trakhees/dialogue

cmdline:
	python3 -m rasa_core.run -d models/trakhees/dialogue -u models/trakhees/nlu

action-server:
	python3 -m rasa_core_sdk.endpoint --actions demo.actions

interactive:
	python3 -m rasa_core.train --online -d domain.yml -s data/core -o models/trakhees/dialogue --epochs 100 --endpoints endpoints.yml -u models/trakhees/nlu
