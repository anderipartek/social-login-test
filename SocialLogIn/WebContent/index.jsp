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
	    
	    
	    FB.api('/me/picture?type=large&redirect=false', function(response) {
	    	$('#picture').html( '<img src="'+ response.data.url + '" title="perfil"/>' );
	    });
	    
	  }
	  
	  function logout(){
		  FB.logout(function(response) {
		        // Person is now logged out
		        console.log('logout: '+ response);
		        document.getElementById('status').innerHTML = "Desconectado";
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
	
	<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
	</fb:login-button>
	
	<div id="status"></div>
	<div id="logout"><a href="#" onclick="javascript: logout();">[x] desconectar</a></div>
	
	<div id="login"><a href="#" onclick="javascript: login();">Conectar Facebook sin boton</a></div>
	
	<div id="picture"></div>
  
	</hr>


	<br>

	USUARIO:	
	
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
	    function GetUserName()
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
	    
	    
	    GetUserName();
	    
	</script>

</body>
</html>