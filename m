Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE554199EB2
	for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 10:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738060861; cv=none; b=bC020SCOpRVp/7+KHfirEdGv/V+E8Hoj4IgDvO2s+CmY0tipi7aW+DMA43wLX5UkXc+uSTzLvMDVvAwk3WQ+b6qhV0VUUU6tUIZnZIVcVOkaKPjQvUcsMYmHFqXoMVWgzcknFFB9RPWl8ZjY48hdFB2JZql3VRIg7HsFefizRFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738060861; c=relaxed/simple;
	bh=fHkCcPoOld5Vayx/a8s9YzaCZAQ95P6ms4pCUpWbve4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gE6sGvanTyQobNoPLm7Gd3Y/TW240k/wDC5YwrLdPp7s1zMGIvcQF9uPSlgn6c5QPDZHI6gJzCopkAcL9G++YuAsJBQN082Qfw9tsFEIiqTBG4qd8jWK0kgpBsNBIF76hbQEmaDDX1iAWrQAo8N4ddaTlo4Aq6AXDzmZLt5aJtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fuUZKx2+; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fuUZKx2+"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e573136107bso9003581276.3
        for <phone-devel@vger.kernel.org>; Tue, 28 Jan 2025 02:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738060857; x=1738665657; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X+TSS9BHptLsGt0UNSzZvK+YPeXxKpKM6xF2wxrn1RY=;
        b=fuUZKx2+1D3VSoq+KDIEF8RFNMkVR4AtIuLyPSIC3bm20DRGGR/CLuZAODreqNbN19
         guLENp2N8B9qbjNw+RdB3O/2XKpG+Lntl+ZS7M1lnrFC3UziM474HXXqWkfwFKpn4/yQ
         5uGmclhJ0E+OqFR165R5/XcDn1wUfG/SctlQgWPJMjmYrTtDpbEPfXBoBCel3QvyZpQI
         a52YA1061xhKhH0eBVOqzOzp0lXAAif8UBrjTkoY4WL3YmXELUcbrd1R1jP2MPHnLW0j
         KwfeSd1mxcgo0LBaNV2EkyySkSgbbQs2qbk7FLx+LhIzaN3sa1/ExLIpEQ0TBEyO1oUQ
         EUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738060857; x=1738665657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+TSS9BHptLsGt0UNSzZvK+YPeXxKpKM6xF2wxrn1RY=;
        b=YwDq75srK+mQ8+E1VjwaqQFrX5V9jCCLc0VXuREXefLEZD5WneBRtWI1vlShV54WvR
         JE8Hxxofl5/z6er9mRBq9F4ADNSl/HBV89vQDNZeg1sknWpdXVjjRQh4fHXOn+diAPYJ
         R9m2wYeLVUraSlnWUC/i4S+P849ZLEXPLc1qpaeLHugXAQlFGvlAUCeyN/Ucg/d9++mj
         pLNqxNPUGA1XA0yiZsNPwEyBazKVgtzfKWirPpjni1L0p0PWqqGz9SRFmcaxxavtXSar
         PnnF+z0kr5JPiwqGaxHTHRHkL2YDBHQ7Tj/XljkyLdIUZvSplVupvEqQhP8VfelHkzKo
         3wxw==
X-Forwarded-Encrypted: i=1; AJvYcCUJcuFvdsY5P43W7MY10q/uuhDIVat2H17kOS6aXv95jwjQo+aCXNoqGwZ2HxwxAxYk6IfSdPvGFQEomQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEue5qWSaBJdAaIVkLQO0eXsMljSR+KE/jLcn5gZK4yKR3wTQS
	4crz/FwgVHW3szFZ5wfquW9UNmUbn2gAxnEobRPh5S5VXeD1UIKsEs/GKECaDiy+Pl8Swp/nfER
	K+8lFwCBm+BNFo92He9IHSybN172hLGdQ9LGDqQ==
X-Gm-Gg: ASbGnct8n9SzAx16qWEfs440R9vwzbF48Cwd1kWP5cFoBVBuIujS7dvp0yLJfIPKgDp
	FTqNi1asxSUiuK/AhB3xVUG+RlJzSKRRn24W0g1yR19w1rTDZXOwAfVfV4rlFimmSuUdcS5g9zA
	==
X-Google-Smtp-Source: AGHT+IEmH8cViK+UxbmsoUoGLBe5kZAMQb5oP5iNgocXG2Sf79bsQ7NtGK8mhIzgG/5TkGLx1PVW6ZLN6j/dzVO3Q3g=
X-Received: by 2002:a05:6902:161a:b0:e57:94bd:4e0a with SMTP id
 3f1490d57ef6-e57b13451bcmr34589002276.40.1738060857692; Tue, 28 Jan 2025
 02:40:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202-rpmpd-sm6375-v1-1-12a4f0182133@fairphone.com> <D7CS06UAY85B.1L2QQXQ63GFZ7@fairphone.com>
In-Reply-To: <D7CS06UAY85B.1L2QQXQ63GFZ7@fairphone.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 28 Jan 2025 11:40:20 +0100
X-Gm-Features: AWEUYZmLWZpIy6dPlIk9mwW7-sSnAKdnFhxVFch4NAa0RB7-7jLqSeJPT2NrRsA
Message-ID: <CAPDyKFq3xQPVzocPi13+AWoiWPpvejoAotMOM4VE4FA0BLqv0g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: rpmpd: Fix comment for SM6375
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Jan 2025 at 11:16, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> On Mon Dec 2, 2024 at 4:45 PM CET, Luca Weiss wrote:
> > During an earlier commit, the comment from SM6350 was copied without
> > modifying. Adjust the comment to reflect the defines.
>
> Ping, could this trivial patch be picked up please?

I pick it up after the merge window closes, via my pmdomain tree.

Kind regards
Uffe

>
> Regards
> Luca
>
> >
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  include/dt-bindings/power/qcom-rpmpd.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> > index df599bf462207267a412eac8e01634189a696a59..d9b7bac309537cbfd2488e7d4fe21d195c919ef5 100644
> > --- a/include/dt-bindings/power/qcom-rpmpd.h
> > +++ b/include/dt-bindings/power/qcom-rpmpd.h
> > @@ -65,7 +65,7 @@
> >  #define SM6350_MSS   4
> >  #define SM6350_MX    5
> >
> > -/* SM6350 Power Domain Indexes */
> > +/* SM6375 Power Domain Indexes */
> >  #define SM6375_VDDCX         0
> >  #define SM6375_VDDCX_AO      1
> >  #define SM6375_VDDCX_VFL     2
> >
> > ---
> > base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> > change-id: 20241202-rpmpd-sm6375-06582e126d7f
> >
> > Best regards,
>
