# Testing Workshop

👋 hi there! My name is [Kent C. Dodds](https://kentcdodds.com)! This is a
workshop repo to teach you about testing JavaScript applications.

> **NOTICE**: If you're coming here from my Frontend Masters 2017 workshop,
> please [go to the `fem` branch](https://github.com/kentcdodds/testing-workshop/tree/fem)
> to make sure you're looking at the accurate information for your workshop.

[![slides-badge][slides-badge]][slides]
[![chat-badge][chat-badge]][chat]
[![Build Status][build-badge]][build]
[![AppVeyor Build Status][win-build-badge]][win-build]
[![MIT License][license-badge]][license]
[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors)

[![PRs Welcome][prs-badge]][prs]
[![Code of Conduct][coc-badge]][coc]
[![Watch on GitHub][github-watch-badge]][github-watch]
[![Star on GitHub][github-star-badge]][github-star]
[![Tweet][twitter-badge]][twitter]

## Table of Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->

<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

* [Topics covered](#topics-covered)
* [Branches](#branches)
* [System Requirements](#system-requirements)
* [Setup](#setup)
* [Running the app](#running-the-app)
* [About the app](#about-the-app)
  * [Continuous Integration](#continuous-integration)
  * [Hosting](#hosting)
  * [Register and Login](#register-and-login)
* [Troubleshooting](#troubleshooting)
* [Structure](#structure)
* [Contributors](#contributors)
* [LICENSE](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Topics covered

1. Unit Testing with [Jest](http://facebook.github.io/jest)
2. Integration Testing with [Jest](http://facebook.github.io/jest)
3. End to End (E2E) Testing with [Cypress](https://www.cypress.io/)

We'll mention other forms of testing, but these are the types we'll focus on and learn in this workshop. We'll learn
about the benefits (and tradeoffs) of [TDD](https://en.wikipedia.org/wiki/Test-driven_development). We'll learn how to
configure the tools and why, when, where, and what to test.

## Branches

This project has been used to teach about testing in various settings. You may
want to switch to the appropriate branch for this workshop. Otherwise the code
you're looking at may not be exactly the same as the code used in the setting
you're working with.

* Frontend Masters 2017 [`fem`](https://github.com/kentcdodds/testing-workshop/tree/fem)

## System Requirements

* [git][git] v2.14.1 or greater
* [NodeJS][node] v8.9.4 or greater
* [npm][npm] v5.6.0 or greater

All of these must be available in your `PATH`. To verify things are set up
properly, you can run this:

```
git --version
node --version
npm --version
```

If you have trouble with any of these, learn more about the PATH environment
variable and how to fix it here for [windows][win-path] or
[mac/linux][mac-path].

## Setup

After you've made sure to have the correct things (and versions) installed, you
should be able to just run a few commands to get set up:

```
git clone https://github.com/kentcdodds/testing-workshop.git
cd testing-workshop
npm run setup --silent
```

This may take a few minutes. If you get any errors, please read through them and
see if you can find out what the problem is. You may also want to look at
[Troubleshooting](#troubleshooting). If you can't work it out on your own then
please [file an issue][issue] and provide _all_ the output from the commands you
ran (even if it's a lot).

## Running the app

To get the app up and running (and really see if it worked), run:

```shell
npm run dev
```

This will start the api server, and the client server in development mode at
the same time. Your browser should open up automatically to
`http://localhost:3000` (if it doesn't, just open that yourself) and you should
be able to start messing around with the app.

<!-- TODO: add a screenshot -->

<!-- Here's what you should be looking at: -->

<!-- <img src="other/conduit-screenshot.png" alt="Conduit Screenshot" title="Conduit Screenshot" width="700" /> -->

If this fails at any point for you, please take a minute to read through any
error messages you see and [try to troubleshoot the issue](#troubleshooting).
If you can't work it out, feel free to [open an issue][issue].

## About the app

This app is based on the [Hashrocket](https://hashrocket.com/) project called
[Today I Learned](https://til.hashrocket.com/). It's a real working application
but has been simplified to help us focus on learning testing rather than
worrying about distracting ourselves with setting up the project. For example
the database is actually just a simple JavaScript file. Every time you start
the app, all the data is reset (and in development mode, data is randomly
generated).

### Continuous Integration

We're using two CI services:

* [Travis][build] (Linux): find config in `.travis.yml`
* [AppVeyor][win-build] (Windows): find config in `appveyor.yml`

### Hosting

The backend code is deployed to [now.sh](https://now.sh):
[til.now.sh](https://til.now.sh). Try hitting one of the unauthenticated
endpoints like [`/api/posts`](https://til.now.sh/api/posts) (note: it's using
the open source free tier, so it may take a while to respond as it warms up).
The Travis build is responsible for deploying the backend to `now.sh`.

The frontend code is deployed using [netlify](https://netlify.com):
[til.netlify.com](https://til.netlify.com). We could host the frontend code
on `now` as well, except Netlify has some pretty awesome features with GitHub
integration, and I want to show those off (and benefit from them as well).
The frontend code is deployed to netlify using Netlify's integration with
GitHub.

### Register and Login

If you want to login, go ahead and register a new account and login with that
one.

**To stop all the servers**, hit <kbd>Ctrl</kbd> + <kbd>C</kbd>.

## Troubleshooting

<details>

<summary>"npm run setup" command not working</summary>

Here's what the setup script does. If it fails, try doing each of these things
individually yourself:

```
# verify your environment will work with the project
node ./scripts/verify

# install dependencies in the root of the repo
npm install

# install dependencies in the api directory
cd api
npm install

# install dependencies in the client directory
cd ../client
npm install

# get back to the root of the repo
cd ..

# verify the project is ready to run
npm run lint
npm run test:coverage
npm run test:e2e
```

If any of those scripts fail, please try to work out what went wrong by the
error message you get. If you still can't work it out, feel free to
[open an issue][issue] with _all_ the output from that script. I will try to
help if I can.

</details>

<details>

<summary>"npm run dev" command not working</summary>

If it doesn't work for you, you can start each of these individually yourself
(in separate terminals):

```
cd server
npm run dev
```

```
cd client
npm run dev
```

If any of those scripts fail, please try to work out what went wrong by the
error message you get. If you still can't work it out, feel free to
[open an issue][issue] with _all_ the output from that script. I will try to
help if I can.

</details>

## Structure

This project has a bit of a unique setup. Normally you'll have just a single
`package.json` at the root of your repository, but to simplify setup I've
included both the `server` and `client` projects in a single repository. The
root of the project has a `package.json` as does `server`, and `client`. While
you'll be working in the source code and tests in these folders, you should be
able to leave you command line in the root directory for the whole workshop.

## Contributors

Thanks goes to these wonderful people ([emoji key](https://github.com/kentcdodds/all-contributors#emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->

<!-- prettier-ignore -->
| [<img src="https://avatars.githubusercontent.com/u/1500684?v=3" width="100px;"/><br /><sub><b>Kent C. Dodds</b></sub>](https://kentcdodds.com)<br />[💻](https://github.com/kentcdodds/testing-workshop/commits?author=kentcdodds "Code") [📖](https://github.com/kentcdodds/testing-workshop/commits?author=kentcdodds "Documentation") [🚇](#infra-kentcdodds "Infrastructure (Hosting, Build-Tools, etc)") [⚠️](https://github.com/kentcdodds/testing-workshop/commits?author=kentcdodds "Tests") |
| :---: |

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/kentcdodds/all-contributors) specification. Contributions of any kind welcome!

## LICENSE

MIT

[npm]: https://www.npmjs.com/
[yarn]: https://yarnpkg.com/
[node]: https://nodejs.org
[git]: https://git-scm.com/
[mongo]: https://www.mongodb.com/
[slides]: http://kcd.im/testing-workshop-slides
[slides-badge]: https://cdn.rawgit.com/kentcdodds/custom-badges/2/badges/slides.svg
[chat]: https://gitter.im/kentcdodds/testing-workshop
[chat-badge]: https://img.shields.io/gitter/room/kentcdodds/testing-workshop.js.svg?style=flat-square
[build-badge]: https://img.shields.io/travis/kentcdodds/testing-workshop.svg?style=flat-square
[build]: https://travis-ci.org/kentcdodds/testing-workshop
[dependencyci-badge]: https://dependencyci.com/github/kentcdodds/testing-workshop/badge?style=flat-square
[dependencyci]: https://dependencyci.com/github/kentcdodds/testing-workshop
[license-badge]: https://img.shields.io/badge/license-MIT%20License-blue.svg?style=flat-square
[license]: https://github.com/kentcdodds/testing-workshop/blob/master/LICENSE
[prs-badge]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square
[prs]: http://makeapullrequest.com
[donate-badge]: https://img.shields.io/badge/$-support-green.svg?style=flat-square
[donate]: http://kcd.im/donate
[coc-badge]: https://img.shields.io/badge/code%20of-conduct-ff69b4.svg?style=flat-square
[coc]: https://github.com/kentcdodds/testing-workshop/blob/master/other/CODE_OF_CONDUCT.md
[github-watch-badge]: https://img.shields.io/github/watchers/kentcdodds/testing-workshop.svg?style=social
[github-watch]: https://github.com/kentcdodds/testing-workshop/watchers
[github-star-badge]: https://img.shields.io/github/stars/kentcdodds/testing-workshop.svg?style=social
[github-star]: https://github.com/kentcdodds/testing-workshop/stargazers
[twitter]: https://twitter.com/intent/tweet?text=Check%20out%20testing-workshop%20by%20@kentcdodds%20https://github.com/kentcdodds/testing-workshop%20%F0%9F%91%8D
[twitter-badge]: https://img.shields.io/twitter/url/https/github.com/kentcdodds/testing-workshop.svg?style=social
[emojis]: https://github.com/kentcdodds/all-contributors#emoji-key
[all-contributors]: https://github.com/kentcdodds/all-contributors
[win-path]: https://www.howtogeek.com/118594/how-to-edit-your-system-path-for-easy-command-line-access/
[mac-path]: http://stackoverflow.com/a/24322978/971592
[issue]: https://github.com/kentcdodds/testing-workshop/issues/new
[win-build-badge]: https://img.shields.io/appveyor/ci/kentcdodds/testing-workshop.svg?style=flat-square
[win-build]: https://ci.appveyor.com/project/kentcdodds/testing-workshop
