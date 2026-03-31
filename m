Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314BE3F9F42
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 19:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986211; cv=none; b=GUO86Jgw+BmLp3lgrFpoKqlQd0Vy8qrep4qhtTLPdsRmpibWOqVWtIfaNgF/R6BjA1iiBH/JJvY2uNv9nQLvZd9BJhu4VHVh38tYOt8lqYnNoqz5pGmI7VXRiVbhxF5U6z1vGBvpEwFPt1N1RmyASU8sfB7V5jbMOgVFs/81D0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986211; c=relaxed/simple;
	bh=/MNqRrFHFC2WqhLreC+/2rydPkjQ8ipbpo3qxRn9Epk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjw+9Cwkie1D3Vj+v1BDOoIcrxszQIYnQxukM6gwlInM+p/H5J9s86Im3aAtIydFXnpsRSuHtmn2pWWsRmXOOElQFBLDlz2iY2CWHquLJ+IosCzyd0K7YMpU4PhIc1PEHPq5wDOnfebnl+4qTdN2UE3nAq20dtCcXHB6/C/qbnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbIDyqoK; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbIDyqoK"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6501d32b04bso5239353d50.2
        for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 12:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986209; x=1775591009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7dMNu0l7hZLwXtDpNqW37ilehWYmKAByHIWOjqdmC4k=;
        b=qbIDyqoKT/zjFjdqaPelWJjQdNwVr/BgpU7jODjzLaGZ0chGs7Z3peB389VMRUeDEh
         kyfQ3ivBZSZ9X0501Stobg44I2MNAO75qVhnkZ7ILHoyDLSazQp2HxErzIeJe/zUjbgV
         t9Zww/InlgiruLPs9azT7MxQCP2Ir00cbHmtG2bG53vw5MtmHyJSl1LtXCU8iopDMhZx
         /u1eK/Qj1RV6JrYW1T3HLfEI6F6/JhUVUZVHRSVmooHnTudV5XmvZJ9RgwHQyiQMiGSi
         oXG8lv3Ggih/bsGfYpLrB2XXLYFIlKuJAsfMZW21CNLDHKUweZprcK1G1rze57+ndExk
         AgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986209; x=1775591009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dMNu0l7hZLwXtDpNqW37ilehWYmKAByHIWOjqdmC4k=;
        b=nYpLhqpdwIkWnV/oCGxvnU1+/b4QSeGDDPAHoN0cYrl0HQsNwtXcc9320kOM/N2xYJ
         r/cOBnK5+zVCbS3xbSFkz0EUsoujnEmrkkDg2Um41v0+Y0XLfTCDKxPTSZlZ5mPM0toY
         R1L+lwQK8vLEzwVMQf1ohZbJx4ad5IN9NQ1OsRWVywccJHbD138VBMsajIFqUQ/WmOE9
         00E+Q3evWPV1SMZ/oLSSLtfgvC1IHIEEZT0xpS0XSWy3+4hisLYzaBFQqwbLkXUtSYLv
         6QurQlXVmOXkgey1S746LP+rDaUKeMn996CtvIz5/0YoItngo561417b213rDNdEpar1
         v5yw==
X-Forwarded-Encrypted: i=1; AJvYcCVW3ZnY8C3HhXW0OPTSUTJ0VaFiNb4ajg9oUOKMZ5o9vdY+0kFpF3zclRpMT+LvJw5c92A0VTq574M5+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQEQOogHtyxY5MTKmd2/ziBYAm+VGkHyY5M/gq19PwXI4CcZBl
	VILLTcLU9LgvdouEq+4OmGPB4lARL9kwpNSpoFgkb8oLe3ksu12LugiD
X-Gm-Gg: ATEYQzwxsLB+K6nyZgWAU1BdeZ1ZVhaw/cvEyscRiPhu/GdJoek5ppO9mstfn3hrYcq
	cQ3X6Z6U7E2OEcCkRmGD4nRRIWIN6gj1fe+6XuWxJYc2AYjQLiLZgXaReblPcSLYfcVhQawHaBq
	i+IwgU+FubfGqkm6otAm9nyYsA527zXCnh3RtiwMhG/ZW0euJuLH7Y2vnAHpCajm4t9KagP1Yex
	vPG2Vmm+oJ5b6Em+Ul/zKQTvZ3ZplcUrSJako9kDeUUKlSUHg4/26xC/nfb7mP/Ro33PpQh6GET
	1TC4xAmiT17DsDSao/uTPjiW1BCsdcIP5nmOmLZFlLNLyGypySHsjvEh9EyhTxxpOCF2OsVHdbu
	+rw7FqpplRxrqyw99iBLN7M/kzNToRWggkVyCheBHLpwgNf7trgRjfy69e+4pUOgIuL5IntU3SI
	jtwayrosHOgwGidySpwAXbWIvj8Rjh9mDhI/s=
X-Received: by 2002:a05:690c:38a:b0:79a:c7f8:d9a0 with SMTP id 00721157ae682-7a211e4ea2amr8562427b3.33.1774986209251;
        Tue, 31 Mar 2026 12:43:29 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79cb7135d8asm53647957b3.4.2026.03.31.12.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:43:28 -0700 (PDT)
Date: Tue, 31 Mar 2026 15:44:12 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: David Heidelberg <david@ixit.cz>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Robert Mader <robert.mader@collabora.com>,
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v9 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <acwkDD7XsjMGucQ9@rdacayan>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-8-mailingradian@gmail.com>
 <1349f725-a20f-4935-a829-208c8e583ad9@ixit.cz>
 <acHxgIsyPiQTeqCB@rdacayan>
 <eff25adf-c5fd-484d-a9ae-ec27c0d9c100@ixit.cz>
 <acJuN_FRqMTGgl8C@kekkonen.localdomain>
 <acsjH0tZ-jj7N7c5@rdacayan>
 <actxn5kvN3auqCBm@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <actxn5kvN3auqCBm@kekkonen.localdomain>

On Tue, Mar 31, 2026 at 10:02:55AM +0300, Sakari Ailus wrote:
> On Mon, Mar 30, 2026 at 09:27:59PM -0400, Richard Acayan wrote:
> > On Tue, Mar 24, 2026 at 12:57:59PM +0200, Sakari Ailus wrote:
> > > Hi David, Richard,
> > > 
> > > On Tue, Mar 24, 2026 at 10:35:24AM +0100, David Heidelberg wrote:
> > > > 
> > > > 
> > > > On 24/03/2026 03:05, Richard Acayan wrote:
> > > > > On Fri, Mar 13, 2026 at 07:26:47PM +0100, David Heidelberg wrote:
> > > > > > On 17/02/2026 01:27, Richard Acayan wrote:
> > > > > > [...]
> > > > > > 
> > > > > > > +&cci_i2c1 {
> > > > > > > +	camera@1a {
> > > > > > > +		compatible = "sony,imx355";
> > > > > > > +		reg = <0x1a>;
> > > > > > > +
> > > > > > > +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > > > > > > +
> > > > > > > +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > > > > > > +		assigned-clock-rates = <19200000>;
> > > > > > 
> > > > > > Extract from #sdm670-mainline:erebion.eu discussion:
> > > > > > The imx355 can operate on 24 MHz (on both Pixel 3 and 3a), but Linux kernel
> > > > > > driver can operate only with 19.2 MHz.
> > > > > > 
> > > > > > I assume it would be worth it mention at least by comment here.
> > > > > 
> > > > > This might set the series back because the devicetree isn't meant to be
> > > > > written for specific software, but it's included in v11 because you
> > > > > already asked twice.
> > > > > 
> > > > 
> > > > I would say node with lower clock frequency is still much better than
> > > > nothing or placeholder saying "i2c camera here". Instead we'll have small
> > > > placeholder that value can be bumped to 24 MHz. Important is this can be
> > > > easily improved when at least one consumer of the device-tree gains support.
> > > > 
> > > > We have very scarce support of cameras on mobile phones in mainline, thus
> > > > leaving a comment that HW can do 24 MHz is reasonable compromise IMHO.
> > > 
> > > The bindings could document the supported frequency range.
> > > 
> > > In DTS it may make sense to set the frequency the vendor uses as it may
> > > affect the link frequencies (albeit I guess they're the same in this
> > > case?).
> > 
> > Is this review relevant to v11?
> 
> I'd think so: it doesn't mention the frequency should be 24 MHz.

Ok, please check the dts comment in v12 when I send it and continue there.
