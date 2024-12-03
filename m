Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30621F12F8
	for <phone-devel@vger.kernel.org>; Tue,  3 Dec 2024 13:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234268; cv=none; b=OWndu3BMw17YOOiU8YkNy3oD+egf3X4vEu4+v1ogwfw8wqnwtCCjPg2X2jopFLeNS1Tkxrl2lsVHLnV8/0w9xpOM5FZ7TNBvUN+EizMJqKdYHeTcUGBXcmUh7g+DTtbiPUVb4EfPe1V7FDfjtm51i79eDOrPOFyzd7t8RoUke/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234268; c=relaxed/simple;
	bh=rYvvBdg8fi4Xr/3R+nVFs7fW312NlcNLWvE6GK67uZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MynMegf+wnM7amjF258RCGrNY/bgP9qQdwtd/Ef/VmO48MTi0YZbplwtyTlbOI9C1pvyi+z+0aovWPu1YTRhYwBC5eqT95aLiAEta+PICkhBo9RWn0yhPQsRQCE5A7MD2OU3ssjm+qN5CNiIEHgmGu6Dnjul9oPwV0KQhkUeR7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fl+HyxFY; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fl+HyxFY"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ffc81cee68so57038691fa.0
        for <phone-devel@vger.kernel.org>; Tue, 03 Dec 2024 05:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733234265; x=1733839065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vma/aVgOijobBlFAdjamC8x1tA3Lu2jI5+iEG7pb/Rs=;
        b=Fl+HyxFYW+x4I5aqYjjuCRfwZjrlx5AD52TR86fq15vcJGuthMvY0T5nbjIxdgek32
         xqQXEEOi9YZte0gnhnDQGK7EUPruhor8bp4WZpX3+3Ib5bDTo9s7jC1xmnN5eQr2QPlq
         bNZeCdmTyJKycEofHFFGuqnN2XcmTrVKGZq8kf7lTZYpsfCPKt/LdOx1sgjri/QsyirK
         Z+R7NFqjgNoBFUDRJV8tb13T8z2ignlBD2r4FytBTiHTpjgcFfGKytV75jweJ3+Hq0T5
         3ZlGFx0f5R7RiJskcxFrIFeAJQnpniQpgBPl3bUdrzXcFdzzYmpsiYwFi1LPa1bPIA3j
         lEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733234265; x=1733839065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vma/aVgOijobBlFAdjamC8x1tA3Lu2jI5+iEG7pb/Rs=;
        b=i43t/TA9NSpivEAVg9/2d1vsVwM5YF0DP4PbTvggylU7/e4S9h+maItAnMfSPWa/8J
         PCJu5gYK4IpelipnX1ujxRbZY+k7rCzv2sbrqimFQhuwutytigL1Pvb7QkDoa5Pv8THa
         vQ6ChNJLANKU4JiMwMtEtbAOC+dGBBKfZ3EK3runYB3uPVoenVSzEb7Aark048/2vdcr
         O+Be/aFLcwaAZAcSgzOdNbu7hHzeUTD8NauM/Qd/gGQoPZokVgCL+BYnPSZpX9TM5veL
         TA2FJ20q/hXFdmUHp8P7xJnhoSOH9c1K23i6T6vEZW9Sh4+beAbqfx3TNEES7qQoPBvt
         hWyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcNwbBJVVO4Ngw1FDKWQD3l5Ka2LPAWR0Uw395oOnRKRJxSvnuALLbfdbJBnlUv3reMb3NxitUUc2pag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Aj+tVL+b8e4dcb8kziC3mqPcWeyWu0im07VHVP/LspHi0caN
	818UauNqpu/QG+pjXj3tAooNwTC4F5LFqrrvAN+TZKpBirA/19ngHphjMFic7Jw=
X-Gm-Gg: ASbGnct/5fw4241HByit1GBoGjLA6bUAQnRTsV3XJPfO8t5WGmUlR6U/CcVtY90GWId
	CvV5ckWcvIDpzurYhO5lqFD/vCkls2j1MY4i/ODy6GpMU9HLdL9de3mrUKNJIho75b04SHtzRoF
	ZCgIUE5apcPOGIyRbS02mNKGRfUXASnAH/BRigU28lcbe7RyOUq2fVboOT23HBw3f9hxNUu0uHL
	X8BgE2GmalCJlmypZegy1gWz0ClbBtI4566YxdPrdI+eXzpuu0hdg1W+i30hI4Zvz4XYKwB6jWU
	Mu1k3AbcMdtw1oS9WtMELq6X115cGA==
X-Google-Smtp-Source: AGHT+IEWu4ApKaC7Ta4KrqQTWekPko59agvuRUFXVxJooAszNQZ064G9g5fn/NzI3dsNUT1RD2yGnA==
X-Received: by 2002:a05:6512:3b2c:b0:53d:ef6a:17f4 with SMTP id 2adb3069b0e04-53e129cc3d9mr1370082e87.1.1733234265135;
        Tue, 03 Dec 2024 05:57:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64432b8sm1845404e87.90.2024.12.03.05.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:57:43 -0800 (PST)
Date: Tue, 3 Dec 2024 15:57:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: power: rpmpd: Fix comment for SM6375
Message-ID: <rcoo6p56lowzbkgci5umhg3xd2hnp6ledk74ys3hw2t2il22nw@bcbs4zmcbzgn>
References: <20241202-rpmpd-sm6375-v1-1-12a4f0182133@fairphone.com>
 <yo5cc3cvvwwdrqrrgwlquztj52sijip3ffyyqag55jrnztxi2m@hn75ylkhnxie>
 <D61WIF2XWKL8.MWU6PK2XGX4F@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D61WIF2XWKL8.MWU6PK2XGX4F@fairphone.com>

On Tue, Dec 03, 2024 at 08:52:59AM +0100, Luca Weiss wrote:
> On Mon Dec 2, 2024 at 9:00 PM CET, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 04:45:02PM +0100, Luca Weiss wrote:
> > > During an earlier commit, the comment from SM6350 was copied without
> > > modifying. Adjust the comment to reflect the defines.
> > > 
> > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >
> > Fixes tag, please.
> 
> I thought for just a comment fix it's not necessary / desired.
> 
> Anyways:
> 
> Fixes: 2d48e6ea3080 ("dt-bindings: power: rpmpd: Add SM6375 power domains")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
