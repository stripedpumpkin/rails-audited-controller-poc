# Rails Audited Controller POC

This repository serves as a proof-of-concept for demonstrating changes in behavior of the `audited` gem in the context of Rails controller tests. The goal is to document how auditing behavior changes across different versions of the gem.

## Setup & Reproduction Steps

### 1. Clone the Repository
```sh
git clone git@github.com:stripedpumpkin/rails-audited-controller-poc.git
cd rails-audited-controller-poc/
```

### 2. Build the Docker Environment
```sh
make docker_build
```

### 3. Enter the Docker Container
```sh
make docker_bash
```

### 4. Set Up the Database
Inside the container, run:
```sh
bundle exec rails db:create
make migrate
```

### 5. Run the Tests
Execute the test suite to observe auditing behavior:
```sh
bundle exec rails test test/controllers/book_copies_controller_test.rb
```
By default master is bundling with audited 5.6.0. Just edit the Gemfile and run `bundle` with a different version to observe the behavior in that version.

## Tests Overview

### **Test: `can create book`**
Verifies that a `POST /book_copies` request successfully creates a `BookCopy` and an audit.

### **Test: `updates can be audited`**
- Ensures that updating a `BookCopy` creates exactly one audit record when `BookCopy.auditing_enabled = true`.

### **Test: `can skip auditing`**
- Demonstrates how setting `BookCopy.auditing_enabled = false` affects auditing behavior across different versions:
  - Assertion holds in `audited` **5.3.0, 5.4.0, and 5.5.0**.
  - Assertion fails in `audited` **5.6.0**.
- Verifies that BookCopy.auditing_enabled remains false after controller action:
  - Assertion holds in `audited` **5.3.0**.
  - Assertion fails in `audited` **5.4.0, 5.5.0 and 5.6.0**.

## Notes
- The test suite checks whether `BookCopy.auditing_enabled` persists correctly across updates.
- Different versions of `audited` exhibit varying behaviors, particularly from `5.6.0` onward.

This repository provides a minimal setup to reproduce and investigate these changes effectively.

