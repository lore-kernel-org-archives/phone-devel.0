Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E825D3CB2CF
	for <phone-devel@vger.kernel.org>; Wed,  4 Mar 2026 19:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772650880; cv=none; b=HpyL2fzCq+KLD7ndteZ5q9wsOr5a1BZjGWG75/6l/YfKs5NHuTJikACOkS6xwfVq/B6o2b+gApCa3I0jAjSKYFGsj6m1NFbRrOJm8S3FpWEsR42cCMnpnq7txuk15orvuJzwg+FJXYf54AGPGQ2FwBcmpr3hwx2dXNaJ9GNr1mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772650880; c=relaxed/simple;
	bh=/uCMCKCZZ6G6opqQrcwF4A6H5UkCc/aLRRfZlw8gTSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxGL9lDKDa178uAn1ZtVl1JJESVRUV64RZvfZsVb4oaEaxwo42RYPaxxuIOlvpOvQ5ftfxoYGZjY+BdGNcLH89YsIrR4habSgLtwxI4xsVd9zi5/nE7gDCnWYvA72Istuk1jjHvkW54jYeikRe+EMKNNm3uC697ovdxCn8OQ6Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=mtZIUOI+; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="mtZIUOI+"
Message-ID: <559e74ce-f572-4f92-a6ff-4f4feb3db028@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772650867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m2GN9fZLcJOt5gGCUtsmhrqERVtGtfaDHOgportvZj0=;
	b=mtZIUOI+geuTaBstE1+9kS/rAJKWDCLwxzdqB34NruU+WzILuNZ3RHgSB0zcawq8ougovl
	muJG+32FveNMumN6yYGjrV/VP4T3bXjtoYD6GeGjJPMowmIXQ6aXLOkD83mc4YAny6J2Bk
	csqKqoPbTdhLe0XWjTvT7Zu1UyPdYqohAsDvsf/FlTu1ohHiOuVY0ixAG84XUNzzI43w8q
	3eRYvHUZ/PegdAwfd3B9OSsPhQseswmFABFNsus56axCppo9uCvGlJvHcNu65LGDMNFVHv
	iWs8Vw7b2jeGwdJmWBmW23we3q1TaRQFkbxxw0JHDsWb4Z7fKHSWyj5NTYGeTQ==
Date: Wed, 4 Mar 2026 16:00:42 -0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] drm/panel: himax-hx83102: Add support for Holitech
 HTF065H045
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
References: <20260217070121.190108-1-val@packett.cool>
 <20260217070121.190108-4-val@packett.cool>
 <bd2bb9c1-70e2-4914-afe2-c172501c25bc@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <bd2bb9c1-70e2-4914-afe2-c172501c25bc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 3/4/26 1:26 PM, Neil Armstrong wrote:
> On 2/17/26 08:00, Val Packett wrote:
>> This 720x1600 panel is found in several Motorola/Lenovo smartphones like
>> the Moto G9 Play (guamp). The initialization sequence is based on the
>> datasheet. Add it to the existing HX83102 panel driver.
>>
>> Signed-off-by: Val Packett <val@packett.cool>
>> ---
>>   drivers/gpu/drm/panel/panel-himax-hx83102.c | 86 +++++++++++++++++++++
>>   1 file changed, 86 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c 
>> b/drivers/gpu/drm/panel/panel-himax-hx83102.c
>> index 1d3bb5dca559..34e0e956db48 100644
>> --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
>> +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
>> @@ -701,6 +701,67 @@ static int 
>> starry_2082109qfh040022_50e_init(struct hx83102 *ctx)
>>       return dsi_ctx.accum_err;
>>   }
>>   +static int holitech_htf065h045_init(struct hx83102 *ctx)
>> +{
>> +    struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>> +
>> +    msleep(50);
>> +
>> +    hx83102_enable_extended_cmds(&dsi_ctx, true);

BTW I have noticed since that the enable-extended "password" command in 
the doc mentions the model of the IC: {83, 10, 2D} for 83102D, not {83, 
10, 21, 55, 00}.

Works fine either way, can't say I'm really noticing any visible changes 
from the init sequence, but I'll adjust it to be accurate for v2, can I 
keep the R-b?

Thanks,
~val

