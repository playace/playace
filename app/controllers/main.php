<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Main extends CI_Controller {
  public function index() {
		//$this->load->view('main');
		$this->smarty->display('main.html');
	}
}