<?php echo $this->fetch('inc/header.html'); ?> 
<?php
$this->_var['dpagecss'][] = $this->_var['TMPL_REAL']."/css/deal.css";
$this->_var['dpagecss'][] = $this->_var['TMPL_REAL']."/css/deal_log.css";
$this->_var['dpagecss'][] = $this->_var['TMPL_REAL']."/css/fancybox.css";
$this->_var['dpagejs'][] = $this->_var['TMPL_REAL']."/js/jquery.fancybox.js";
$this->_var['dpagejs'][] = $this->_var['TMPL_REAL']."/js/deal.js";
$this->_var['dcpagejs'][] = $this->_var['TMPL_REAL']."/js/deal.js";
$this->_var['dpagejs'][] = $this->_var['TMPL_REAL']."/js/deal_log.js";
$this->_var['dcpagejs'][] = $this->_var['TMPL_REAL']."/js/deal_log.js";
$this->_var['dpagejs'][] = $this->_var['TMPL_REAL']."/js/discover.js";
$this->_var['dcpagejs'][] = $this->_var['TMPL_REAL']."/js/discover.js";
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
				<div class="deal_log_title">
					<div class="title">项目最新动态</div>				
					<?php if ($this->_var['deal_info']['user_id'] == $this->_var['user_info']['id'] && $this->_var['deal_info']['is_effect'] == 1): ?>
					<div class="ui-button green" id="add_update" rel="green" url="<?php
echo parse_url_tag("u:deal#add_update|"."id=".$this->_var['deal_info']['id']."".""); 
?>">
						<div>
							<span>更新动态</span>
						</div>
					</div>	
					<?php endif; ?>
				</div>
				<div class="blank"></div>
				<div class="timeline">
					<div id="pin_box">
					
					<?php echo $this->fetch('inc/time_line_item.html'); ?>
				
					</div>
					<div class="ajax_loading_log" id="pin_loading" rel="<?php
echo parse_url_tag("u:ajax#dealupdate|"."id=".$this->_var['deal_info']['id']."&p=".$this->_var['current_page']."".""); 
?>">加载更多动态</div>
					
					<div class="pages"><?php echo $this->_var['pages']; ?></div>
										
				</div><!--end timeline-->
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