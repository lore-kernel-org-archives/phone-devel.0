Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DEB26FA76
	for <phone-devel@vger.kernel.org>; Mon, 28 Jul 2025 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753718035; cv=none; b=DuB46xkhMltNiiB4WqlOknHBwHmmAk6QAkoGpTRjdI6VtqQPcuzRCHfqWz6/rSkxG71lf0NY0z5RAI7lQsgd2Q3dswWL1Mt5r/JyIMdU7u/uFvUI53F2EacTNNQQGtaCRKF/riwSpTusYM1WJNWwEpz6r94aIzoGTvI+VQUx5gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753718035; c=relaxed/simple;
	bh=Xb91t9iYll1tfZ8jj+Fe8p5aXdKrZAALX5hkvW1fTeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sgwakr0jsKTmJUPmc7zdvnpHoqkRh64Odud4wZxGSwa6aJFsyC2UI3qRZHAvBBA0EZC7bTK4dOzsCwkhENinSWZPSO5/ssu5710MvtrJsfzIe7l6nGuZchNym+FDMym5HhFMFp2SM1lhxKcThTHdSljS88QMXgXBVggKcWobrHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=QzqD0FZ5; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="QzqD0FZ5"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3e3e4c564ffso3151885ab.2
        for <phone-devel@vger.kernel.org>; Mon, 28 Jul 2025 08:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1753718031; x=1754322831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vA75icUEqF0I65qQDsqS6NAJyE6+tfqsXQddj1T3hko=;
        b=QzqD0FZ5wI7lu2NkIvwIFmao1GeIhoz4wOYttjeBUAsUcda7XVBz6IY9FuMotXSTg0
         +dWZdLza1wPctsyj3wONWIxoxcOB4t/+kgcM/EyUbdAzl55urT49QT5ox4/WMcitwraM
         XIR5VqCNWiJMeN9Ur8xsgufuDFU8hLFRb2Q0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753718031; x=1754322831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vA75icUEqF0I65qQDsqS6NAJyE6+tfqsXQddj1T3hko=;
        b=m206ZPyv/VwrYIj7mZdizKhNBX7uqodcBYRRN7EZsJy0iO8UFG7h2OqPEpV7E0ZtAf
         a1zMK1bPLicGYE3ljT/6s0XAyMe/gJECUHli95F+snc7cZHuGVjYznRUYmjn7A1VjD6G
         jXISnrm0ozzbJBaeiOttpht3VaPehs26V8N5T2Q3908dmilmRwvvn5WtrFcAjDEbeqeT
         OIFXQJkKbczyKt0StT9xTu3EkWOPv27o+lf2m3T4568qorVzbW1XU+yof6cJWohHwbwV
         6s/m4UjfbP3zRAhHFJ2oD3faJqinKVwY4Yhd6c8FoIv8OjXRKmXVAYpFSOm8VCtV+8lV
         UAkg==
X-Forwarded-Encrypted: i=1; AJvYcCXbovtxl/pzNvTI6NdrBU3lICuHCyKwHwLnQLd6NE82mQ4pZw+Evo4jpablH/YWa05hgw12tYKzYJhoKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymyq93vd3xDX5eGUwCjxmqhBXdHHd3KFQs0Tyq743NoTQQSCzc
	QAC7BrP/GcqxvlkrtlRuccWrdAkgiVRgDK7lzeO8sVpIwnPFD+b9g8tZup9A2yk0FA==
X-Gm-Gg: ASbGnctINJEw2nJvOezbXigRwTqZAXLVOJmx/M5egKyKwdggs02SrMV+LSV332ZTNMq
	Qhnau12v7cEn+vaVWPiTy8M95cnmAvjlq+iCPvEtvwgfdLodBJOf0F8eLVbNtb6tpBebxP1FSx4
	j0j53XzYFEcJnOxg46+XMPBlyax8HZ+MxOPrF/JOCJP3LRB9/qcIpu6xIXNHnXtXwstMxoJSdxu
	RSmNrFkdkY3RbQD/XWYyKBY6/2nKVUzsqRpLd7aDSf62wq/cZFEIgSm0M3yfHdkDzVR0kvVUV2m
	zwm5LAraBORqqOcwwTIgpwzwOq9EvlLlA4+iKqvHvKr3QZNRK876juyyIlKkTtC7tmw7pK/n+uf
	EwZOM4qcyRbNV6KC3YrYIgPOrTWlqOPOa7R5sK6tasDazc9rLV12TCfLtUzsrO13mN+0Y
X-Google-Smtp-Source: AGHT+IHGlI/3Pe8bkFG3tVYCr16gw07/QecOHAd3MsLl8dDS47dIcL8tDHYDVZgzeq/TKMa3hlOSsw==
X-Received: by 2002:a05:6e02:3bc7:b0:3e2:9e61:433c with SMTP id e9e14a558f8ab-3e3c531061fmr180543925ab.15.1753718031332;
        Mon, 28 Jul 2025 08:53:51 -0700 (PDT)
Received: from [172.22.22.234] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-508c9341e79sm1953738173.61.2025.07.28.08.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 08:53:50 -0700 (PDT)
Message-ID: <e07f0407-84e1-4efa-868d-5853b7e9ab4e@ieee.org>
Date: Mon, 28 Jul 2025 10:53:49 -0500
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: ipa: add IPA v5.1 and v5.5 to ipa_version_string()
To: Luca Weiss <luca.weiss@fairphone.com>, Alex Elder <elder@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250728-ipa-5-1-5-5-version_string-v1-1-d7a5623d7ece@fairphone.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250728-ipa-5-1-5-5-version_string-v1-1-d7a5623d7ece@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/25 3:35 AM, Luca Weiss wrote:
> Handle the case for v5.1 and v5.5 instead of returning "0.0".

This makes sense for IPA v5.5.

I have comments below, but I'll do this up front:

Reviewed-by: Alex Elder <elder@riscstar.com>

> Also reword the comment below since I don't see any evidence of such a
> check happening, and - since 5.5 has been missing - can happen.

You are correct.  Commit dfdd70e24e388 ("net: ipa: kill
ipa_version_supported()") removed the test that guaranteed
that the version would be good.  So your comment update
should have done then.

> Fixes: 3aac8ec1c028 ("net: ipa: add some new IPA versions")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   drivers/net/ipa/ipa_sysfs.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ipa/ipa_sysfs.c b/drivers/net/ipa/ipa_sysfs.c
> index a59bd215494c9b7cbdd1f000d9f23e100c18ee1e..a53e9e6f6cdf50103e94e496fd06b55636ba02f4 100644
> --- a/drivers/net/ipa/ipa_sysfs.c
> +++ b/drivers/net/ipa/ipa_sysfs.c
> @@ -37,8 +37,12 @@ static const char *ipa_version_string(struct ipa *ipa)
>   		return "4.11";
>   	case IPA_VERSION_5_0:
>   		return "5.0";
> +	case IPA_VERSION_5_1:
> +		return "5.1";

IPA v5.1 is not actually supported yet, and this won't be
used until it is.  Only those platforms with compatible
strings defined in the ipa_match array in "ipa_main.c" will
probe successfully.

That said...  I guess it's OK to define this at the same time
things are added to enum ipa_version.  There are still too
many little things like this that need to be updated when a
new version is supported.

Thanks for the patch.

					-Alex

> +	case IPA_VERSION_5_5:
> +		return "5.5";
>   	default:
> -		return "0.0";	/* Won't happen (checked at probe time) */
> +		return "0.0";	/* Should not happen */
>   	}
>   }
>   
> 
> ---
> base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
> change-id: 20250728-ipa-5-1-5-5-version_string-a557dc8bd91a
> 
> Best regards,

