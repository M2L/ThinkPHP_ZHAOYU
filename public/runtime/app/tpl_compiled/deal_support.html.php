<?php echo $this->fetch('inc/header.html'); ?> 
<?php
$this->_var['dpagecss'][] = $this->_var['TMPL_REAL']."/css/deal.css";
$this->_var['dpagecss'][] = $this->_var['TMPL_REAL']."/css/deal_support.css";
$this->_var['dpagecss'][] = $this->_var['TMPL_REAL']."/css/fancybox.css";
$this->_var['dpagejs'][] = $this->_var['TMPL_REAL']."/js/jquery.fancybox.js";
$this->_var['dpagejs'][] = $this->_var['TMPL_REAL']."/js/deal.js";
$this->_var['dcpagejs'][] = $this->_var['TMPL_REAL']."/js/deal.js";

?>
<link rel="stylesheet" type="text/css" href="<?php 
$k = array (
  'name' => 'parse_css',
  'v' => $this->_var['dpagecss'],
);
echo $k['name']($k['v']);
?>" />
<script type="text/javascript" src="<?php 
$k = array (
  'name' => 'parse_script',
  'v' => $this->_var['dpagejs'],
  'c' => $this->_var['dcpagejs'],
);
echo $k['name']($k['v'],$k['c']);
?>"></script>

<div class="blank"></div>
<div class="shadow_bg">
	<div class="wrap white_box">
		<?php echo $this->fetch('inc/deal_header.html'); ?>

		
		<div class="deal_box">
			<div class="deal_left">
				<?php $_from = $this->_var['support_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'support_item');if (count($_from)):
    foreach ($_from AS $this->_var['support_item']):
?>
				<div class="support_item">
					<div class="support_avatar"><?php 
$k = array (
  'name' => 'show_avatar',
  'p' => $this->_var['support_item']['user_id'],
);
echo $k['name']($k['p']);
?></div>
					<div class="support_info">
						<div class="support_user_name">
						<a href="<?php
echo parse_url_tag("u:home|"."id=".$this->_var['support_item']['user_id']."".""); 
?>" class="linkgreen"><?php echo $this->_var['support_item']['user_info']['user_name']; ?></a>
						<span class="support_loc">(<?php echo $this->_var['support_item']['user_info']['province']; ?><?php echo $this->_var['support_item']['user_info']['city']; ?>)</span>
						</div>
						<div class="blank5"></div>
						<?php 
$k = array (
  'name' => 'to_date',
  'v' => $this->_var['support_item']['create_time'],
);
echo $k['name']($k['v']);
?> 支持了 <?php 
$k = array (
  'name' => 'format_price',
  'v' => $this->_var['support_item']['price'],
);
echo $k['name']($k['v']);
?>
						<div class="blank5"></div>
						TA总共支持了<?php echo $this->_var['support_item']['user_info']['support_count']; ?>个项目
					</div>
					<div class="blank1"></div>
				</div>
				<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
				
				<div class="blank"></div>
				<div class="pages"><?php echo $this->_var['pages']; ?></div>
			</div><!--end left-->
			<div class="deal_right">
				<?php echo $this->fetch('inc/deal_right.html'); ?>
			</div><!--end right-->
		</div>
		
		<div class="blank"></div>
		
	</div>
</div>
<div class="blank"></div>
<?php echo $this->fetch('inc/footer.html'); ?> 