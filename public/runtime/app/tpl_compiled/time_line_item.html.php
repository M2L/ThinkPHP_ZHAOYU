<?php $_from = $this->_var['log_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'log_item');if (count($_from)):
    foreach ($_from AS $this->_var['log_item']):
?>
<?php if ($this->_var['log_item']['online_time_key']): ?>
<div rel="<?php echo $this->_var['log_item']['online_time_key']; ?>" class="timeline-time-mark-t"><p><?php echo $this->_var['log_item']['online_time']; ?></p><span></span></div>
<?php endif; ?>					
<!--time-box-->
<div class="timeline-box" id="post_<?php echo $this->_var['log_item']['id']; ?>">
	<div class="timeline-left-gray-box">
		<div class="timeline-left-gray"></div>
	</div>
	
	<?php if ($this->_var['log_item']['user_id'] > 0): ?>
	<a title="打开动态详情" href="<?php
echo parse_url_tag("u:deal#updatedetail|"."id=".$this->_var['log_item']['id']."".""); 
?>" class="projects-dynamic-open"></a>
	<?php endif; ?>
	
	<?php if ($this->_var['log_item']['user_id'] > 0): ?>
	<div class="log_auth_row">
	<div class="log_user_avatar"><?php 
$k = array (
  'name' => 'show_avatar',
  'p' => $this->_var['log_item']['user_id'],
  't' => 'small',
);
echo $k['name']($k['p'],$k['t']);
?></div>
	<div class="log_user_info">
		<div class="deal_user_name" style="height:25px; line-height:25px;"><a href="<?php
echo parse_url_tag("u:home|"."id=".$this->_var['log_item']['user_id']."".""); 
?>"><?php echo $this->_var['log_item']['user_name']; ?></a></div>
		<div class="blank1"></div>
		<span class="f_l" style="font-size:12px;"  onclick="send_message(<?php echo $this->_var['log_item']['user_id']; ?>);">项目发起人</span>	
		<span onclick="send_message(<?php echo $this->_var['log_item']['user_id']; ?>);" class="send_message f_l" style="margin-left:5px; height:20px; background-position:0px 5px;"></span>				
	</div>
	<span class="f_r" style="padding-top:15px;"><?php echo $this->_var['log_item']['pass_time']; ?></span>
	<div class="blank1"></div>
	</div>
	<?php else: ?>
	<div class="timeline-start"><span>项目上线</span><strong class="timeline-posted-at"><?php 
$k = array (
  'name' => 'to_date',
  'v' => $this->_var['deal_info']['begin_time'],
);
echo $k['name']($k['v']);
?></strong>
	<div class="blank1"></div>
	</div>
	<?php endif; ?>
	
	<div class="blank"></div>
	<?php if ($this->_var['log_item']['log_info'] != ''): ?>
	<?php 
$k = array (
  'name' => 'nl2br',
  'v' => $this->_var['log_item']['log_info'],
);
echo $k['name']($k['v']);
?>
	<?php else: ?>
	由 <?php echo $this->_var['deal_info']['user_name']; ?> 发起的项目「<?php echo $this->_var['deal_info']['name']; ?>」上线了。
	此项目必须
	<?php if ($this->_var['deal_info']['end_time'] > 0): ?>
	在 <?php 
$k = array (
  'name' => 'to_date',
  'v' => $this->_var['deal_info']['end_time'],
  'f' => 'Y年m月d日H:i',
);
echo $k['name']($k['v'],$k['f']);
?> 之前，
	<?php endif; ?>
	达到 ¥<?php 
$k = array (
  'name' => 'number_price_format',
  'v' => $this->_var['deal_info']['limit_price'],
);
echo $k['name']($k['v']);
?> 的目标才可成功。
	<?php endif; ?>
	
	<?php if ($this->_var['log_item']['source_vedio'] != ''): ?>
	<div class="blank"></div>
	<embed wmode="opaque"wmode="opaque"src="<?php echo $this->_var['log_item']['source_vedio']; ?>" allowFullScreen="true" quality="high" width="520" height="400" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed>				
	<?php endif; ?>
	
	<?php if ($this->_var['log_item']['image'] != ''): ?>
	<div class="blank"></div>
	<img src="<?php 
$k = array (
  'name' => 'get_spec_image',
  'v' => $this->_var['log_item']['image'],
  'w' => '520',
  'h' => '400',
);
echo $k['name']($k['v'],$k['w'],$k['h']);
?>" />
	<?php endif; ?>
	
	<?php if ($this->_var['log_item']['user_id'] > 0): ?>
	<div class="blank"></div>
	<div class="comment_tip_row">
		<?php if ($this->_var['log_item']['comment_count'] > 0): ?>
		<a href="javascript:void(0);" class="swap_comment" id="comment_<?php echo $this->_var['log_item']['id']; ?>_tip">评论(<?php echo $this->_var['log_item']['comment_count']; ?>)</a>
		<?php else: ?>
		<a href="javascript:void(0);" class="swap_comment" id="comment_<?php echo $this->_var['log_item']['id']; ?>_tip">发表评论</a>
		<?php endif; ?>
	</div>
	<div id="post_<?php echo $this->_var['log_item']['id']; ?>_comment" <?php if ($this->_var['log_item']['comment_count'] == 0): ?>style="display:none;"<?php endif; ?>>
		
		<div class="timeline-comment">
			<div class="timeline-comment-top"></div>
			<?php if ($this->_var['user_info']): ?>
			<form name="comment_<?php echo $this->_var['log_item']['id']; ?>_form"  rel="<?php echo $this->_var['log_item']['id']; ?>" class="comment_form" action="<?php
echo parse_url_tag("u:deal#save_comment|"."log_id=".$this->_var['log_item']['id']."&deal_id=".$this->_var['deal_info']['id']."".""); 
?>">		
			<div class="comment-content">
				<textarea name="content">发表评论</textarea>
				<input type="hidden" name="ajax" value="1" />
			</div>
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
			</form>
			<?php else: ?>
			<div class="comment-content" style="font-size:12px;">请登录后评论，立即 <a href="<?php
echo parse_url_tag("u:user#login|"."".""); 
?>" class="linkgreen">登录</a> 或 <a href="<?php
echo parse_url_tag("u:user#register|"."".""); 
?>"  class="linkgreen">注册</a></div>
			<?php endif; ?>

			<div class="deal_comment_list" id="deal_comment_list_<?php echo $this->_var['log_item']['id']; ?>">
				<?php if ($this->_var['log_item']['comment_list']): ?>
				<?php $_from = $this->_var['log_item']['comment_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'comment_item');if (count($_from)):
    foreach ($_from AS $this->_var['comment_item']):
?>
				<?php echo $this->fetch('inc/comment_item.html'); ?>
				<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
				<?php endif; ?>
			</div>
			<?php if ($this->_var['log_item']['more_comment']): ?>
			<div class="timeline-comment-more ui-button-ajax-more">
			<p><a href="<?php
echo parse_url_tag("u:deal#updatedetail|"."id=".$this->_var['log_item']['id']."".""); 
?>">更多评论</a></p>
			<span><a class="fodeup_comment" href="javascript:void(0);" rel="<?php echo $this->_var['log_item']['id']; ?>">收起</a></span>
			</div>
			<?php endif; ?>
			
		</div>
		
		<?php if ($this->_var['pages'] && ACTION_NAME == 'updatedetail'): ?>
		<div class="blank"></div>
		<div class="pages"><?php echo $this->_var['pages']; ?></div>
		<?php endif; ?>
		
		
		
	</div>
	<?php endif; ?>
	
</div>
<!--end time-box-->
<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>