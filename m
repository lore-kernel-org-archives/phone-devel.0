Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58E11DE4C2
	for <phone-devel@vger.kernel.org>; Thu, 25 Sep 2025 05:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758779143; cv=none; b=lYX86M9Aw3Bh9AUsgFg5szCs0YcXDVU0zH/jXaMU5qq0JOVZ/OT7VVFYBSpMMJtLBDCZ9kPcGyToNfBavIOV7+AypBWoKLLMnbfA7qPPHdHgisNor3Noiz2wVLwS6a3heQRVH6Hkbe6mEgJWoEXjmlDsLCZr/kE1QHhV3Dy/+wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758779143; c=relaxed/simple;
	bh=y91CveNU8o61qRzBPIlmeKWPSA+K8ejO5zowlYxLNPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhhCuog3SAK83c0AFlwFR4NGociW6uANTKImBcghB3b6YfDH6Kdi5oG3UDaO+AozH4ckHScuv64FsKefjOJ+bZKEfoQ9xuydgmkzEQE7/1dpSUr+xS/5evIYEJvFfM8onoMY9guFoum8fO9n4VUC7bWCNJ4DNk5uH/ty1R+LT3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2g+S9br; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2g+S9br"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-27d69771e3eso5078015ad.3
        for <phone-devel@vger.kernel.org>; Wed, 24 Sep 2025 22:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758779141; x=1759383941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Q6VyKRbOn4TYUtmAcOT7qWbJ+MHx1s5wBeVwgJ07ek=;
        b=D2g+S9brKnGuc3tx2zqhfvgvLwLrlqIElr36sUgjOi2lXYO9iKupEG061yyBgpjEXE
         iYYfg+Q04QFqAWqG0Seev3IcbNtm0hp2ePi3TIQX40lTVixf8M5ehqbHhpst28B+j6NF
         ddfvCOIxD3dsbmiaR8L4D8h7Wc3smbzXwJ4V7uX6zj5g5QqbFzwE2Qjs3PqjiDIuWdH8
         ygrxPsn7tMn/0l/yfSItt2BBEEW0WEO9D3pqG1Hzz38x4SLn/WATbRCvGJVIUCdNNjNn
         OKIugOdp8wcnEEaWzl+WpECE0KTR2vu59zqiPn+V4UpaFEilHMKxnMosXUd2OTaE6EPk
         BgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758779141; x=1759383941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Q6VyKRbOn4TYUtmAcOT7qWbJ+MHx1s5wBeVwgJ07ek=;
        b=ZPhEsThmW8T7fL2g22o9cgE49S/UbEj87fRTHDnqKMnnwpE5OsiraU8+o4PBrNezi1
         em6HSLZuq9jI/72BVW4fCenwgX3HGLqVXh3Fe9xMD8hc1r2q3svLHeSpndQW/L/W5+0s
         +qMSkHtSgcAeqXubpwm3g1cFzSqjo0EhrYdr+b3raH7GFq4ub5SquUKPluABXnsfJk27
         rHpnoCF+tl7kQYweXXW3HQAusgyZLNib8Tf52FpIC8gFw3ZJg92+tnd4cr/imevQOxbL
         IcU4zoFWoC0qsR5xGfKsjR91eJCSBy0/agNOhvS48wXnsWtWk/RTTT5A5yeody2XpMV/
         JBhw==
X-Forwarded-Encrypted: i=1; AJvYcCUOaahFBmKlmIsM6Q0Prh3AMXZrLoPpKW3YKJMF91oavwITmf3vHUzIqgYVKfLERrmAQFWF2xesE+ooUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm7CjJTfD03+RPgQRRcelPNJKxm9s4KtTQUu5raKphROzfE+tn
	8A6jZ317KuTtCsHOpxjOExnbMDrKH4jBpKfEU0XX6AUvqVubls78Y7Dq
X-Gm-Gg: ASbGncva6Y30LE9rau8zSv4hyXc4YcJsG5fJK15IWhnO4sMCdHKVJibLY4a1Q+IJW8A
	witOIF3XCWuzS8VLdsJwtHiOqHSUQPMOY6CVeznDXOMZa/SL5rj6yJt5eTfRFcPno2A0/faF86a
	lojBaWR+Czz+0zipwnvEphBwwRjbGpJy/EII2+mZ/asEv8/RxaHU5M4kGeMDootmfRVKAn3DK5z
	mgfAp7PxQ+9/3pXyarpuyUFdb3P0PpMpYiW2A+f0F4Kdg1KE0UaQb9AeWHwJX7foV+HF0K766Wu
	AHoyeyZutSnfYOAen2G3/hYGAKvL0Z0J9S8mQnzpeRRyWA+WV2nAmziDOn96muVdwo65QU3JOie
	Z0IbHEwI0kbJtKUPDa+6sf84bFiTu3K8h
X-Google-Smtp-Source: AGHT+IFHyxcxK4Vd8sIGKGdSk7wQBBMmiacmoNUDPi5/Fxp6WTX1EZgpGu3p+r4H5CbHYpbKWFBz3w==
X-Received: by 2002:a17:902:cf0d:b0:27d:69bd:cc65 with SMTP id d9443c01a7336-27ed4a96a83mr23489065ad.45.1758779141061;
        Wed, 24 Sep 2025 22:45:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5a97:14cb:a5e:6c78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671d8bbsm11739105ad.59.2025.09.24.22.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 22:45:40 -0700 (PDT)
Date: Wed, 24 Sep 2025 22:45:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Courtney Cavin <courtney.cavin@sonymobile.com>, Vinod Koul <vkoul@kernel.org>, Bhushan Shah <bshah@kde.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: pm8941-pwrkey: Document
 wakeup-source property
Message-ID: <3kww5et2q2mqddpvtqzuj3jqzvfds66qrufawcmumamrqoaugk@tiq6zoe5psom>
References: <20250909-resin-wakeup-v1-0-46159940e02b@lucaweiss.eu>
 <20250909-resin-wakeup-v1-1-46159940e02b@lucaweiss.eu>
 <efb03993-0481-45ed-8f7e-8b65519a55cb@kernel.org>
 <phctwoxml7hscwcgaipl233lotnrkgcpe7rxvhm5syoiadu3lv@ibgeib4kjyhs>
 <9e39f1b4-63b2-4c6a-8b31-6360be1952e6@kernel.org>
 <dcdbc6424db6953dfc39fc05e0e050ab@lucaweiss.eu>
 <kxgvebizxvlflu4qen3cb5v4lcuydmdixvi7624hrggo7f5u5f@zbengtjkekfj>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kxgvebizxvlflu4qen3cb5v4lcuydmdixvi7624hrggo7f5u5f@zbengtjkekfj>

On Tue, Sep 09, 2025 at 07:54:33AM -0700, Dmitry Torokhov wrote:
> On Tue, Sep 09, 2025 at 04:41:26PM +0200, Luca Weiss wrote:
> > On 2025-09-09 16:33, Krzysztof Kozlowski wrote:
> > > On 09/09/2025 16:08, Dmitry Torokhov wrote:
> > > > > >    compatible:
> > > > > >      enum:
> > > > > > @@ -36,6 +33,11 @@ properties:
> > > > > >             pin should be configured for pull up.
> > > > > >      $ref: /schemas/types.yaml#/definitions/flag
> > > > > > 
> > > > > > +  wakeup-source:
> > > > > > +    description: |
> > > > > > +           Button can wake-up the system. Only applicable
> > > > > > for 'resin',
> > > > > > +           'pwrkey' always wakes the system by default.
> > > > > 
> > > > > 
> > > > > I'll fix existing code, so don't repeat that style.
> > > > 
> > > > If you ack I can reformat on my side to match the patch you just sent.
> > > 
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > Thanks for fixing that up Krzysztof! I noticed but didn't want to deviate
> > from the style just for this description. Of course better to fix the
> > formatting in the first place.
> > 
> > @Dmitry: Maybe give this patch some time (1-2 weeks?) to gather more
> > feedback,
> > given the reasons outlined in the cover letter. Also on the driver patch.
> 
> OK, I'll hold on to this for a couple of weeks.

Nobody voiced any objections so far, so applied both.

-- 
Dmitry
