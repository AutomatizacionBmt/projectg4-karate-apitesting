function fn() {    
  karate.configure('connectTimeout', 25000);
  karate.configure('logPrettyResponse' , true);
  karate.configure('logPrettyRequest' , true);
  //var env = karate.env; // get system property 'karate.env'
  var env = java.lang.System.getenv('karateEnv');
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'local';
  }
  var config = {
    env: env,
	myVarName: 'someValue'
  }
  if (env == 'local') {
    // customize
    // e.g. config.foo = 'bar';
    config.urlApp = 'http://localhost:8081';
  } else if (env == 'dev') {
    config.urlApp = 'http://da1c9941d86f.ngrok.io';
  } else if (env == 'qa') {
    config.urlApp = 'http://qa:8081';
  }

  return config;
}