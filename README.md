<a name="readme-top"></a>

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 Metrics ](#-metrics-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [🚀 Live Demo ](#-live-demo-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run tests](#run-tests)
    - [Deployment](#deployment)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [❓ FAQ ](#-faq-)
  - [📝 License ](#-license-)

# 📖 Recipe app website <a name="about-project"></a>

**Recipe app website** that keeps track of all your recipes, ingredients, and inventory. It will allow you to save ingredients, keep track of what you have, and create recipes. Also, since sharing recipes is an important part of cooking the app should allow you to make them public so anyone can access them.

## Entity Relationship Diagram

![Entity Relationship Diagram](./repo_images/entity_diagram.png)

## View URIs

Sign up form (URI: '/users/sign_up')

![Sign up form](./repo_images/sign_up_form.png)

Sign in form (URI: '/users/sign_in')

![Sign in form](./repo_images/sign_in_form.png)

Foods list (URI: '/foods') just for logged in users

![Foods list](./repo_images/should_display_foods_list.png)

Add new foods (URI: '/foods/new') just for logged in users

![Add new foods](./repo_images/should_allow_adding_new_food.png)

Public recipes (URI: '/public_recipes')

![Public recipes](./repo_images/should_display_public_recipes.png)

User recipes (URI: '/recipes') just for logged in users

![User recipes](./repo_images/recipes.png)

Single user recipe (URI: '/recipes/:id') just for logged in users

![Single user recipe](./repo_images/recipe_view.png)

Add new recipes (URI: '/recipes/new') just for logged in users

![Add new recipes](./repo_images/should_allow_adding_recipes.png)

Add ingredients (recipe_food) to recipes (URI: '/recipes/:recipe_id/recipe_foods/new') just for logged in users

![Add ingredients](./repo_images/should_allow_adding_ingredients.png)

General shopping list (URI: '/general_shopping_list') just for logged in users

![General shopping list](./repo_images/should_display_general_shopping_list.png)

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://guides.rubyonrails.org/index.html">Ruby on Rails</a></li>
  </ul>
</details>

<details>
  <summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/docs/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **All data is preserved in PostgreSQL**
- **Allow creating foods**
- **Allow deleting foods**
- **Allow creating recipes**
- **Allow deleting recipes**
- **Allow creating ingredients**
- **Allow deleting ingredients**
- **Allow updating ingredients**
- **Allow viewing shopping list**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- Git SCM
- Ruby installed
- Rails installed
- PostgreSQL and SQL installed

And in case you want to run capybara tests:

- Chromedriver
- WSL activated
- Ubuntu or any other linux distro shell installed

### Setup

Clone this repository to your desired folder:

```
git clone https://github.com/jorgeabrahan/recipe-app.git
```

Or download the ZIP folder.

### Install

Once you've cloned the repository simply run:

```
bundle install
rails db:create
rails db:migrate
```

If it doesn't work because the server got disconnected you might need to change the credentials for your own psql credentials in the database.yml file.

### Usage

To run the project, if you are on the blog folder path on your terminal you can execute the following command:

```
rails server
```

### Run tests

To start tests run:

```
rspec spec # for rspec tests
rails test:system # for capybara tests
```

### Deployment

- Render
- Heroku

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **Jorge Abrahan**

- GitHub: [@jorgeabrahan](https://github.com/jorgeabrahan)
- LinkedIn: [Jorge Abrahan](https://www.linkedin.com/in/jorge-siguenza/?locale=en_US)

👤 **Jorge Abrahan**

- GitHub: [@amentetteh](https://github.com/amentetteh)
- Portfolio: [Amen TETTEH](https://amentetteh.github.io/amen-tetteh-portfolio/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Deploy application**
- [ ] **Improve cyclomathic complexity in some methods**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project you can just cheer me up with a comment 🙂!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

The whole project idea comes from Microverse, the link to the project requirements and description is here: [https://github.com/microverseinc/curriculum-rails/blob/main/recipe-app/buisness_requirements.md](https://github.com/microverseinc/curriculum-rails/blob/main/recipe-app/buisness_requirements.md)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ❓ FAQ <a name="faq"></a>

- **What is this project main purpose?**

  - To practice working with Ruby on Rails, PostgreSQL and interpret entity relationship diagrams, UML class diagrams and build UIs in ruby based on design guidelines.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
