Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C742980D0
	for <phone-devel@vger.kernel.org>; Tue,  4 Mar 2025 16:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107014; cv=none; b=IS4+nmMEZhCSAsmfuOZpjCYqZLAzQBV1AOe0wBVvu43/xhxJJGyGXgTBxbKpSWkrSKK+I+mmplGpEZ1/A6PAjQ0lo+Gu1oWEO+O2ghZhKuaMq8d+prQaBOjbsJ6ChYkzaeZENETsXvopg+x9SnPM+BXLOrK++9G+CnB60OQ8mB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107014; c=relaxed/simple;
	bh=ERL98+XMhCBq0WKMSdxbiVgqP55a8peNWRl1nrEYVgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BM9nekkACVobnbSDDgpIrjQKP1hwJF5f40xDnpM3Sq+NaCN0dNCCyHvIrgk4irUxQBjzLmWzx+ndcaKftGuzr2qUsVuevrxPoT+Y6Fq4K74ctOawjRquFz5BauHAd0wIc36m8z2IJCu6yxUqOUN8B488HJh3umQPGtv7grIBWhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=La5b50ao; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="La5b50ao"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5fe9c1c14baso3503577eaf.0
        for <phone-devel@vger.kernel.org>; Tue, 04 Mar 2025 08:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1741107012; x=1741711812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nlIbklXNCmcjeQcgQte8OZAzddo1rgx7AgL8en5NgHA=;
        b=La5b50aoPH0xeWXwkyTSX4jKTnUS8QRDAk3Xc0L8YlVHQXHuUkjUcw6xBqeqm9/XaF
         3wbiTi8gzZaGZg9cHkPqCLTZohyOP+XQiXCrWhPwUHl3kuaBd9EtstOSunb7uDs7WVaH
         meQRugRn0gK1Ml79b7Cp6kFNf9MXoHIPynA1FRb7346+qUfMiPtil5GXtElIsOKqJcxS
         y1ylzT4kbhhUBEIJAKKzaPIefIJPZXiEqa4lKKT1TYXZoAi8zHQYmuOsbaGFi2lCzWTS
         a5g9xN/Z5eqE29hXg65HGF6FSznRLxUWYgjzh/vo5NSoQhNRXNaaBOL4DBnrimWXL4L3
         pOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107012; x=1741711812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nlIbklXNCmcjeQcgQte8OZAzddo1rgx7AgL8en5NgHA=;
        b=CDO9vQ8WayzVPqWtgYRpl86RVlK+urkO9qFxJFUKVU1Ap5YUisOTqCfIuoDBKkRUXE
         Tf3u1wZMnE3CWuAxx/lr1VC0r/KIRUIdok45JoCwGhdtruJGEzS3ycKdNS0sAubuHSdP
         HBfspAavzbee6o6PqI7vEEBgYGMWYrALJZmPd1GutRqv/5IcTL+Px+LREJ+iBOHTQeF3
         NB4ZZxKXP6YUPlxpncXf1cEqdWyF6nLsEBdzU+HRxUN0NCzUzanQtVt7KzTXmegBGU9B
         WqkAEIMqvi08Rn9qaYNRems62akrHN7t9rXb6t8xo9mHFay35xKDfG51xyL+h39sqSYe
         CySw==
X-Forwarded-Encrypted: i=1; AJvYcCUAx3SRyUKykHrMhqf9enKTurwYQhjraIe6624LX/+qKOERLo1ReLDE5uz20NI6tzhjYw8dOcKE8f48Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YysYagpBzQ6l4Uwsn93amKfPQfjjxOR0mmdHeBiq1g/OTeJk8yW
	tZMrCyWKrDaSW8FipqFU1W1iZ0Fzxl6JMYgl94D01AHctzA50Ors/wFYZS3hdCg=
X-Gm-Gg: ASbGncub+2Gi1rJawewAUZ2YDDtU8iySxvIyZNbY7BwHyUpCuw3n2xla0NVPQLLtXs8
	YnhEC3FlZEhyKN84tqf5b1cNhwmtXkj40kv9OxIaz5yetE//fQ8ja7K14WaJ1BEf8Iee4u9oypH
	gbptL9BexJ1TFnOysTziGjXvtDIAGnKriHNRHEwtV451bXEdWI2AaCKTWkdca/0DFgG5y8OBnaJ
	4ZHAnFjfYR2Rt5/PA1AR0DjMzd0FHWEKyjGVFGT3jpPpN1WL/yN8wORo5T4ipdbXosFbdqarIwL
	HE0e9QqL1WqDvgG5BoJAsNzXX+Ke/KwnpAe/RO3SKOnwp7cgV25sTNaKN/i/dWzZBq2SsZbmgeZ
	GArqXooTV
X-Google-Smtp-Source: AGHT+IF132mZL/5S2H3HBYE9POUMpakPzvAs82bnnnaYSOVaRfL5Z+1wdFvEGSjxOOUrEK5Dp2GhIg==
X-Received: by 2002:a05:6871:d10d:b0:296:a1fc:91b5 with SMTP id 586e51a60fabf-2c178341172mr10264433fac.8.1741107012166;
        Tue, 04 Mar 2025 08:50:12 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c15c45e81bsm2333459fac.50.2025.03.04.08.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:50:11 -0800 (PST)
Message-ID: <5b2c08d1-47fc-43f2-abcb-f5f54fad84e1@riscstar.com>
Date: Tue, 4 Mar 2025 10:50:10 -0600
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] net: ipa: Fix QSB data for v4.7
To: Luca Weiss <luca.weiss@fairphone.com>, Alex Elder <elder@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250227-ipa-v4-7-fixes-v1-0-a88dd8249d8a@fairphone.com>
 <20250227-ipa-v4-7-fixes-v1-2-a88dd8249d8a@fairphone.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250227-ipa-v4-7-fixes-v1-2-a88dd8249d8a@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/25 4:33 AM, Luca Weiss wrote:
> As per downstream reference, max_writes should be 12 and max_reads
> should be 13.
> 
> Fixes: b310de784bac ("net: ipa: add IPA v4.7 support")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/data/ipa_data-v4.7.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ipa/data/ipa_data-v4.7.c b/drivers/net/ipa/data/ipa_data-v4.7.c
> index 7e315779e66480c2a3f2473a068278ab5e513a3d..e63dcf8d45567b0851393c2cea7a0d630afa20cd 100644
> --- a/drivers/net/ipa/data/ipa_data-v4.7.c
> +++ b/drivers/net/ipa/data/ipa_data-v4.7.c
> @@ -38,8 +38,8 @@ enum ipa_rsrc_group_id {
>   /* QSB configuration data for an SoC having IPA v4.7 */
>   static const struct ipa_qsb_data ipa_qsb_data[] = {
>   	[IPA_QSB_MASTER_DDR] = {
> -		.max_writes		= 8,
> -		.max_reads		= 0,	/* no limit (hardware max) */
> +		.max_writes		= 12,
> +		.max_reads		= 13,
>   		.max_reads_beats	= 120,
>   	},
>   };
> 

