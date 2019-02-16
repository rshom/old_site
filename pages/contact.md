---
layout: page
title: Contact
permalink: /contact/
---

{% if site.email %}
**Email:** [{{site.email}}](email:{{site.email}})
{% endif %}

# Social Media
{% if site.linkedin_username %}
**LinkedIn:** [{{site.linkedin_username}}](https://www.linkedin.com/in/{{site.linkedin_username}})
{% endif %}

{% if site.github_username %}
**GitHub:** [{{site.github_username}}](https://github.com/{{site.github_username}})
{% endif %}

{% if site.twitter_username %}
**Twitter:** {{site.twitter_username}}
{% endif %}

