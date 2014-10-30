<div class="page_title">
			<?php echo $this->_var['deal_info']['name']; ?>
</div>
<div class="author_row">
	<span>作者：</span>
	<?php if ($this->_var['deal_info']['user_id'] != 0): ?>
	<span><a href="<?php
echo parse_url_tag("u:home|"."id=".$this->_var['deal_info']['user_id']."".""); 
?>"><?php echo $this->_var['deal_info']['user_name']; ?></a></span>
	<span onclick="send_message(<?php echo $this->_var['deal_info']['user_id']; ?>);" class="send_message"></span>
	<?php else: ?><span><?php 
$k = array (
  'name' => 'app_conf',
  'v' => 'SITE_NAME',
);
echo $k['name']($k['v']);
?></span>
	<?php endif; ?>
</div>
<div class="blank"></div>
<div class="blank"></div>		
<div class="switch_nav" style="position:relative;">
	<?php if ($this->_var['is_focus']): ?>
	<div class="ui-button gray focus_deal" rel="gray" id="<?php echo $this->_var['deal_info']['id']; ?>">
		<div>
			<span>取消关注</span>
		</div>
	</div>
	<?php else: ?>
	<div class="ui-button blue focus_deal" rel="blue" id="<?php echo $this->_var['deal_info']['id']; ?>">
		<div>
			<span>立即关注</span>
		</div>
	</div>
	<?php endif; ?>
	<ul>
		<li <?php if (ACTION_NAME == 'show'): ?>class="current"<?php endif; ?>><a href="<?php
echo parse_url_tag("u:deal#show|"."id=".$this->_var['deal_info']['id']."".""); 
?>">项目主页</a></li>
		<li <?php if (ACTION_NAME == 'update' || ACTION_NAME == 'updatedetail'): ?>class="current"<?php endif; ?>><a href="<?php
echo parse_url_tag("u:deal#update|"."id=".$this->_var['deal_info']['id']."".""); 
?>">动态(<?php echo $this->_var['deal_info']['log_count']; ?>)</a></li>
		<li <?php if (ACTION_NAME == 'support'): ?>class="current"<?php endif; ?>><a href="<?php
echo parse_url_tag("u:deal#support|"."id=".$this->_var['deal_info']['id']."".""); 
?>">支持者(<?php echo $this->_var['deal_info']['support_count']; ?>)</a></li>
		<li <?php if (ACTION_NAME == 'comment'): ?>class="current"<?php endif; ?>><a href="<?php
echo parse_url_tag("u:deal#comment|"."id=".$this->_var['deal_info']['id']."".""); 
?>">评论(<?php echo $this->_var['deal_info']['comment_count']; ?>)</a></li>				
	</ul>
		
</div>