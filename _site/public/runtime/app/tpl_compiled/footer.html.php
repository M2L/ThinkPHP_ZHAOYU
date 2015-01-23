<div id="gotop"></div>
<div class="blank0"></div>
<div class="footer">
	<div class="wrap ">
		<div class="help_row" >
			
						 
			

			<?php $_from = $this->_var['helps']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'help');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['help']):
?>
			<?php if (( $this->_var['key'] != 0 ) && ( $this->_var['helps'] [ $this->_var['key'] ] [ 'sort' ] != $this->_var['helps'] [ $this->_var['key'] - 1 ] [ 'sort' ] )): ?>
				</div>
			<?php endif; ?>
			<?php if (( $this->_var['key'] == 0 ) || ( $this->_var['helps'] [ $this->_var['key'] ] [ 'sort' ] != $this->_var['helps'] [ $this->_var['key'] - 1 ] [ 'sort' ] )): ?>
				<div  class="foot_menu">
			<?php endif; ?>
			<?php if (( $this->_var['helps'] [ $this->_var['key'] ] [ 'sort' ] == 3 ) && ( $this->_var['helps'] [ $this->_var['key'] ] [ 'sort' ] != $this->_var['helps'] [ $this->_var['key'] - 1 ] [ 'sort' ] )): ?>
				<a href="<?php
echo parse_url_tag("u:faq|"."".""); 
?>" title="常见问题" style="display:block">常见问题</a>		
			<?php endif; ?>
			 <a href="<?php echo $this->_var['help']['url']; ?>" title="<?php echo $this->_var['help']['title']; ?>"  style="display:block"><?php echo $this->_var['help']['title']; ?></a>
		

			<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
			</div>
			<div class="blank"></div>
			<div class="license">
				<!--
					<?php 
$k = array (
  'name' => 'app_conf',
  'v' => 'SITE_LICENSE',
);
echo $k['name']($k['v']);
?>
				-->
			</div>
		</div>
	</div>
</div>
