Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DE2218ACC
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 01:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763428610; cv=none; b=hAs+VvU+rrEbP9nLrWOJxYFE0GU5y70lUtXyLNJk6oCpOObTlMueeRhBTKvxMGPxZZP8JH6wGaALC3uRFSil34046IHMySOhGmBTcq8671FB2ecpz/1ngMZ4av1DWx6YWEZqx4yfT9qgdex4hM/zk9ahEyDK4It+zJbDtNAh9ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763428610; c=relaxed/simple;
	bh=49zUBrMSgpw4Fi+zoc0KoBtSjoHHfquW5LFi6wcJ8wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmLIEpBZYpU4DitMwFRvs743GzIB7vw1DNdoUvF4NMFh/8QkLM6l2nyS7I29w3/0Vq+XaS1ToKVbZ6DvlId1yElFjD/WtdV3ynaP5Ag399+D2sVK8eCI5ScBHiQeVaOHQ2PDHyxbu7O99BgmLfenCc14XKxgi1Hct7W7LO7fT38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHzoLq9h; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHzoLq9h"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso2959989b3a.0
        for <phone-devel@vger.kernel.org>; Mon, 17 Nov 2025 17:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763428608; x=1764033408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O/zaQaUgcusdFX7nIVvdS4Rs3VOW44H6bNGVPWT30wg=;
        b=VHzoLq9hIzEQ/6ont32rudmtpXmPpN1ayYKtp8qlAjBs2+yt83X0KL4DMQBfTN/rtv
         5Y+3dVHpHC6LBTvf2rjDVFeg55gUz6rp+IVv5RRiBEc0IR1iazUhg0LzkvJ91RuqKg7x
         LhEKUJHjSSCM37GnICPqGSGvlEs1i3hzDRZpi+NmqpRLvE5ZyHIOXZNjd90R0RVCw93x
         2CALfpAOJkww9Lf4/nL9a9kqjmcLlssQNIye6iu2QpgZnL2dW3NJZS8zGTo6rgNco1uq
         P6XX2iP7tU1WBayShQVEf1StLx0/K4l+WcUjMCppIV75nwAk5F5fDW+EDNDSBgQk7j7S
         qeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763428608; x=1764033408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/zaQaUgcusdFX7nIVvdS4Rs3VOW44H6bNGVPWT30wg=;
        b=LhfOT6IdmA9P8mobIwxUOhaBHZt4c24fOGttjEmSxwXVWr/nNJUMXWpaB/dJqtY+Ce
         JeHt0CilmEXqY3zt0ur13qhRw1rIg0bKojhUmcVz3Ew+ffjtEbxZ7Oh3RsOqYyTvWkok
         UXK6UJGqb/2vP8Rj8ZZJK0sx6SDmJxUnsFLsWtPscA2G91PAcGJ2xr8EVNlHmCAiOddG
         JQVBUN3GJ2cAM+qLXhlr/RGIwg55MC0coeBVDLE/pXURFqFVkG0R58hg/2tQta8SFH1M
         /i1g6Df7GqA/EN+ecc2/c8G335rlBbDXlmJQ8LT1p5qUHnKz6Xbz4ouUFRQb/QUx8WdC
         I2/w==
X-Forwarded-Encrypted: i=1; AJvYcCWUi5aJDxT5o8tvBlsLy9SjpvunC7tMkWtziVS/t08nbwvIGRkzlSA9XYcdPGIJsE17IrCUzx9FIDKxMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmr9Z+sdRJbj39k/lY/obX4i2QK20Lw18lIQ8oxuUa+mdgi4YP
	UCTbMGZqMZPaxSzrClks1jK+HwdL32n8hNITPn+6SVQZ/EyC1RDjjHj3SqUEUw==
X-Gm-Gg: ASbGncsy0UgLV2Yxge09+SX+6tGM/TlD48PimGazykpuY9Iqi3WPCVxV4iyeodgrMKk
	S3RQ9F/SNNWg/6WFzlJpJJNvsOH+ZIkU7FV19+nDND1HyiSR2fwodkmPnPvk6sqrr9YZN5/MrPw
	RpzRr90W6+vyZsTjxI2u/MhmWzRx+I2JzhD3eX/giKT+uXALZaTUFNGS5ak0ovPNBhaTNU3fBKu
	avgZrIYLWcWessp6zUqNhI7WuxHgKGgFjxPDRvnIqK6rjM1xDUl9RSLl6saGq0bQkwzaeCSSzcd
	2OdHmnildYDkLStyy0kinh+BnYs99iRcbCemJq/3mT7LVXAKBL4SoKN999j/jKFQaJcE5M8JIek
	kLc0QpbuQ7M8gUKGydhnKYwTozzXquhYvtF5daSfdQDKQnHCJZ2hDz+D7TsZcIYASnd0P7ffCGq
	B7UPozc+OY6XJCns03GSsOIbTGj1p6rUbX+G+jxDK4qmH1UtV+PJbaJA==
X-Google-Smtp-Source: AGHT+IG/TBV+A8bmaBoikqNUtCPQowFYhYHjj48TCLGRnn+yJSpzeNPkOqlPll9rNNnNRGEy7v6bsw==
X-Received: by 2002:a05:7022:1e05:b0:119:e569:f865 with SMTP id a92af1059eb24-11c74883629mr519011c88.2.1763428608428;
        Mon, 17 Nov 2025 17:16:48 -0800 (PST)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885d8sm58399516c88.2.2025.11.17.17.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 17:16:47 -0800 (PST)
Date: Mon, 17 Nov 2025 17:16:45 -0800
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: david@ixit.cz
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH] mm/vmalloc: warn only once when vmalloc detect invalid
 gfp flags
Message-ID: <aRvI_VU3NOUaxfvk@fedora>
References: <20251118-only-one-vmalloc-v1-1-29f8eacb4605@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-only-one-vmalloc-v1-1-29f8eacb4605@ixit.cz>

On Tue, Nov 18, 2025 at 01:05:57AM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Without WARN_ONCE, the logs get spammed immediately after the boot,
> on devices as OnePlus 6T (Snapdragon 845).
> 
> Fixes: 7179b2256315 ("mm/vmalloc: warn on invalid vmalloc gfp flags")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> I'm not 100% sure this is the right solution, but having WARN_ONCE or
> rate limited warnings here helps a lot on devices as OnePlus 6 (sdm845).
> 
> Please let me know what you think.
> ---
>  mm/vmalloc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 49e0b68768d73..2a3ee17093d6e 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3934,8 +3934,8 @@ static gfp_t vmalloc_fix_flags(gfp_t flags)
>  	gfp_t invalid_mask = flags & ~GFP_VMALLOC_SUPPORTED;
>  
>  	flags &= GFP_VMALLOC_SUPPORTED;
> -	WARN(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n",
> -			invalid_mask, &invalid_mask, flags, &flags);
> +	WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"

You accidentally deleted the comma here. 

Once we've found all gfp the callers currently use, we should never be
hitting this warning, so ratelimiting won't matter. Either way is fine
by me though if you still want to fix and resend this.

> +		  invalid_mask, &invalid_mask, flags, &flags);
>  	return flags;
>  }
>  
> 
> ---
> base-commit: 0c1c7a6a83feaf2cf182c52983ffe330ffb50280
> change-id: 20251118-only-one-vmalloc-b8d997045791
> 
> Best regards,
> -- 
> David Heidelberg <david@ixit.cz>
> 
> 
