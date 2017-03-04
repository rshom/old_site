---
layout: page
title: Contact
permalink: /contact/
---

Feel free to contact me by any of the means below.

{% if site.email %}
**EMail:** [{{site.email}}](email:{{site.email}})
{% endif %}

# Social Media
{% if site.linkedin_username %}
{% include icon-linkedin.html username=site.linkedin_username %}
**LinkedIn:** [{{site.linkedin_username}}](https://www.linkedin.com/in/{{site.linkedin_username}})
{% endif %}

{% if site.github_username %}
{% include icon-github.html username=site.github_username %}
**GitHub:** [{{site.github_username}}](https://github.com/{{site.github_username}})
{% endif %}

{% if site.twitter_username %}
{% include icon-twitter.html username=site.twitter_username %}
**Twitter:** {{site.twitter_username}}
{% endif %}

