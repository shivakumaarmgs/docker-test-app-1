#!/bin/bash
set -e

exit_if_not_successfull() {
  rc=$?
  if [[ $rc != 0 ]];then
    exit $rc
  fi
}

>&2 echo "> Starting tests"

>&2 echo "> Running model tests"
bundle exec rspec spec/models
exit_if_not_successfull

>&2 echo "> Running browser tests"
bundle exec rspec spec/features
exit_if_not_successfull
