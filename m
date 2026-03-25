Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28083ECBEC
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 16:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454909; cv=none; b=iUEMIM+lMlTWyykYCwtjnRwhejmI7Q+k8BDfxbwFezXBYEOissVXdWf6Iw1rSbOV2FcEDUR5NPYwtafP+fgQTaa4jxUZAcC3MB+f6BSRKj1EjCUYUlTT2VX0Y5LlJ9Zqhfr7odmw7WkMXGFnG9Q8eiDy1yFpncHg18Wnkvx8IpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454909; c=relaxed/simple;
	bh=hNNwjsHedzC//Q9OJ1PxWjJ65mudSwkNnDyt7S2u1vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQIokDVfctjTRmXKfBtwHlaLajV6WYJRCQ4I01t+4bqW19BZB6+kzMeiDLAu7GSKXnvhMfrxmknuUb2fH4vkOGsdtjbuLBp5LiEbkKcYLbk/GVdcGe1TeuovNLNg85vfy4icFGOn68OLCkeLH8BfZVo2bl8VoKVFSCe6TpIKPf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clJIUZkH; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clJIUZkH"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b6b0500e06so17127eec.1
        for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 09:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774454908; x=1775059708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M17iBYC/F74Bg+gul2lB6f/cFM/aLJkZMkbSd6hygpg=;
        b=clJIUZkH41qGVMiDA2PYJ5BmcpUqHxDDxnCQ9AO3RS4db9KnC7MBoTDDaapUMlyw6n
         qE/em8tvVIZCxR5Jy3HUyqoCVKkyA0T//9nfYhQmQcq7E57A9TAS6OY4RjNK8tX8tYN5
         aoCSkAEtVYqZE3PhH8V4MUJG6va7jLCWPbWdjoAl4dOZ4CBaw10QugLCa8C6W8UIVZKg
         fEgUX4bZnwVs+pE/wTnEawVSz6IGyS1JLbatQi/NozomPIaGLcly3oAe7tXF+VlJIfqp
         GEKbfkC1Aim+416DSlCWydXn/6wIUhmUpWISWUaRQYLMTkhN8pUGkmmJuT7CcSoFKKdY
         jO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774454908; x=1775059708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M17iBYC/F74Bg+gul2lB6f/cFM/aLJkZMkbSd6hygpg=;
        b=XAreD6HWZmPvKM7zPdUGlcH5qsQJpQ1rdoxCzV8tBx9v1rTVVPwv/1Ci6Rq3cC9Xzu
         dTV5VVNi10PEejwcStBE8Pj24pCKZ0/07Ts/2oSL+fHdpRlu+5GtgHzHqhzpv00HigjK
         5F/f8BaGdYJ4Fc1lQ1iUMUjCpX5Uw0Cxim90UJhKza/k5Qx+mpoH/D109DLGdzUFYOUf
         S3l7QTdFOu1cZITBk32oo5hL0MGsKFVgzZt511JOcL3HDzW6R+37aOw1gZ6ZM6D5Ntjd
         wh3FrNA90KAZ+0Iqn4mC8/P0TrFiYBANnfzf3VMoBRf5TGOaHn9nOkA78t4H5zaSr1sN
         JOeg==
X-Forwarded-Encrypted: i=1; AJvYcCVmxesVRQofNGjzDsscqVCoj50reljOynv3OP9W40918lOWy1kshNSEwun7vM1O8istgK2urK6BGlIZPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9UVCEJub9UxpxlU3rr63YvNjd0l5pSsDOSFSU3WF+afCVykU8
	GCfjQyEQ05knQHMKG8s7gFxEAp+cV+e4moY6moG58EGWiqhxlaabcVze
X-Gm-Gg: ATEYQzySmW2biN8y24LglmN4bkc9Lx1ithbJt8i1AVnTEzzTR/1u3HoRC9Y/JbiBlUy
	XB93v1uY+u/P/ThAjJmypUg4ANCKiyyq2RoXLhUJ4GZwsBb1bXQwCozsiAxfgyQ5lJ3/tqXX9x2
	P54mkc6fwPR7wHHLR2hALc1G+3+Ye8qz3eXMsM98AkD+JXga7JvoX1KbGmHa2xUxNYE4uesN52X
	jyspMVDvDNtrBzoB88cl6KOwOzcK5toSLd3eFqBLgJGUXLj16TN11X+VKcOhEvdNAQkwGwef9Nc
	WZUHk+2bnfz2y9sV5AMpmKONu7GSN7JufYveH72a8eaFvt2ihQg8m/XOjahUlp2TIzSAIG10o+Q
	2rtX1+dXwMwRZZlKykFFmQy0VZYEF3KkMl/TnvhPJdvFdrPV4mBRL3KsF1nw9Y/MLSy94/o/9qN
	83EfUUFiQ8IgTdr9ucUSxij669nSMlQzKFiD4x4IvPs6hFuYfNFHHBSXCFnn9sxo7M
X-Received: by 2002:a05:7022:ec86:b0:128:d3de:c9e4 with SMTP id a92af1059eb24-12a96ee7658mr1893590c88.30.1774454907665;
        Wed, 25 Mar 2026 09:08:27 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7b4:352d:eb23:66e5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa6e5b9d9sm194018c88.3.2026.03.25.09.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 09:08:26 -0700 (PDT)
Date: Wed, 25 Mar 2026 09:08:23 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Val Packett <val@packett.cool>
Cc: Hans de Goede <hansg@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	Stanislav Zaikin <zstaseg@gmail.com>, linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: goodix-berlin: report a resolution of 10 units/mm
Message-ID: <acQIdFQeUi5E227r@google.com>
References: <20260321073242.556253-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321073242.556253-1-val@packett.cool>

On Sat, Mar 21, 2026 at 04:30:07AM -0300, Val Packett wrote:
> Without a reported resolution, userspace was assuming 1 unit/mm which
> is wildly wrong: a regular smartphone is clearly not 2.4 meters tall.
> Most applications do not care much for this kind of raw mm value,
> but Phosh's on-screen keyboard would accidentally trigger swipe-to-close
> gestures due to misinterpreting small movements as huge ones.
> 
> Do what the older goodix.c driver does and set the resolution to 10
> units/mm to make sure the numbers calculated by userspace are reasonable.
> 
> Signed-off-by: Val Packett <val@packett.cool>

Applied, thank you.

-- 
Dmitry
