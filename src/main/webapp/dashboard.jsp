<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Dashboard</title>
		<link rel="stylesheet" type="text/css" href="/css/style.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
     	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
	
		
	</head>

	<body>
		
		
		
		<div class="mainCont">
	        <div class="side">
	            <a href="/logout"><i class="fa-sharp fa-solid fa-right-from-bracket"></i></a>
				
				<div class="icon-container">
				  <a href="#"><i class="fa-sharp fa-solid fa-house-chimney iconColor"></i></a>
				  <span class="icon-label">Home</span>
				</div>
				
				
				<div class="icon-container">
				  <a href="#"><i class="fa-solid fa-right-left"></i></a>
				  <span class="icon-label">Transizioni</span>
				</div>
				
				<div class="icon-container">
				  <a href="#"><i class="fa-solid fa-bullseye"></i></a>
				  <span class="icon-label">Obiettivi</span>
				</div>
				
				
				<div class="icon-container">
				  <a href="#"><i class="fa-solid fa-wallet iconColor"></i></a>
				  <span class="icon-label">Budget</span>
				</div>
				
				<a href="#">altra voce</a>
				
			</div>
			<div class="main-content">
	            <nav class="navbar navbar-expand-lg bg-body-tertiary">
	                <div class="container-fluid">
	                    <a class="navbar-brand" href="#">My Smart Wallet <!-- <img id="logo" src="./logo.png" alt="logo"> --></a>
	                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	                    <span class="navbar-toggler-icon"></span>
	                    </button>
	                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		                    <form class="d-flex" role="search">
		                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
		                        <button class="btn btn-outline-success" type="submit">Search</button>
		                    </form>
	                    	<ul class="navbar-nav mb-2 mb-lg-0">
								<li class="nav-item">
									<a class="nav-link active" aria-current="page" href="/">Home</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#">Link</a>
								</li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="#">Action</a></li>
										<li><a class="dropdown-item" href="#">Another action</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="#">Something else here</a></li>
									</ul>
								</li>
								<li class="nav-item">
									<div id="userCont">
										
										<a href="#"><h6>ciao, <br><c:out value="${sessionScope.user.nome}"/></h6></a>
										<div id="userImg">
											<a href="#"><img alt="" src="imgs/gianpiero.jpeg"></a>
										</div>
									</div>
								</li>
	                    	</ul>
	                    </div>
	                </div>
	            </nav>
				<h1>Contenuto principale</h1>
				<h1>Benvenuto <c:out value="${sessionScope.user.nome}"/></h1>
				
				
				<div id="bilanciContainer">
				
					<div id="recapMensile">
						<div id="recapImg">
													
							<h4>testo</h4>
							
						</div>
						
						<div id="bilanciMens">
						
							<div class="bilancioCont">
								<h4>bilancio mensile</h4>
								<h6>300 €</h6>
							</div>
							<div class="bilancioCont">
								<h4>bilancio mensile</h4>
								<h6>300 €</h6>
							</div>
							<div class="bilancioCont">
								<h4>bilancio mensile</h4>
								<h6>300 €</h6>
							</div>
						</div>
					</div>
					
					<div id="bilanciMens2">
					
						<div id="bilancioCol1">
							
						</div >
						<div id="bilancioCol2">
						
						</div >
					</div>
					
				</div>
				
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor ex vel libero ultrices hendrerit. Maecenas eu massa sit amet nisl semper elementum. Sed laoreet commodo justo, vel mollis urna gravida at. Integer at mauris velit. Proin finibus ligula non tellus facilisis consequat. Nam ultricies feugiat felis, vel pharetra neque aliquet sit amet. Praesent sodales ullamcorper quam, in suscipit enim iaculis vel.</p>
				<p>Morbi ac aliquet nisi. Maecenas ultrices massa sit amet ligula tincidunt lobortis. Duis bibendum felis eget faucibus lacinia. Fusce vitae est eget libero tristique aliquam. Vestibulum sagittis orci vel lectus iaculis, nec efficitur magna posuere. Integer id volutpat magna, vel pellentesque eros. Fusce eget eleifend mauris. Aenean efficitur aliquam tellus nec imperdiet.</p>
				<p>Etiam eu magna pharetra, semper ex at, fermentum orci. Praesent posuere quis
	            <p>
	                Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae dolores quia ipsum sunt dolor non velit impedit, quas facere
	                fugit magni laudantium optio consectetur ratione dolorum et deserunt rerum nihil accusantium eligendi? Voluptatibus esse 
	                laboriosam, consequatur a dolores illum illo corrupti, doloribus id explicabo necessitatibus cumque ducimus provident! Totam 
	                veniam incidunt libero doloribus illum dolores beatae ratione provident iste, fugit quisquam rerum nemo quos voluptatibus, 
	                laborum tempora molestias ab numquam pariatur saepe repellat suscipit? Repudiandae quidem ipsum necessitatibus incidunt 
	                commodi qui perspiciatis architecto molestias laborum voluptatem iure, numquam aliquid obcaecati error nisi assumenda harum 
	                aperiam dolorum beatae quibusdam autem maxime, explicabo totam? Eaque, harum? Voluptatem quo exercitationem mollitia a magnam 
	                voluptatibus numquam quidem expedita! Accusamus nemo maiores ex vitae, quae id ullam, odit animi illo corrupti minima 
	                doloremque ut labore. Illum nesciunt iure, dolores ab repellendus similique sunt blanditiis porro quos eaque voluptate id at 
	                quisquam assumenda consequuntur numquam. Inventore quasi molestiae voluptas a quos placeat, molestias aliquam commodi at 
	                veniam laboriosam quisquam amet, corrupti nam voluptate nihil quis aut. Rerum modi ipsam ea hic? Quae officiis sunt quasi quas,
	                voluptatibus pariatur cupiditate? Sed impedit labore, ducimus iusto veritatis architecto perferendis asperiores laudantium, 
	                modi, suscipit consequuntur alias voluptatem ipsum illo ut laboriosam! Asperiores, quos. Accusantium nesciunt modi aliquam. 
	                Hic, reprehenderit est quis nobis aspernatur ipsam expedita. Suscipit laudantium itaque blanditiis optio eum debitis nostrum 
	                ratione similique eaque, quidem alias ex voluptas, magni tenetur recusandae modi hic molestiae magnam ipsum quos, doloremque 
	                velit commodi sunt nobis! Facilis itaque, odit tempore commodi porro rem mollitia quae quidem libero ipsam? Reiciendis
	                recusandae non excepturi amet illum. Repellendus ipsam omnis similique tempora, in deserunt illo? Beatae repudiandae nobis 
	                quos ipsa sit voluptates deserunt aspernatur ut, odio aliquid quas sunt repellendus, nemo rerum modi. Impedit explicabo 
	                repudiandae omnis nihil quis aperiam tempore vero dolorem. Officiis quam error facere quis, harum excepturi repellat soluta 
	                unde modi iste in voluptate cumque enim sit eveniet dignissimos eos consequuntur veritatis magnam numquam. Hic illum qui
	                sint ratione ducimus nesciunt alias fuga, illo consequuntur nobis quaerat consequatur reprehenderit nemo rerum totam labore 
	                quo possimus deleniti! Eveniet excepturi nam nostrum deleniti impedit dolorum molestiae iste quas culpa itaque minus 
	                dolorem, quam iusto blanditiis dolor! Excepturi sequi dolore laudantium quo aliquid eius vel assumenda architecto 
	                cupiditate, cumque laboriosam asperiores facilis blanditiis beatae iure esse non. Magni, fugit nobis. Quod at ad autem 
	                vitae, et quis repudiandae debitis eveniet illo ipsa odit itaque aspernatur dolore deleniti in sequi accusamus laudantium 
	                ullam quo officia explicabo, voluptatum fugiat consequuntur! Praesentium deleniti numquam rerum dicta doloremque tenetur 
	                eius laboriosam nemo fugit nobis. Asperiores, voluptate. Laudantium neque labore voluptatem ullam dolorem accusantium et, 
	                harum accusamus, atque dicta, inventore totam. Eligendi iure consectetur unde perferendis excepturi praesentium odit eum, 
	                veniam libero totam, et delectus distinctio corporis quas ipsum! Nostrum cum et ratione illo autem dolor facilis. Ab amet 
	                sit eligendi ex corrupti ea quia illum iste. Nostrum possimus beatae deleniti minima modi aspernatur asperiores vero impedit
	                assumenda saepe reprehenderit eum cumque magni maiores totam, provident aliquam alias laborum earum ipsa aperiam quaerat 
	                mollitia obcaecati amet. Reiciendis asperiores dolorum nostrum eligendi tenetur odio ea magni labore distinctio 
	                necessitatibus nobis eum recusandae quibusdam officiis fugit eos molestiae animi, consequatur, nam aperiam accusamus dolor
	                autem! Optio ex repellendus rerum dolorum qui eveniet, distinctio amet eligendi impedit, aut esse officiis autem. Non 
	                deleniti explicabo reiciendis nisi nesciunt nobis, ut laboriosam saepe vel sapiente voluptas minima nemo autem, ipsa 
	                necessitatibus quibusdam, ipsam consectetur qui animi! Temporibus pariatur quis rem? Distinctio doloremque quidem, velit
	                expedita inventore cumque eum odit atque voluptas, omnis ex, assumenda autem pariatur ducimus maxime esse aut corrupti 
	                adipisci. Officia vitae incidunt iusto consequatur tempora, fugiat sed dolorem cumque aliquid unde obcaecati omnis qui 
	                autem repellat illo earum laudantium itaque porro quisquam optio dignissimos! Placeat neque magni voluptate, earum unde 
	                aliquid ipsa eaque aperiam id enim saepe delectus voluptatem alias, atque incidunt autem consequatur assumenda pariatur 
	                quas error nesciunt ea! Reiciendis quaerat voluptate voluptatibus ducimus? Libero enim error labore optio exercitationem
	                ipsa obcaecati nam, praesentium atque laboriosam laudantium, doloremque minus unde dignissimos harum possimus sunt dicta
	                tempora provident eligendi quae eveniet nostrum accusantium eaque. Repellat dolores totam rem distinctio esse incidunt 
	                aliquam harum blanditiis similique nulla magni quo sapiente qui, labore excepturi doloremque corrupti minima fugiat ab 
	                eum dignissimos odio reprehenderit provident? Cupiditate alias incidunt recusandae. Quaerat eligendi ullam dolorum, 
	                natus necessitatibus unde incidunt molestiae amet vitae, aliquam a vero id porro sunt nesciunt, illum dolores nulla 
	                deserunt labore perspiciatis consequatur exercitationem at blanditiis! Aut, possimus perferendis eligendi debitis 
	                minima, quaerat amet inventore magnam, explicabo voluptatem tempore corporis dolorum sunt. Doloremque, rerum ratione 
	                consequuntur necessitatibus provident minus, inventore atque mollitia corrupti voluptas recusandae, fuga nobis ex 
	                deserunt voluptate temporibus vel voluptatibus eos itaque sit. Quo, autem odio voluptas deleniti cupiditate quibusdam 
	                ratione at neque aspernatur corporis ab quasi molestias laborum natus veritatis. Soluta officiis alias provident 
	                voluptas totam aliquam fugiat iste doloremque sequi aut quam, natus voluptatum. Aspernatur repudiandae sapiente aut 
	                assumenda cumque labore saepe, ipsa enim deleniti dolorem asperiores impedit maxime? Mollitia placeat possimus quos 
	                dolore repellendus voluptate maiores! Ad modi dicta similique ea impedit voluptatum nulla ex assumenda perferendis 
	                itaque dignissimos quis maiores consectetur quasi vel ipsam atque veniam quia ipsum at, consequuntur placeat illo. 
	                Temporibus explicabo possimus laudantium perferendis expedita quos sit excepturi dolore iusto veniam cumque rem nemo 
	                accusamus voluptas sequi ea placeat voluptatum, natus commodi et eum, praesentium voluptate rerum. Cum adipisci iste 
	                nihil ut exercitationem.
	            </p>
	        </div>
    	</div>
		
		
	
		
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
	</body>
</html>