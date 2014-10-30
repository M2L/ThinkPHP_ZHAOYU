<?php echo $this->fetch('inc/header.html'); ?> 
<?php
$this->_var['dpagecss'][] = $this->_var['TMPL_REAL']."/css/deal.css";
$this->_var['dpagecss'][] = $this->_var['TMPL_REAL']."/css/deal_comment.css";
$this->_var['dpagecss'][] = $this->_var['TMPL_REAL']."/css/fancybox.css";
$this->_var['dpagejs'][] = $this->_var['TMPL_REAL']."/js/jquery.fancybox.js";
$this->_var['dpagejs'][] = $this->_var['TMPL_REAL']."/js/deal.js";
$this->_var['dcpagejs'][] = $this->_var['TMPL_REAL']."/js/deal.js";
$this->_var['dpagejs'][] = $this->_var['TMPL_REAL']."/js/deal_comment.js";
$this->_var['dcpagejs'][] = $this->_var['TMPL_REAL']."/js/deal_comment.js";

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
				<?php if ($this->_var['user_info']): ?>
				<div class="comment_form">
					<form name="comment_form" action="<?php
echo parse_url_tag("u:deal#savedealcomment|"."id=".$this->_var['deal_info']['id']."".""); 
?>">
					<textarea name="content" class="comment_form_content">发表评论</textarea>
					<div class="blank"></div>
					<div class="comment-btn">
						<span class="syn_weibo">
							<input type="checkbox" name="syn_weibo" value="1" />
							<span>同时发布至我的微博 </span>
						</span>				
						<div class="ui-button green send_btn" rel="green">
								<div>
									<span>发送</span>
								</div>
						</div>	
						<div class="blank"></div>
					</div>
					<input type="hidden" name="ajax" value="1" />
					</form>
				</div>
				<?php else: ?>
				<div class="comment-content" style="font-size:12px;">请登录后评论，立即 <a href="<?php
echo parse_url_tag("u:user#login|"."".""); 
?>" class="linkgreen">登录</a> 或 <a href="<?php
echo parse_url_tag("u:user#register|"."".""); 
?>"  class="linkgreen">注册</a></div>			
				<?php endif; ?>
				<div class="blank"></div>
				<?php $_from = $this->_var['comment_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'comment_item');if (count($_from)):
    foreach ($_from AS $this->_var['comment_item']):
?>
				<?php echo $this->fetch('inc/comment_item_nolog.html'); ?>
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