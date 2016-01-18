#!/bin/bash
# My test scripts for blocitoff
# $./run_tests.sh to execute
echo "Running your scripts for Blocitoff"

rspec spec/controllers/users_controller_spec.rb
rspec spec/controllers/wikis_controller_spec.rb
rspec spec/models/wiki_spec.rb
rspec spec/models/user_spec.rb
