Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B64B2EBDFA
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 01:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763427972; cv=none; b=LnDrCrVmKBLNmQGqWriyFPo8JxeE8SE+9L1nyKQI7zPIB2rmIjVjbWVcO2krQDIbNfcvjC1QEUUk53M5qIGcrVr9t8C+ZMXoUD/3fk4jp4HoamSJfuH2N+X3UpE/7W4mG+mFozp+IbqmtX/XlygzCY9nx9dPD9J8zZAEjcgpkKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763427972; c=relaxed/simple;
	bh=vM3Ya7y05+gmakpd+ar+1VncrmoWyvnGnKStM1gFFXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjUMuTQMqc5CD0ZBKdaWexeouAwYAakZnk4cNJLtPN5h6A82XC0wBhOe+jolhr1+l7Q9uKXBH7Ldnte+0nPqaV9L86IeUHQ546MBvYkMG1yMCM2wNQ9RT5kRkqqbtPValJPnGgcEaRqAaLcCo0MpYoIsSge/6wg/2u+cpJPRjK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJ/t3f/S; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJ/t3f/S"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-bc09b3d3afeso2906498a12.0
        for <phone-devel@vger.kernel.org>; Mon, 17 Nov 2025 17:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763427969; x=1764032769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NuT9qaNyEjZfIy16bIhwfj6VRiigeFvL4hxLaIBcqis=;
        b=jJ/t3f/ShZPNluA9c43rJggWpRcvdFtfTxYRXRENtOKDIKix04nf6VdNtIuZwkZTGU
         DmOmDGnYKUVdc1dz+yDhBb1UMuZSSLQ1Rf9cd5Jn2zSmlSPExc2fA5hLtEsNnYvpZBKW
         81i+1piGju0AlIlDV2NTAPDIR+fGp6GAnkr7tJtBL3Pd3ktrN9ufPS5uIuj0h/0jx85P
         +Aj+Y+yE/0u4f+NmrzPLRhCsHCgtZGmmV3WiGjqbQRHK7iZ4tFjmW5RhoGXLgRJ1k9EB
         +xOeQFlow9wE11tFPDW94XmjAGCs83azK567aqMo7f0jNRMBxllNy+zYp5YfL8HoJv8h
         K4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763427969; x=1764032769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuT9qaNyEjZfIy16bIhwfj6VRiigeFvL4hxLaIBcqis=;
        b=E+iFzIvJzKjW8+PZnIMz+lpxqgxBfJ2+4zdTtNqCE55rjpJU65sCxqDkt73eEcbFNL
         A3JxaylocqeLy4dqGqHJl6wHVl8BWzyruK5dFS/Eglgg5MsGrRtSgo1332/T+g7qC+ke
         idFqA4Q909qpkgqs2dM/aTRKTdAXRSLiQ0EqCwLVGzxKv+bF8cnGukU+fdawXQFPARL6
         8J77JT4fVo2WN/vjJf6BW9KHjiY7bl1wN+PQQ8Bj6NDro2UnusBDVloHoRFwvqDiEcqh
         JgsRKaGXg+kWOxEqO0EX3EMes/Zt7n8l0SmBBVahPocOVxK3+47hF3hwYHl1KJgNOmoJ
         FnzA==
X-Forwarded-Encrypted: i=1; AJvYcCX8YixoGcqHd+7Tiq5+TzeD4lzVZzwV+udNZKPXAH4PgUIcbOAk3qQ25GnzHbYtl76tUtLWF2T5b/veTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd3TaMPOfqseGnpGEq8wut+IWbssH7Qf9b0fBy/9nKaBP9HSdQ
	IzGNd3EFeqX/Aw8pOcEMYm3zt06/L2WX4cnvoTxwfptK3W0e7cg4nG/k
X-Gm-Gg: ASbGnctsyKz8Y4wrTDfZuc4Bg8mVvG6eE1V5NTlmvuKCoVEiMsy2IOhfDD/bjbkKTu0
	F2fuEOt4f2mfQwfuEUi/kPpgOt0bNLopb9q+G7ZXtT5uEfZgZc9rwpHAOKyRGI/jaFrbEc/xV2l
	OJoZYev2Wo3hfBTILg5TS/mESLrqbYo4f++BWJ5blu+JKwMoxvqn7ip0rApMGIQ+k+2N1gGPLYM
	2WokkMk0DxzgpIylQtJ84k2LHLi6JepRctojMUFPuXsEHZfSqkZR9xX/jRfgBU42kDTps4Xp62s
	8d7g2hfWbh1OB6cMOwO/R9wxybyDfMi5WCMLFQZ0JRUGMgPcYZGiHtannDcsOwdH5qg7uxGFgbW
	8XWZLrcz5+wUDgYCTXW8soMOQwJD33G0GNHfosmKPU0GUePK2PaJpHc1kJlz+iwpVU0vzIPG0YM
	gZhKJZgmy0iHx+DyaYwy7nC7r9TzXXUN2cMAFnIT7CIgXTESpnmVdSnQ==
X-Google-Smtp-Source: AGHT+IFwH0TbW37DQk0Ytd0vjS1rf0XcD6M8DDxMQ9u0ZyqXmO0VVOfpW6HRgHzgDux3Viwk3VROTQ==
X-Received: by 2002:a05:7301:420c:b0:2a4:3593:ddd5 with SMTP id 5a478bee46e88-2a4abab97bcmr5228685eec.2.1763427969103;
        Mon, 17 Nov 2025 17:06:09 -0800 (PST)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49d695821sm58437307eec.0.2025.11.17.17.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 17:06:08 -0800 (PST)
Date: Mon, 17 Nov 2025 17:06:06 -0800
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH] mm/vmalloc: warn only once when vmalloc detect invalid
 gfp flags
Message-ID: <aRvGfsZMRIQuC3TQ@fedora>
References: <20251118-only-one-vmalloc-v1-1-29f8eacb4605@ixit.cz>
 <aRu--sVhXRWthmhe@fedora>
 <b7e215ee-fce6-4a7c-995d-8ea6625b1ae8@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7e215ee-fce6-4a7c-995d-8ea6625b1ae8@ixit.cz>

On Tue, Nov 18, 2025 at 01:51:23AM +0100, David Heidelberg wrote:
> On 18/11/2025 01:34, Vishal Moola (Oracle) wrote:
> > On Tue, Nov 18, 2025 at 01:05:57AM +0100, David Heidelberg via B4 Relay wrote:
> > > From: David Heidelberg <david@ixit.cz>
> > > 
> > > Without WARN_ONCE, the logs get spammed immediately after the boot,
> > > on devices as OnePlus 6T (Snapdragon 845).
> > 
> > Do you have any snippets of the logs? There'll be a particularly helpful
> > section that says "Unexpected gfp:"...
> 
> I didn't save it, thou I'll run the kernel with all logs again tomorrow,
> what I remember it was "__GFP_ACCOUNT" in unexpected section.

Gotcha. That's particular flag has been added to the whitelist as of
today. Hopefully there are no others.

> > 
> > > Fixes: 7179b2256315 ("mm/vmalloc: warn on invalid vmalloc gfp flags")
> > 
> > For some context, this patch begins enforcing the gfp flags passed into
> > vmalloc(). If the logs are getting spammed, that means the device is
> > calling vmalloc() with some unsupported gfp flag, many many times.
> 
> Yes, it was full dmesg buffer just after the boot and I think ongoing.
>
> > 
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > ---
> > > I'm not 100% sure this is the right solution, but having WARN_ONCE or
> > > rate limited warnings here helps a lot on devices as OnePlus 6 (sdm845).
> > 
> > Can you check if it still happens on today's mm-new?
> > I just sent a new version earlier today that also masks off
> > __GFP_ACCOUNT, and had an iteration earlier that added
> > __GFP_HARDWALL.
> 
> I can try tomorrow, any chance it'll bubble into next-20251118?

I'm not sure, Andrew should know?

> Thank you
> David
> 
> -- 
> David Heidelberg
> 
