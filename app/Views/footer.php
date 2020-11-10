	<!-- Modal -->
	<div class="modal fade" id="modalInsertConfrontation" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">Confronto</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form id="formInsertConfrontation" action="<?= current_url() ?>" method="post">
				<div class="modal-body">
					<div class="container">
						<div class="row">
							<div class="col-sm-5 text-center">
								<p>Time da casa</p>
								<div class="row">
									<select id="home" required name="home" class="form-control col-sm-9"></select>
									<input type="text" required name="score_home" class="form-control col-sm-3" onkeyup="this.value=this.value.replace(/[^\d]/,'')">
								</div>
							</div>
							<div class="col-sm-2 text-center">
								<p>&nbsp;</p>
								<input type="text" name="placar_visitante" class="form-control text-center" value="X" disabled>
							</div>
							<div class="col-sm-5 text-center">
								<p>Visitante</p>
								<div class="row">
									<input type="text" required name="score_visitor" class="form-control col-sm-3" onkeyup="this.value=this.value.replace(/[^\d]/,'')">
									<select id="visitor" required name="visitor" class="form-control col-sm-9"></select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="reset" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
					<button type="submit" class="btn btn-primary">Salvar mudanças</button>
				</div>
			</form>
			</div>
		</div>
	</div>
	
	<script src="<?= base_url('assets/jquery-3.5.1.min.js')?>"></script>
	<script src="<?= base_url('assets/bootstrap/js/bootstrap.min.js')?>"></script>
    <script src="<?= base_url('assets/toastr/toastr.min.js') ?>"></script>
	<script src="<?= base_url('assets/main.js')?>"></script>
</body>

</html>