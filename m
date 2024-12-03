Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41B61E5708
	for <phone-devel@vger.kernel.org>; Tue,  3 Dec 2024 13:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733231049; cv=none; b=QZdHlgq16DRxJA0G+ppMCilCGL8TOMavvag3LM+VUuVlCUeDhNURilit8DBxjAy2UHgHSz1ReTZAN73W3dEBFD5shUOvgpNefK/FFZRrD+mVPGc0t3dXHqYchdSMAUXSUKd3tLERCrDiNMIA3a0KmtlrIa6alaXLBeVGVoplcXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733231049; c=relaxed/simple;
	bh=4Red2NtFdNCPFlrjhj3hdUEFF7Dn8UGMxBKxTlgNFyI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOty7IfGPD2KwtdIO8Gbln8uPIGUkM9nY4o/p96wUXy0K08ZCLPCJHmqM7aP6X0ZpnrXPh7cGER608fII+YbAEvLnMX9TlichfZUbC5Wr94mDpzqHUQgpPKRcBZXil0ZcO7iaUZ1/1wF7BWRLs7XxU4EXKY2FuyCo0b/dF/ZjQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 935553EDDF;
	Tue,  3 Dec 2024 14:04:05 +0100 (CET)
Date: Tue, 3 Dec 2024 14:04:04 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Luca Weiss <luca.weiss@fairphone.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: power: rpmpd: Fix comment for SM6375
Message-ID: <5qd74wbiyytgcn3k726jykm37ctahi4yd26vvhqea2rmcv6m6b@v7kcfhu3fyy3>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
References: <20241202-rpmpd-sm6375-v1-1-12a4f0182133@fairphone.com>
 <yo5cc3cvvwwdrqrrgwlquztj52sijip3ffyyqag55jrnztxi2m@hn75ylkhnxie>
 <D61WIF2XWKL8.MWU6PK2XGX4F@fairphone.com>
 <eovguha2tvc3rxd72yfqxgcg37waokoyqs377kvwmtdgssi4no@ii3i2bvl675i>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eovguha2tvc3rxd72yfqxgcg37waokoyqs377kvwmtdgssi4no@ii3i2bvl675i>

On 2024-12-03 13:58:51, Marijn Suijten wrote:
> On 2024-12-03 08:52:59, Luca Weiss wrote:
> > On Mon Dec 2, 2024 at 9:00 PM CET, Dmitry Baryshkov wrote:
> > > On Mon, Dec 02, 2024 at 04:45:02PM +0100, Luca Weiss wrote:
> > > > During an earlier commit, the comment from SM6350 was copied without
> > > > modifying. Adjust the comment to reflect the defines.
> > > > 
> > > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > >
> > > Fixes tag, please.
> > 
> > I thought for just a comment fix it's not necessary / desired.
> 
> Makes one wonder why the SoC name is repeated in a comment in the first place,
> when it is already in every named constant and the containing filename too.
> That's only prone to errors as you've demonstrated here, requiring a separate
> commit and discussion (and automatic backporting via Fixes:) to patch up, while
> it already wasn't relevant/useful for anyone.

Never mind, the filename isn't different, I glanced over too quickly.

In that case the repeat is still somewhat relevant as a separator between all
the SoC-specific defines in this file, even if the #define repeats it as well?

Apologies for the noise.

> 
> Less is more.
> 
> - Marijn
> 
> PS: That's a suggestion to see if we can perhaps remove these from all header
> files instead to save the copy-paste burden in the future?
> 
> > 
> > Anyways:
> > 
> > Fixes: 2d48e6ea3080 ("dt-bindings: power: rpmpd: Add SM6375 power domains")
> > 
> > 
> > >
> > > > ---
> > > >  include/dt-bindings/power/qcom-rpmpd.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> > > > index df599bf462207267a412eac8e01634189a696a59..d9b7bac309537cbfd2488e7d4fe21d195c919ef5 100644
> > > > --- a/include/dt-bindings/power/qcom-rpmpd.h
> > > > +++ b/include/dt-bindings/power/qcom-rpmpd.h
> > > > @@ -65,7 +65,7 @@
> > > >  #define SM6350_MSS	4
> > > >  #define SM6350_MX	5
> > > >  
> > > > -/* SM6350 Power Domain Indexes */
> > > > +/* SM6375 Power Domain Indexes */
> > > >  #define SM6375_VDDCX		0
> > > >  #define SM6375_VDDCX_AO	1
> > > >  #define SM6375_VDDCX_VFL	2
> > > > 
> > > > ---
> > > > base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> > > > change-id: 20241202-rpmpd-sm6375-06582e126d7f
> > > > 
> > > > Best regards,
> > > > -- 
> > > > Luca Weiss <luca.weiss@fairphone.com>
> > > > 
> > 
