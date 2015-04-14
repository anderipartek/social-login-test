<!doctype html>

<html lang="es">
<head>
  <meta charset="utf-8">

  <title>Windows SingIn</title>
  <meta name="description" content="Windows SingIn">
  <meta name="author" content="SitePoint"> 

  <!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>

<body>
  
  <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	  <script>

	  //@see: https://developers.facebook.com/docs/facebook-login/login-flow-for-web/v2.2?locale=es_ES
	  
	  // This is called with the results from from FB.getLoginStatus().
	  function statusChangeCallback(response) {
	    console.log('statusChangeCallback');
	    console.log(response);
	    // The response object is returned with a status field that lets the
	    // app know the current login status of the person.
	    // Full docs on the response object can be found in the documentation
	    // for FB.getLoginStatus().
	    if (response.status === 'connected') {
	      // Logged into your app and Facebook.
	      testAPI();
	    } else if (response.status === 'not_authorized') {
	      // The person is logged into Facebook, but not your app.
	      document.getElementById('status').innerHTML = 'Please log ' +
	        'into this app.';
	    } else {
	      // The person is not logged into Facebook, so we're not sure if
	      // they are logged into this app or not.
	      document.getElementById('status').innerHTML = 'Please log ' +
	        'into Facebook.';
	    }
	  }

	  // This function is called when someone finishes with the Login
	  // Button.  See the onlogin handler attached to it in the sample
	  // code below.
	  function checkLoginState() {
	    FB.getLoginStatus(function(response) {
	      statusChangeCallback(response);
	    });
	  }

	  window.fbAsyncInit = function() {
		  FB.init({
		    appId      : '1545172962434547',
		    cookie     : true,  // enable cookies to allow the server to access the session	                        
		    xfbml      : true,  // parse social plugins on this page
		    version    : 'v2.1' // use version 2.1
		  });
	
		  // Now that we've initialized the JavaScript SDK, we call 
		  // FB.getLoginStatus().  This function gets the state of the
		  // person visiting this page and can return one of three states to
		  // the callback you provide.  They can be:
		  //
		  // 1. Logged into your app ('connected')
		  // 2. Logged into Facebook, but not your app ('not_authorized')
		  // 3. Not logged into Facebook and can't tell if they are logged into
		  //    your app or not.
		  //
		  // These three cases are handled in the callback function.
	
		  FB.getLoginStatus(function(response) {
		    statusChangeCallback(response);
		  });

	  };

	  // Load the SDK asynchronously
	  (function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = "//connect.facebook.net/en_US/sdk.js";
	    fjs.parentNode.insertBefore(js, fjs);
	  }(document, 'script', 'facebook-jssdk'));

	  // Here we run a very simple test of the Graph API after login is
	  // successful.  See statusChangeCallback() for when this call is made.
	  function testAPI() {
	    console.log('Welcome!  Fetching your information.... ');
	    //@see: https://developers.facebook.com/tools/
	    FB.api('/me', function(response) {
	      console.log('Successful login for: ' + response.name);
	      document.getElementById('status').innerHTML =
	        'Thanks for logging in, ' + response.name + '!';
	    });
	    
	    //imagen de fondo cover
	    FB.api('/me/?fields=cover', function(response) {
	    	$('#cover').html( '<img src="'+ response.cover.source + '" title="perfil"/>' );
	    });
	    
	    //profile picture
	    FB.api('/me/picture?type=large&redirect=false', function(response) {
	    	$('#picture').html( '<img src="'+ response.data.url + '" title="perfil"/>' );
	    });
	    
	  }
	  
	  function logout(){
		  FB.logout(function(response) {
		        // Person is now logged out
		        console.log('logout: '+ response);
		        document.getElementById('status').innerHTML = "Desconectado";
		        $('#picture').html("");
		        $('#cover').html("");
		    });
	  } 
	  
	  /* Login without login button, custom login */
	  function login(){
		  FB.login(function(response) {
			   // handle the response
			  statusChangeCallback(response);
			 }, {scope: 'public_profile,email'});
	  }
	  
	  
	 </script>
	<!--
	  Below we include the Login Button social plugin. This button uses
	  the JavaScript SDK to present a graphical Login button that triggers
	  the FB.login() function when clicked.
	-->
	
	<h1> FACEBOOK </h1>
	<a href="https://developers.facebook.com/docs/facebook-login/login-flow-for-web/v2.2?locale=es_ES" target="_blank">info</a>
	
	<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
	</fb:login-button>
	
	<div id="status"></div>
	<div id="logout"><a href="#" onclick="javascript: logout();">[x] desconectar</a></div>
	
	<div id="login"><a href="#" onclick="javascript: login();">Conectar Facebook sin boton</a></div>
	
	<div id="picture"></div>
	<div id="cover"></div>


	<br>
	<hr>	
	<h1> GOOGLE  </h1>
	<i>Es necesario crear dos credenciales OAUTH y publica navegador</i>
	<input type="button"  value="LogingGogle" onclick="loginGoogle()" />
	<input type="button"  value="LogoutGoogle" onclick="logoutGoogle()" />
 
	<div id="profile"></div>
	<script type="text/javascript">
	 
		function logoutGoogle()
		{
		    gapi.auth.signOut();
		    location.reload();
		}
	
		function loginGoogle() 
		{
		  var myParams = {
			//OAuth: ID de cliente para aplicaciones web	  
		    'clientid' : '460625231632-p0n8sme968lcg50g88qaidh737mn04ma.apps.googleusercontent.com',
		    'cookiepolicy' : 'single_host_origin',
		    'callback' : 'loginCallbackGoogle',
		    'approvalprompt':'force',
		    'scope' : 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.profile.emails.read'
		  };
		  gapi.auth.signIn(myParams);
		}
	 
		function loginCallbackGoogle(result)
		{
		    if(result['status']['signed_in'])
		    {
		        var request = gapi.client.plus.people.get(
		        {
		            'userId': 'me'
		        });
		        request.execute(function (resp)
		        {
		            var email = '';
		            if(resp['emails'])
		            {
		                for(i = 0; i < resp['emails'].length; i++)
		                {
		                    if(resp['emails'][i]['type'] == 'account')
		                    {
		                        email = resp['emails'][i]['value'];
		                    }
		                }
		            }
		 
		            var str = "Name:" + resp['displayName'] + "<br>";
		            str += "Image:" + resp['image']['url'] + "<br>";
		            str += "<img src='" + resp['image']['url'] + "' /><br>";
		 
		            str += "URL:" + resp['url'] + "<br>";
		            str += "Email:" + email + "<br>";
		            document.getElementById("profile").innerHTML = str;
		        });
		 
		    }
		 
		}
	
		function onLoadCallbackGoogle()
		{
			//Acceso API publica: Clave para las aplicaciones de navegador	
		    gapi.client.setApiKey('AIzaSyBpJ4XghfmPy5t2UrfzL0wljqfmqbBlp9o');
		    gapi.client.load('plus', 'v1',function(){});
		}
		 
	    </script>
	 
	<script type="text/javascript">
	      (function() {
	       var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
	       po.src = 'https://apis.google.com/js/client.js?onload=onLoadCallbackGoogle';
	       var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
	     })();
	</script>
	

	<br>
	<hr>
	
	<h1> WINDOWS  </h1>
		
	<form action="#" method="post">
		<input type="text" id="user" name="user" value="">
	</form>
	
	
	<div id="help" style="display: none;">
		<h1>Configurar Single SignIn</h1>
		<p>1. Por favor usa INTERNET EXPLORER</p>
		<p>2. Habilita ActiveX</p>		
		<p>3. Reinicia la ventana F5</p>
		<br>
		<a href="https://msdn.microsoft.com/es-es/library/101853ac(v=vs.90).aspx" target="_blank"> Como configurarlo </a>
	</div>
	
	
	<script language="javascript">
	
	    function GetWindowsUserName()
	    {
	    	  var help = document.getElementById('help');
		      try{
		    	help.style.display='none';
		    	var wshell = new ActiveXObject("WScript.Shell");
		     	var user = wshell.ExpandEnvironmentStrings("%USERNAME%");
		     	document.getElementById('user').value= user;
		      }catch (e) {
				console.error(e);	
				help.style.display='inline';
			  }
	    }
	    
	    //descomentar para llamar ala metodo
	    GetWindowsUserName();
	
	</script>

</body>
</html>