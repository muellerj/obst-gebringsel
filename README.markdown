# Website for Institut für Rehabilitation
Viewable at http://www.institut-rehabilitation.de

```author
Author: Jonas Müller
Date: March 2001 to April 2013
```
Complete rewrite from the original rails-based version. Most content is served through static markdown files, including the descriptions and the staff detail pages, which are served via AJAX-requests. The only dynamic content is the feedback email system, which allows the delivery of simple feedback to a predefined address.

# Deploy to heroku:

```shell
heroku addons:add custom_domains:basic
heroku addons:add sendgrid:starter
heroku domains:add institut-rehabilitation.de
heroku domains:add www.institut-rehabilitation.de
```