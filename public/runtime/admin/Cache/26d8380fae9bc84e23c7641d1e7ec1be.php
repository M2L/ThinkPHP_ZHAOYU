<?php if (!defined('THINK_PATH')) exit();?>

<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="__TMPL__Common/style/style.css" />
<script type="text/javascript">
 	var VAR_MODULE = "<?php echo conf("VAR_MODULE");?>";
	var VAR_ACTION = "<?php echo conf("VAR_ACTION");?>";
	var MODULE_NAME	=	'<?php echo MODULE_NAME; ?>';
	var ACTION_NAME	=	'<?php echo ACTION_NAME; ?>';
	var ROOT = '__APP__';
	var ROOT_PATH = '<?php echo APP_ROOT; ?>';
	var CURRENT_URL = '<?php echo trim($_SERVER['REQUEST_URI']);?>';
	var INPUT_KEY_PLEASE = "<?php echo L("INPUT_KEY_PLEASE");?>";
	var TMPL = '__TMPL__';
	var APP_ROOT = '<?php echo APP_ROOT; ?>';
</script>
<script type="text/javascript" src="__TMPL__Common/js/jquery.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/jquery.timer.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/script.js"></script>
<script type="text/javascript" src="__ROOT__/public/runtime/admin/lang.js"></script>
<script type='text/javascript'  src='__ROOT__/admin/public/kindeditor/kindeditor.js'></script>
</head>
<body>
<div id="info"></div>

<div class="main">
<div class="main_title"><?php echo L("INSTALL");?> <a href="<?php echo u("Payment/index");?>" class="back_list"><?php echo L("BACK_LIST");?></a></div>
<div class="blank5"></div>
<form name="edit" action="__APP__" method="post" enctype="multipart/form-data">
<table class="form" cellpadding=0 cellspacing=0>
	<tr>
		<td colspan=2 class="topTd"></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("PAYMENT_NAME");?>:</td>
		<td class="item_input">
			<?php echo ($data["name"]); ?>
			<input type="hidden" value="<?php echo ($data["name"]); ?>" name="name" />
		</td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("CLASS_NAME");?>:</td>
		<td class="item_input">
			<?php echo ($data["class_name"]); ?>
			<input type="hidden" value="<?php echo ($data["class_name"]); ?>" name="class_name" />
		</td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("IS_EFFECT");?>:</td>
		<td class="item_input">
			<lable><?php echo L("IS_EFFECT_1");?><input type="radio" name="is_effect" value="1" checked="checked" /></lable>
			<lable><?php echo L("IS_EFFECT_0");?><input type="radio" name="is_effect" value="0" /></lable>
		</td>
	</tr>

	<?php if($data['class_name'] != 'TenpayBank' and $data['class_name'] != 'AlipayBank'): ?><tr>
		<td class="item_title"><?php echo L("PAYMENT_LOGO");?>:</td>
		<td class="item_input">
			<div style='width:120px; height:40px; margin-left:10px; display:inline-block;  float:left;' class='none_border'><script type='text/javascript'>var eid = 'logo';KE.show({id : eid,items : ['upload_image'],skinType: 'tinymce',allowFileManager : true,resizeMode : 0});</script><div style='font-size:0px;'><textarea id='logo' name='logo' style='width:120px; height:25px;' ></textarea> </div><input type='text' id='focus_logo' style='font-size:0px; border:0px; padding:0px; margin:0px; line-height:0px; width:0px; height:0px;' /></div><img src='./admin/Tpl/default/Common/images/no_pic.gif'  style='display:inline-block; float:left; cursor:pointer; margin-left:10px; border:#ccc solid 1px; width:35px; height:35px;' id='img_logo' /><img src='/zy3/admin/Tpl/default/Common/images/del.gif' style='display:none; margin-left:10px; float:left; border:#ccc solid 1px; width:35px; height:35px; cursor:pointer;' id='img_del_logo' onclick='delimg("logo")' title='删除' />
		</td>
	</tr><?php endif; ?>

	<tr>
		<td class="item_title"><?php echo L("SORT");?>:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="sort" value="<?php echo ($data["sort"]); ?>" />
		</td>
	</tr>
	<?php if($data['class_name'] != 'Account' and $data['class_name'] != 'Voucher' and $data['class_name'] != 'TenpayBank'): ?><tr>
		<td class="item_title"><?php echo L("DESCRIPTION");?>:</td>
		<td class="item_input">
			<textarea class="textarea" name="description" ></textarea>
		</td>
	</tr><?php endif; ?>
	<?php if($data['config']): ?><tr>
		<td class="item_title"><?php echo L("PAYMENT_CONFIG");?>:</td>
		<td class="item_input">
			<?php if(is_array($data["config"])): foreach($data["config"] as $key=>$config): ?><?php $config_name = $key; ?>
				<span class="cfg_title"><?php echo trim($data['lang'][$key]);?>:</span>
				<span class="cfg_content">
				<?php if($config['INPUT_TYPE'] == 0): ?><input type="text" class="textbox" name="config[<?php echo ($key); ?>]" value="" />
				<?php elseif($config['INPUT_TYPE'] == 2): ?>
				<input type="password" class="textbox" name="config[<?php echo ($key); ?>]" value="" />
				<?php elseif($config['INPUT_TYPE'] == 3): ?>				
					<?php if(is_array($config["VALUES"])): foreach($config["VALUES"] as $key=>$val): ?><label><input type="checkbox" name="config[<?php echo ($config_name); ?>][<?php echo ($val); ?>]" value="1"><?php echo trim($data['lang'][$config_name."_".$val]);?></label>
						<br /><?php endforeach; endif; ?>
				<?php else: ?>
				<select name="config[<?php echo ($key); ?>]" >
					<?php if(is_array($config["VALUES"])): foreach($config["VALUES"] as $key=>$val): ?><option value="<?php echo ($val); ?>"><?php echo trim($data['lang'][$config_name."_".$val]);?></option><?php endforeach; endif; ?>
				</select><?php endif; ?>
				</span>
				<div class="blank5"></div><?php endforeach; endif; ?>
		</td>
	</tr><?php endif; ?>
	<tr>
		<td class="item_title"></td>
		<td class="item_input">
			<!--隐藏元素-->
			<input type="hidden" value="<?php echo ($data["online_pay"]); ?>" name="online_pay" />
			<input type="hidden" name="<?php echo conf("VAR_MODULE");?>" value="Payment" />
			<input type="hidden" name="<?php echo conf("VAR_ACTION");?>" value="insert" />
			<!--隐藏元素-->
			<input type="submit" class="button" value="<?php echo L("ADD");?>" />
			<input type="reset" class="button" value="<?php echo L("RESET");?>" />
		</td>
	</tr>
	<tr>
		<td colspan=2 class="bottomTd"></td>
	</tr>
</table>	 
</form>
</div>
</body>
</html>