<div class="deal_right_info">
<div class="info_box">
	<div class="info_title">支持人数</div>
	<div class="info_content"><?php echo $this->_var['deal_info']['support_count']; ?><span>&nbsp;位</span></div>
</div>
<div class="info_box">
	<div class="info_title">支持金额</div>
	<div class="info_content">¥<?php echo $this->_var['deal_info']['support_amount_format']; ?></div>
</div>
<?php if ($this->_var['deal_info']['end_time'] != 0): ?>				
<div class="info_box">
	<div class="info_title">剩余天数</div>
	<div class="info_content"><?php if ($this->_var['deal_info']['remain_days'] < 0): ?>已过期<?php else: ?><?php echo $this->_var['deal_info']['remain_days']; ?><span>&nbsp;天</span><?php endif; ?></div>
</div>
<?php endif; ?>
<div class="deal_tip_box">
<?php if ($this->_var['deal_info']['begin_time'] > $this->_var['now']): ?>
<div class="deal_tip gray_tip">
	<div>
		此项目将在<?php 
$k = array (
  'name' => 'to_date',
  'v' => $this->_var['deal_info']['begin_time'],
  'f' => 'Y年m月d日H:i',
);
echo $k['name']($k['v'],$k['f']);
?>正式上线，
		<?php if ($this->_var['deal_info']['end_time'] != 0): ?>
		必须在<?php 
$k = array (
  'name' => 'to_date',
  'v' => $this->_var['deal_info']['end_time'],
  'f' => 'Y年m月d日H:i',
);
echo $k['name']($k['v'],$k['f']);
?>之前达到 ¥<?php echo $this->_var['deal_info']['limit_price_format']; ?> 的目标才可成功。
		<?php else: ?>
		必须达到 ¥<?php echo $this->_var['deal_info']['limit_price_format']; ?> 的目标才可成功。
		<?php endif; ?>
	</div>
</div>
<?php endif; ?>
<?php if ($this->_var['deal_info']['end_time'] < $this->_var['now'] && $this->_var['deal_info']['end_time'] != 0): ?>
<div class="deal_tip gray_tip">
	<div>
		此项目在<?php 
$k = array (
  'name' => 'to_date',
  'v' => $this->_var['deal_info']['end_time'],
  'f' => 'Y年m月d日H:i',
);
echo $k['name']($k['v'],$k['f']);
?>已经过期，
		<?php if ($this->_var['deal_info']['is_success'] == 0): ?>
		未能达到 ¥<?php echo $this->_var['deal_info']['limit_price_format']; ?> 的目标。
		<?php else: ?>
		成功筹到 ¥<?php echo $this->_var['deal_info']['support_amount_format']; ?>。
		<?php endif; ?>
	</div>
</div>
<?php endif; ?>

<?php if (( $this->_var['deal_info']['end_time'] > $this->_var['now'] || $this->_var['deal_info']['end_time'] == 0 ) && $this->_var['deal_info']['begin_time'] < $this->_var['now']): ?>
<div class="deal_tip green_tip">
	<div>
		<?php if ($this->_var['deal_info']['end_time'] == 0): ?>
		此项目必须达到 ¥<?php echo $this->_var['deal_info']['limit_price_format']; ?> 的目标，方可成功。
		<?php else: ?>
		此项目必须在<?php 
$k = array (
  'name' => 'to_date',
  'v' => $this->_var['deal_info']['end_time'],
  'f' => 'Y年m月d日H:i',
);
echo $k['name']($k['v'],$k['f']);
?>之前，			
		达到 ¥<?php echo $this->_var['deal_info']['limit_price_format']; ?> 的目标。	
		<?php endif; ?>			
	</div>
</div>
<?php endif; ?>
</div><!--end deal_tip_box-->
<div class="deal_item_list">
	<?php $_from = $this->_var['deal_item_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'deal_item');if (count($_from)):
    foreach ($_from AS $this->_var['deal_item']):
?>
	<div class="deal_item">
		<div class="deal_item_price">支持 ¥<?php echo $this->_var['deal_item']['price_format']; ?></div>	
		<div class="deal_item_support_count"><?php echo $this->_var['deal_item']['support_count']; ?>位支持者</div>
		<div class="deal_item_description"><?php 
$k = array (
  'name' => 'nl2br',
  'v' => $this->_var['deal_item']['description'],
);
echo $k['name']($k['v']);
?></div>	
		<div class="deal_item_delivery_limit">
			<?php if ($this->_var['deal_item']['is_delivery'] == 1): ?>
				<?php if ($this->_var['deal_item']['delivery_fee'] == 0): ?>
				运费：包邮
				<?php else: ?>
				运费：¥<?php 
$k = array (
  'name' => 'round',
  'v' => $this->_var['deal_item']['delivery_fee'],
  'e' => '2',
);
echo $k['name']($k['v'],$k['e']);
?>
				<?php endif; ?>
				&nbsp;&nbsp;
			<?php endif; ?>
			
			<?php if ($this->_var['deal_item']['is_limit_user'] == 1): ?>
				<?php if ($this->_var['deal_item']['limit_user'] > 0): ?>
				限额：<?php echo $this->_var['deal_item']['limit_user']; ?>位
				<?php endif; ?>
			<?php endif; ?>
		</div>	
		
		<?php if ($this->_var['deal_item']['images']): ?>
		<div class="blank1"></div>	
		<div class="deal_item_images">				
			<?php $_from = $this->_var['deal_item']['images']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'image');if (count($_from)):
    foreach ($_from AS $this->_var['image']):
?>
			<div class="image_item">
				<img src="<?php 
$k = array (
  'name' => 'get_spec_image',
  'v' => $this->_var['image']['image'],
  'w' => '50',
  'h' => '50',
  'g' => '1',
);
echo $k['name']($k['v'],$k['w'],$k['h'],$k['g']);
?>" rel="<?php 
$k = array (
  'name' => 'get_spec_image',
  'v' => $this->_var['image']['image'],
  'w' => '570',
  'h' => '430',
);
echo $k['name']($k['v'],$k['w'],$k['h']);
?>" width=50 height=50 />
			</div>
			<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
		</div>	
		<div class="blank1"></div>					
		<?php endif; ?>
		
		<div class="deal_item_repaid">
			<?php if ($this->_var['deal_item']['repaid_day'] > 0): ?>
			预计回报发放时间：项目成功结束后<?php echo $this->_var['deal_item']['repaid_day']; ?>天内
			<?php endif; ?>
		</div>
		<div class="blank"></div>
		<?php if (( $this->_var['deal_info']['end_time'] > $this->_var['now'] || $this->_var['deal_info']['end_time'] == 0 ) && $this->_var['deal_info']['begin_time'] < $this->_var['now'] && $this->_var['deal_info']['is_effect'] == 1): ?>
			<?php if ($this->_var['deal_item']['support_count'] < $this->_var['deal_item']['limit_user'] || $this->_var['deal_item']['limit_user'] == 0): ?>
			<div class="ui-button green buy_deal_item" rel="green" url="<?php
echo parse_url_tag("u:cart|"."id=".$this->_var['deal_item']['id']."".""); 
?>">
				<div>
					<span>支持 ¥<?php echo $this->_var['deal_item']['price_format']; ?></span>
				</div>
			</div>
			<?php else: ?>
			<div class="ui-button gray" rel="gray" >
				<div>
					<span>已满额</span>
				</div>
			</div>
			<?php endif; ?>
		<?php else: ?>
		<div class="ui-button gray" rel="gray">
			<div>
				<span>支持 ¥<?php echo $this->_var['deal_item']['price_format']; ?></span>
			</div>
		</div>
		<?php endif; ?>
		<div class="blank"></div>
		
	</div>
	<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
</div>
</div>
<div class="blank"></div>
<?php if ($this->_var['deal_user_info']): ?>
<div class="deal_user_box">
<div class="deal_user_title">项目发起人</div>
<div class="deal_user_avatar">
<?php 
$k = array (
  'name' => 'show_avatar',
  'p' => $this->_var['deal_user_info']['id'],
);
echo $k['name']($k['p']);
?>
</div>
<div class="deal_user_info">
	<div class="deal_user_name"><?php echo $this->_var['deal_user_info']['user_name']; ?></div>
	<div class="deal_login_time">上次登录时间:<?php 
$k = array (
  'name' => 'to_date',
  'v' => $this->_var['deal_user_info']['login_time'],
  'f' => 'Y/m/d',
);
echo $k['name']($k['v'],$k['f']);
?></div>
	<?php if ($this->_var['deal_user_info']['province'] != '' || $this->_var['deal_user_info']['city'] != ''): ?>
	<div class="deal_user_loc"><?php echo $this->_var['deal_user_info']['province']; ?><?php echo $this->_var['deal_user_info']['city']; ?></div>
	<?php endif; ?>
	
	<div class="author_row" style="padding:0px; color:#690;">	
		<span onclick="send_message(<?php echo $this->_var['deal_user_info']['id']; ?>);" class="send_message" style="margin-left:0px;"></span>				
		<span style="font-size:12px; padding-left:5px;">发信息</span>										
	</div>
</div>
<div class='blank'></div>
<?php 
$k = array (
  'name' => 'nl2br',
  'v' => $this->_var['deal_user_info']['intro'],
);
echo $k['name']($k['v']);
?>
<div class='blank'></div>
<div class="user_weibo_list">
<?php $_from = $this->_var['deal_user_info']['weibo_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'weibo');if (count($_from)):
    foreach ($_from AS $this->_var['weibo']):
?>
<a href="<?php echo $this->_var['weibo']['weibo_url']; ?>" target="_blank"><?php echo $this->_var['weibo']['weibo_url']; ?></a>
<div class="blank1"></div>
<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
</div>
</div>
<?php endif; ?>
