Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C56314B79
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 09:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458306; cv=none; b=mWDzSM/5JaC/FfUhLT8yfgh2oPYBVMlNX+Y64sSBBgPUkG9NurcVKXkgs2VHQXCVfk3kM4DO+1bcptbinwWaFvdMwqqpSbRP7GK/U6k07Ef8F4y1xclT1Nsaq4DfWk7RrfAa0ojgaHm2TW+w8Ie6eHYirhzlBakX37Ss4nz/Kl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458306; c=relaxed/simple;
	bh=hg7HqJHy/6wXnNtLNKdDSkUJwtD80loCerrYasnmgvM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqh4/0hWmWMp6PApJl6pJFrzJ9PxXAGoNx1iTQ7B41SOSgFLNa9ebJBQiGXLB/0iCo69LRVgNEsZ3QJtwXVdeTtWFEg8D3TOCI6f4WrsOqefI82vioM7RWVp7Wv6W/TkwQn52hi66NaKJ7ycLWBNhRt34Z8AuLxOvtdLB3aDtYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ce0dm+1a; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ce0dm+1a"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5945510fd7aso4444087e87.0
        for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 01:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763458302; x=1764063102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LfSnUyyR+gHh/pyEYOi6VgVjJci+W/poycFy7JdBT/c=;
        b=Ce0dm+1aB4axQ9jq8GvIxqbjgydLNxOaQyUEq2CujvaEhJR6SYM0yghXT558aYNjam
         9oKzyzKYqyn4p73Wo5qh0pbAWd7vBfBa1XIhzjnc9RG1z+EsR98bHLiaf1tHk7McNIw6
         oePbknn1xfFsdLhv7/UGEpDX6W8ynBnuuu0DPUTCFjIGaSb4GadZgA8HWkUPYp+beSi5
         tH0rHRerlM52VW4Ee3iUwOzVhFrzOuEMSCmURjC15epPncBEhtsZ000++fWc6Rpu/l8Q
         Mxqpj8KPgwbCX1u0kyeUV2CD0kiCgVr+uojga1TJpjv6w/iR1FnPhoaK0BhO8Q26CvDa
         mIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458302; x=1764063102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfSnUyyR+gHh/pyEYOi6VgVjJci+W/poycFy7JdBT/c=;
        b=vkj8mqaMpXCQEvw2qFK+A9Ax9sL/ZPCURDXY/Pc+0udKr1cJE3dMTRwQYIytw8TQAW
         7jXCHp1/fVUx10kG9RXb/PM1c0gB7iEVS90oxzzKgsNBHxipLwBywhZPyHmIVzy0Imaa
         CHQ21JVq6G8yVLLxvaJeA5NZnXeoec1QH1CpTFU8hr8+k50/a8j9XIffg+POMSUtcRNK
         MmgTLQfieSAsIUu4J42UrBEKcTusPJ/L45N9Yz9omQYOhUgj9WS7DsERoW86LIwnsT80
         8GFpfFnWTyVDR2Gu/ItFQEhyajC9QHKi6k4lcy4RSw9IUpZlGTUHN+X0iH/PdrtZkqoq
         vjQA==
X-Forwarded-Encrypted: i=1; AJvYcCU7rD+2ukJasAYOUGEilQl4TJyotFSJB3dwxJ69rcMV1NgrqZ1SCoSIhJ5YcNUEurO7WCKmAMDZNoHcEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMuwiGAIPH5ZMgaL244fiT0mulmmrNgPotgQk1Z+IERMEdD5zc
	0E4poANQbVxlxDWl1JNzT4wyu402vERAlNDl+ezPJoGTjyvybrzHg896
X-Gm-Gg: ASbGnctayFGhq4H6lsjYUdYyHMX43Job8Gvi2ZIXhtTCuQHVEwEIPjfP2Sax42Y8/n/
	w096tdGAQyligxfR9ZVMWk178QO8XkyVfAQuqvbOmSNGZX8QLzn1B6Uk58jyS2pGaAPwEqg1uA0
	jPsN2sNkA4EK7BEHBblkUSPOkHxMpZgTPBEO4Y+UxU4Ubw9GevZoxwQ32dnWAsRtqOyBY+aelEC
	4MvI6wEb3JqBzrnS93At4GSd5vaAvYSnlIDj3FbJR5mFn5zQXTdFJZddv23qZ083zw6yOIQMCtc
	moREVn/MifuZ02LqIWycJEHN+tdEkaH06OXosVhap+DzaVFOyW8mAComRb5z6ykD52xmuto2F1z
	i7srXxiUapX3rzQPSH6vPFYsR0MSrqkt6qFZBDOC89Lk=
X-Google-Smtp-Source: AGHT+IGnlKspAS2We2FABx815t9bNQvFsXJy6XwUcpIvRdQFlzF9XlXS5jEyZ/AKjBb0WZzRlZkYAg==
X-Received: by 2002:a05:6512:3b0d:b0:594:314d:ac53 with SMTP id 2adb3069b0e04-595841ba374mr5520844e87.23.1763458301885;
        Tue, 18 Nov 2025 01:31:41 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9cef2bb2sm34960441fa.46.2025.11.18.01.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 01:31:41 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 18 Nov 2025 10:31:39 +0100
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: david@ixit.cz, Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH] mm/vmalloc: warn only once when vmalloc detect invalid
 gfp flags
Message-ID: <aRw8-7Ox5TPewpw_@milan>
References: <20251118-only-one-vmalloc-v1-1-29f8eacb4605@ixit.cz>
 <aRvI_VU3NOUaxfvk@fedora>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRvI_VU3NOUaxfvk@fedora>

On Mon, Nov 17, 2025 at 05:16:45PM -0800, Vishal Moola (Oracle) wrote:
> On Tue, Nov 18, 2025 at 01:05:57AM +0100, David Heidelberg via B4 Relay wrote:
> > From: David Heidelberg <david@ixit.cz>
> > 
> > Without WARN_ONCE, the logs get spammed immediately after the boot,
> > on devices as OnePlus 6T (Snapdragon 845).
> > 
> > Fixes: 7179b2256315 ("mm/vmalloc: warn on invalid vmalloc gfp flags")
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> > I'm not 100% sure this is the right solution, but having WARN_ONCE or
> > rate limited warnings here helps a lot on devices as OnePlus 6 (sdm845).
> > 
> > Please let me know what you think.
> > ---
> >  mm/vmalloc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 49e0b68768d73..2a3ee17093d6e 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3934,8 +3934,8 @@ static gfp_t vmalloc_fix_flags(gfp_t flags)
> >  	gfp_t invalid_mask = flags & ~GFP_VMALLOC_SUPPORTED;
> >  
> >  	flags &= GFP_VMALLOC_SUPPORTED;
> > -	WARN(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n",
> > -			invalid_mask, &invalid_mask, flags, &flags);
> > +	WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
> 
> You accidentally deleted the comma here. 
> 
> Once we've found all gfp the callers currently use, we should never be
> hitting this warning, so ratelimiting won't matter. Either way is fine
> by me though if you still want to fix and resend this.
> 
IMO, it is worth to use ONCE variant to suppress spamming.

--
Uladzislau Rezki
