logstash
========

This is a very easy logstash example.
It does not export any ports by default, you have to explicitly export them.

Based upon the Ubuntu trusty image.

```
$ docker run -d --name logstash -p 514:514 -v /my/logstash:/etc/logstash/conf.d sspreitzer/logstash
```

