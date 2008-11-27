{include file="bitpackage:liberty/services_inc.tpl" serviceLocation='nav' serviceHash=$gContent->mInfo}
<div class="display tickets">
	<div class="floaticon">
		{if $print_page ne 'y'}
			{if $gContent->hasUpdatePermission()}
				<a title="{tr}Edit this tickets{/tr}" href="{$smarty.const.TICKETS_PKG_URL}edit.php?ticket_id={$gContent->mInfo.ticket_id}">{biticon ipackage="icons" iname="accessories-text-editor" iexplain="Edit Tickets"}</a>
			{/if}
			{if $gBitUser->hasExpungePermission()}
				<a title="{tr}Remove this tickets{/tr}" href="{$smarty.const.TICKETS_PKG_URL}remove_tickets.php?ticket_id={$gContent->mInfo.ticket_id}">{biticon ipackage="icons" iname="edit-delete" iexplain="Remove Tickets"}</a>
			{/if}
		{/if}<!-- end print_page -->
	</div><!-- end .floaticon -->

	<div class="header">
		<h1>{tr}Ticket{/tr} {$gContent->mTicketId} - {$gContent->mInfo.title|escape}</h1>
		
		<div class="date">
			{tr}Created by{/tr}: {displayname user=$gContent->mInfo.creator_user user_id=$gContent->mInfo.creator_user_id real_name=$gContent->mInfo.creator_real_name}, {tr}Last modification by{/tr}: {displayname user=$gContent->mInfo.modifier_user user_id=$gContent->mInfo.modifier_user_id real_name=$gContent->mInfo.modifier_real_name}, {$gContent->mInfo.last_modified|bit_long_datetime}
		</div>
		
		<div class="display ticket">
	        <ul>
			{foreach from=$gContent->mAttributes item=attr}
	            <li>
	                {formlabel label=$attr.def_title for="ticket_$attr.def_title"}
	                {forminput}
	                	<span id="{$attr.def_title}">
	                    {tr}{$attr.field_value}{/tr}
	                    </span>
	                {/forminput}
	            </li>
			{/foreach}
	
			<li>		
				{formlabel label="Title" for="ticket_title"}
				{forminput}
					<span id="ticket_title">
	                {$gContent->mInfo.title|escape}
	                </span>
	            {/forminput}
	        </li>
	        
	        <li>		
				{formlabel label="Milestone" for="ticket_milestone"}
				{forminput}
					<span id="ticket_milestone">
	                	{$gContent->mMilestones[0].title}
	                </span>
	            {/forminput}
	        </li>
	        
                
	            
	        
	        </ul>
	        
		</div>
	</div><!-- end .header -->

	<div class="body">
		<div class="content">

			
			{include file="bitpackage:liberty/services_inc.tpl" serviceLocation='body' serviceHash=$gContent->mInfo}
			{$gContent->mInfo.parsed_data}
			{if !$preview}
				{include file="bitpackage:liberty/comments.tpl"}
			{/if}
		</div><!-- end .content -->
	</div><!-- end .body -->
</div><!-- end .tickets -->
{include file="bitpackage:liberty/services_inc.tpl" serviceLocation='view' serviceHash=$gContent->mInfo}
