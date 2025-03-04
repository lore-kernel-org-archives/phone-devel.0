Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246F5299B47
	for <phone-devel@vger.kernel.org>; Tue,  4 Mar 2025 16:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107023; cv=none; b=MVTU0bY8cSPECMQx5jY4tf8JdKFljIklgEx6Gyk/zmDNtU0C9Fa8JYxuoEA91OKWfvWm3sG+5tXJWrqE9UFK3hPLLMHviJjGNcG70wde2swdeLkABWSaF9bVS948GUKwvnV7WPvSm3tF9ZKIT9pcY4I45M11X726P4NuwGhZL6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107023; c=relaxed/simple;
	bh=zrUZ2K6obbHVLkq6hfv8AXP8IsKmoHtrwEOg1loa8q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uegOyHWA6OMpkCX3E+2Xl6qdpnAR7jyv/t8LhG5xJg2sN8JuRQBUFJOEBKkX091N5zFeYx06QayNuLSQsS+rmOa5kCoZWRxtC0zD9li06Q6iMDtzfol6IbJZgZYwYDgMlW01vqlu+HJBKeLcpmARMyIPMHzvrj8wTB/QV7htDPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=Vm/wzv76; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="Vm/wzv76"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3f554b1ebbeso2236807b6e.1
        for <phone-devel@vger.kernel.org>; Tue, 04 Mar 2025 08:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1741107019; x=1741711819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7tkrL+e+a2YbJa4w+KDK4bewexCr454QdQiczaO5JMc=;
        b=Vm/wzv76ieaZX2hnFuV+tlHt5eOHLM7h2glXcGiJNmS61bTW0SrTX3IjGuHlADB0vj
         ASs7BlP5mpkZO8Lg3dM0nY8YGHRk+j3vg26a8KkmME0hMZlx9liGM96dhIvjAtn9w2m8
         2+lEbD3u2sGg72n0q3/WoX2HawQJ5JXBKZ2QM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107019; x=1741711819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7tkrL+e+a2YbJa4w+KDK4bewexCr454QdQiczaO5JMc=;
        b=LVz1JesUaMfPu/F58D/2lU5JZw4BT4srXZ+rZo0OdWRLRF3qzllzlH3z+c3vtl/XQd
         GY6kMIiux6nwg3Q4VjpXX1L/c57JfQKSTsiG1vWjvliqSbw1IL+Sh+q+yww45zFKGJ6b
         E3hyQKJZql+LnC/bt0VFhUV1WsNI2xjMNT3ldwIFWApjgBA+jCYESIgVB/JvvS+D/J3e
         EZgHK1NzuIDeY01aTfg3zhBDtto1HXRy1TQumKgQAnQWW4EM7gXoOYsHVJ6d0+cycr5I
         P6RywiHpEV3qQiZejnm0Ty92GtTg1VgL2Xt9AwmNQTo5M0Hn5MpPge2A/0Av0kEBV0Uh
         EUCA==
X-Forwarded-Encrypted: i=1; AJvYcCXScfTuXpyQgedZf2sxeSKQpi2IJ6fgTIfhlyMH5OlwyzoFF+cTpHeuGW3alis8rOk3HlJvaAnyvqRfRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNhXftm5kB89IwSalJ/+v7HTURnYOu1KtFCCmwjjqhiSoWuSC8
	3VOSWd4MIN3JTPqAV73N3CnSdNBPztJFFcHqnPbMzAWL1dnf6D2cIv2KSVDCsA==
X-Gm-Gg: ASbGncsaTjeqi9+y6Fw2EfLwPy63jInBifp9xT3/HazIIQibob6G16dMgX0v8vXckkD
	+ypnjUGQZ+80gqdW8gX9HVFarWl5a7K5tQI9hgfihjBGHF3YHWnut9nhOYM/zV5pzMESSyszpOh
	ZcZxIWsm2os940SKS4sA91038il6zdEvgypTenbxiSZdfPF5i8XW1Hh2O8lUJrqMc5EnuobMpBn
	59VkHB0rO2nkxfKkYxZ4RA1B+1x66vv0cFgRz4pSgyWAItax5SYBx2XuMWcQAnlF1QW5z+EHGOA
	AfqDZZhlfQtU8JbPjshn9MRQpHCwi9o6uj6g+QIHcmk1CHJUBHmyU7X/sVJjXeQnqVfk7Zp3hKU
	1YkU=
X-Google-Smtp-Source: AGHT+IFWGzlfKIJoQMdZwPV2HzDzwdowvDtxXCUhLVhv6U+fgKXlNTeZeV9ExhknYcVynokP8VXzFA==
X-Received: by 2002:a05:6808:23ca:b0:3f4:cf:5d5c with SMTP id 5614622812f47-3f678f4ed49mr2747867b6e.10.1741107019054;
        Tue, 04 Mar 2025 08:50:19 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-3f5506a0b92sm2255999b6e.6.2025.03.04.08.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:50:17 -0800 (PST)
Message-ID: <2246f041-3e42-4534-bf89-3630ca2426d1@ieee.org>
Date: Tue, 4 Mar 2025 10:50:15 -0600
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] net: ipa: Enable checksum for
 IPA_ENDPOINT_AP_MODEM_{RX,TX} for v4.7
To: Luca Weiss <luca.weiss@fairphone.com>, Alex Elder <elder@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250227-ipa-v4-7-fixes-v1-0-a88dd8249d8a@fairphone.com>
 <20250227-ipa-v4-7-fixes-v1-3-a88dd8249d8a@fairphone.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250227-ipa-v4-7-fixes-v1-3-a88dd8249d8a@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/25 4:33 AM, Luca Weiss wrote:
> Enable the checksum option for these two endpoints in order to allow
> mobile data to actually work. Without this, no packets seem to make it
> through the IPA.
> 
> Fixes: b310de784bac ("net: ipa: add IPA v4.7 support")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

This makes sense.  The checksum option affects how outgoing
packets are formatted and incoming packets are interpreted
by the IPA hardware.  So with this being wrong, I suppose
packets (one way and/or the other) might just be getting
dropped as invalid.

This looks good to me.  I'm really pleased you were able to
get this working.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/data/ipa_data-v4.7.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ipa/data/ipa_data-v4.7.c b/drivers/net/ipa/data/ipa_data-v4.7.c
> index e63dcf8d45567b0851393c2cea7a0d630afa20cd..41f212209993f10fee338e28027739a7402d5089 100644
> --- a/drivers/net/ipa/data/ipa_data-v4.7.c
> +++ b/drivers/net/ipa/data/ipa_data-v4.7.c
> @@ -104,6 +104,7 @@ static const struct ipa_gsi_endpoint_data ipa_gsi_endpoint_data[] = {
>   			.filter_support	= true,
>   			.config = {
>   				.resource_group	= IPA_RSRC_GROUP_SRC_UL_DL,
> +				.checksum       = true,
>   				.qmap		= true,
>   				.status_enable	= true,
>   				.tx = {
> @@ -127,6 +128,7 @@ static const struct ipa_gsi_endpoint_data ipa_gsi_endpoint_data[] = {
>   		.endpoint = {
>   			.config = {
>   				.resource_group	= IPA_RSRC_GROUP_DST_UL_DL,
> +				.checksum       = true,
>   				.qmap		= true,
>   				.aggregation	= true,
>   				.rx = {
> 

