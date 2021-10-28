# PN - Project Name
PN := src

PYTHON := python3
SHELL  := /bin/sh

LINT_TARGET := ${PN} 
MYPY_TARGET := ${PN}

# Create the file below if you need to override the variables above
# or add additional make targets.
-include Makefile.inc


.PHONY: all
all: help


.PHONY: check
# target: check - Run all checks: linters and tests (with coverage)
check: lint test


.PHONY: clean
# target: clean - Remove intermediate and generated files
clean:
	@find . -type f -name '*.py[co]' -delete
	@find . -type d -name '__pycache__' -delete
	@rm -rf {build,htmlcov,cover,coverage,dist,.coverage,.hypothesis}


.PHONY: develop
# target: develop- Install develop packages
develop:
	@${PYTHON} -m pip install -r requirements/dev.txt


.PHONY: prod
# target: prod- Install production packages
install:
	@${PYTHON} -m pip install -r requirements/prod.txt


.PHONY: format
# target: format - Format the code according to the coding styles
format: format-black format-isort


.PHONY: format-black
format-black:
	@black ${LINT_TARGET}


.PHONY: format-isort
format-isort:
	@isort -rc ${LINT_TARGET}


.PHONY: help
# target: help - Print this help
help:
	@egrep "^# target: " Makefile \
		| sed -e 's/^# target: //g' \
		| awk '{printf("    %-16s", $$1); $$1=$$2=""; print "-" $$0}'


.PHONY: lint
# target: lint - Check source code with linters
lint: lint-isort lint-black lint-flake8 lint-mypy lint-pylint


.PHONY: lint-black
lint-black:
	@${PYTHON} -m black --check --diff ${LINT_TARGET}


.PHONY: lint-flake8
lint-flake8:
	@${PYTHON} -m flake8 --statistics ${LINT_TARGET}


.PHONY: lint-isort
lint-isort:
	@${PYTHON} -m isort.main -df -c -rc ${LINT_TARGET}


.PHONY: lint-mypy
lint-mypy:
	@${PYTHON} -m mypy ${MYPY_TARGET}


.PHONY: lint-pylint
lint-pylint:
	@${PYTHON} -m pylint --rcfile=.pylintrc --errors-only ${LINT_TARGET}


.PHONY: purge
# target: purge - Remove all unversioned files and reset working copy
purge:
	@git reset --hard HEAD
	@git clean -xdff


.PHONY: report-coverage
# target: report-coverage - Print coverage report
report-coverage:
	@${PYTHON} -m coverage report


.PHONY: report-pylint
# target: report-pylint - Generate pylint report
report-pylint:
	@${PYTHON} -m pylint ${LINT_TARGET}


.PHONY: test
# target: test - Run tests with coverage
test:
	@${PYTHON} -m coverage run -m py.test
	@${PYTHON} -m coverage report


.PHONY: dvc-init
# target: dvc-init - Init dvc and add remote
dvc-init:
	@dvc init
	@dvc remote add -d myremote hdfs://bda31/pilot/p_datalake/dvc_storage/dailydialog-topic-recommendations


# `venv` target is intentionally not PHONY.
# target: venv - Creates virtual environment
venv:
	@${PYTHON} -m venv venv