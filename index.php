<?php
	include "includes/navbar.php";
?>
	<div class="jumbotron">
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img class="d-block w-100" src="https://www.blueosa.com/wp-content/uploads/2020/01/the-best-top-10-indian-dishes.jpg" alt="First slide" style="height: 400px;width: 600px; border-radius: 15px">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="https://sukhis.com/wp-content/uploads/2017/06/Appetizers.jpg" alt="Second slide" style="height: 400px;width: 600px; border-radius: 15px">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="https://www.unileverfoodsolutions.lk/dam/global-ufs/mcos/meps/sri-lanka/calcmenu/recipes/LK-recipes/general/authentic-chicken-biryani/main-header.jpg" alt="Third slide" style="height: 400px;width: 600px; border-radius: 15px">
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
		
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3 class="mb-4">Non Veg</h3>
			</div>

			<?php 
				$conn = mysqli_connect("localhost","root","","amazon");

				$query = "SELECT * FROM products WHERE category LIKE 'Non Veg' LIMIT 4";

				$result = mysqli_query($conn,$query);

				while($row = mysqli_fetch_assoc($result)){
					$img = substr(explode(',', $row['bg_img'])[0], 1);
					echo '<div class="col-md-3">
							<div class="card">
								<img style="height: 200px" src='.$img.'>
								<div class="card-body">
									<h4>'.$row['name'].'</h4>
									<p>Rs '.$row['price'].'</p>
									<a href="description.php?product_id='.$row['product_id'].'" class="btn btn-warning btn-block">View</a>
								</div>
							</div>
						</div>';
				}
			?>
			
			
			
		</div>
		<div class="row">
			
			<div class="col-md-12">
				<h3>Veg</h3>
			</div>

			<?php 
				$conn = mysqli_connect("localhost","root","","amazon");

				$query = "SELECT * FROM products WHERE category LIKE 'Veg' LIMIT 4";

				$result = mysqli_query($conn,$query);

				while($row = mysqli_fetch_assoc($result)){
					$img = substr(explode(',', $row['bg_img'])[0], 1);
					echo '<div class="col-md-3">
							<div class="card">
								<img style="height: 200px" src='.$img.'>
								<div class="card-body">
									<h4>'.$row['name'].'</h4>
									<p>Rs '.$row['price'].'</p>
									<a href="description.php?product_id='.$row['product_id'].'" class="btn btn-warning btn-block">View</a>
								</div>
							</div>
						</div>';
				}
			?>
		</div>
		<div class="row">
			<div class="col-md-12">
				<h3>Desserts</h3>
			</div>

			<?php 
				$conn = mysqli_connect("localhost","root","","amazon");

				$query = "SELECT * FROM products WHERE category LIKE 'Desserts' LIMIT 4";

				$result = mysqli_query($conn,$query);

				while($row = mysqli_fetch_assoc($result)){
					$img = substr(explode(',', $row['bg_img'])[0], 1);
					echo '<div class="col-md-3">
							<div class="card">
								<img style="height: 200px" src='.$img.'>
								<div class="card-body">
									<h4>'.$row['name'].'</h4>
									<p>Rs '.$row['price'].'</p>
									<a href="description.php?product_id='.$row['product_id'].'" class="btn btn-warning btn-block">View</a>
								</div>
							</div>
						</div>';
				}
			?>

		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Login</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action="login_validation.php" method="POST">
	        	<label>Email</label><br>
	        	<input class="form-control" type="email" name="user_email"><br>
	        	<label>Password</label><br>
	        	<input class="form-control" type="password" name="user_password"><br><br>
	        	<input type="submit" name="" value="Login" class="btn btn-warning">
	        </form>
	        <div>
	        	<p class="mt-3">Not a member? <a id="register-popup" href="#">Sign Up</a></p>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Register</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action="reg_validation.php" method="POST">
	        	<label>Name</label><br>
	        	<input type="text" name="user_name" class="form-control"><br>
	        	<label>Email</label><br>
	        	<input class="form-control" type="email" name="user_email"><br>
	        	<label>Password</label><br>
	        	<input class="form-control" type="password" name="user_password"><br><br>
	        	<input type="submit" name="" value="Register" class="btn btn-warning">
	        </form>
	      </div>
	    </div>
	  </div>
	</div>

</body>
</html>