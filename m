Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343A51FBCA7
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 00:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763426049; cv=none; b=uUwQoZaECQ7W7InjvoZvHrEV6aKt6UdamcPYL/CJpyIRlnPmU8utlwQafRfx5lLi5TwX4TeSTfXhvxkR3t7zU6CFYkl1+sjXJS8oxJH344IiyXt/z2/IOnGMJOZOz4hcK6WEfVKrbaCZbYggiVAX/AUTWp9L2zANmx5e4TN9Cgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763426049; c=relaxed/simple;
	bh=8vasXkMPmOH9aGjpZc+D44J767M8I3avHSTES4Q1P2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PD7p63AAK/7UuWVeOB18/B95F95pRfOgPJ1xYmJbgE3x+S2xmNofq5Ne8tdp60r38Wlsx+QVnl48wfO3/xf9is6WWVS9Ja5hIQPNuVjjHs4ElnBAKDFI6bEWpqT0HcByx9uwaXo9d3cFohZXSH6pylKm61RTq8wfebnVoi3FGrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ga6YUqOa; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ga6YUqOa"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b996c8db896so5006451a12.3
        for <phone-devel@vger.kernel.org>; Mon, 17 Nov 2025 16:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763426045; x=1764030845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X9AZpi4rt1ui+XTsMMyozDrxAzlPBqocMCdUZQhvEGY=;
        b=ga6YUqOagivJEgYCvF00vr8KGiCZlFxVO7y+a0X+/nXpkIKwZ8yrNp4uvqb7r1b95X
         BEOBAhWrQvXdhWUGtw1ZwQ1x/Q6ewkCjmH0kfoxmk/Czs6nxUNAjDQkC2fzK2dOSOneK
         o+Lk8/hfru1Rs8pt0M+kgtAlfaMMKGZkm4eY58Q4U1ycxRXZutbzMO8TcP+DKy7eqsP4
         rCSEK2Xs/rTIzGcqmzntNxVMBR0hDW5GOK7l2G4891ppz313mLPA0zGBqA0X1ztkdCvu
         MvkPh4+RpRv6V3IXqL3tddkGVT8XsF9+9WHHV0U6uMLdZo4DWNPPj9n+B/VUo0imC/oY
         aSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763426045; x=1764030845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X9AZpi4rt1ui+XTsMMyozDrxAzlPBqocMCdUZQhvEGY=;
        b=WLZ2LZd/T/RFHZF993r9KIcYXBdnXjO4gMdiaV6/tQDDUXqcLyIJdEqxOH4wHRWULv
         FmLfhpfDq+QmdHJYS98MTz0ee7TfNyrjS2FdvWzhZ19B0EZnOhj9FPOAL5rS/H+n8vGf
         FFIbIuvT22hIrEdD14GM7/cGCxA0K6YoOMfC5fY0qMArq2tICHRjfmBR6jQvbiONmpgb
         ExVqGZxqBL0uhwNYOcMZZ8l7Pp0njVk3UzqGTzTVVx1tGFIOfJ/eXQUGu3zwOROT2jxu
         r2C3AJI/LlGq2iwTVLb7F8fQWBJO3V0daP1wtelFkY3zMUodlz80JOhLtV9VDc0j1qXK
         wKvA==
X-Forwarded-Encrypted: i=1; AJvYcCVIJl9Dg3P3EgHqOkQjgV14xMY3WLIhRi87TMFW9552oAiQiAfUC3eNGHPsYgDe64tGOjfqFP4XafvmbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoNWAN0TrfcACqE1z/FoWdVYO3lVm0MH0nWB21jSe9TmpLfAtR
	TOkINQLIgEFlcon2m3F5avs1I1CRHzix6p8feoB15zV139Bmj8N9JR7s
X-Gm-Gg: ASbGncsWqP3KeK3w0ReIVcBrsGJFLLVy71wdehVfqkcta7KzIzkJ8K3emh2PxESS9Ti
	pYjOtexxFJgApizI0vRILgA74e09YFPFVrbvd9XgxurWuaYBch1jKfclN/vC5d+8YfdnufQlaBv
	/2sh6wo0Jwdo79vkmUvkMBba4yPH08BYzJkY6lZkQX2gA2jow6TXSVnzox1xFy8Wd0JBs5Jvq19
	f8XhQ+NFhweVf4GTblcbpmxWTtz5yAB1aVLPr6GAFpYeL/aNk6eYi4GMtstr4EIYUDstHa92WMa
	IskHClCcA6HMIoMLWJDLwU0085xQ5HZh+ATSjA5/M6J7z8u+uLltbQ/Wo50Axgd3luZrwUNBoSx
	vtmoTOaykKfLEd7iG5WwC8hgHSTtzd7T7VMg6d4DWCmVFdqvNe5NigLz7w85Tfdyl8zINXKpEp8
	MMvNfS0GUa07Og6gC2Qb99tNp2a+cIH2SJgj0dz5pwbI4=
X-Google-Smtp-Source: AGHT+IERhdfBGNNDmKwPm4AkzEyQK0Uu9QznZufddn/c8xEntSCPx/v/Mh1bHvhpFcZEPkiU22WElQ==
X-Received: by 2002:a05:7301:a28:b0:2a4:4527:1f0 with SMTP id 5a478bee46e88-2a4abb30665mr4073482eec.34.1763426045123;
        Mon, 17 Nov 2025 16:34:05 -0800 (PST)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49da0662dsm52726368eec.2.2025.11.17.16.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:34:04 -0800 (PST)
Date: Mon, 17 Nov 2025 16:34:02 -0800
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: david@ixit.cz
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH] mm/vmalloc: warn only once when vmalloc detect invalid
 gfp flags
Message-ID: <aRu--sVhXRWthmhe@fedora>
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

Do you have any snippets of the logs? There'll be a particularly helpful
section that says "Unexpected gfp:"...

> Fixes: 7179b2256315 ("mm/vmalloc: warn on invalid vmalloc gfp flags")

For some context, this patch begins enforcing the gfp flags passed into
vmalloc(). If the logs are getting spammed, that means the device is
calling vmalloc() with some unsupported gfp flag, many many times.

> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> I'm not 100% sure this is the right solution, but having WARN_ONCE or
> rate limited warnings here helps a lot on devices as OnePlus 6 (sdm845).

Can you check if it still happens on today's mm-new?
I just sent a new version earlier today that also masks off
__GFP_ACCOUNT, and had an iteration earlier that added
__GFP_HARDWALL.
