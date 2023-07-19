# Email Task Application

The Email Task Application is a simple Ruby on Rails web application that allows users to manage their email accounts and send/receive emails through the application. It uses the `net-imap` gem to interact with IMAP servers for fetching emails and the built-in `net/smtp` library for sending emails.

## Table of Contents

- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Contributing](#contributing)
## Getting Started

To get a local copy of the application up and running, follow the installation instructions below.

## Prerequisites

Before running the application, make sure you have the following installed:

- Ruby 2.7.1
- Ruby on Rails 7.0.4
- PostgreSQL
- Bundler

## Installation

1. Clone the repository to your local machine:

```
git clone https://github.com/your_username/email_task.git
```

2. Change directory to the project folder:

```
cd email_task
```

3. Install the required gems:

```
bundle install
```

4. Set up the database:

```
rails db:create
rails db:migrate
```

## Usage

1. Start the Rails server:

```
rails server
```

2. Open your web browser and navigate to `http://localhost:3000`.

3. Create a new email account by clicking on "Email Account Configuration" and filling in the required information.

4. After adding an email account, you will be redirected to the Inbox page, where you can view and manage your emails.

5. To compose a new email, click on "Send Email" from the Inbox page and fill in the recipient, subject, and body of the email.

## Features

- Add and manage multiple email accounts with different IMAP servers (Gmail, Hotmail, iCloud).
- Fetch emails from the selected email account using IMAP.
- Compose and send emails through the application using SMTP.
- View emails in the Inbox and check details like subject, body, sender, and creation date.
- Log out from the current email account.

## Contributing

Contributions are welcome! If you find any bugs or want to add new features, please create an issue or submit a pull request with your changes.
