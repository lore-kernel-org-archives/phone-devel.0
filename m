Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F37379ED4
	for <phone-devel@vger.kernel.org>; Wed,  4 Mar 2026 22:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772662485; cv=none; b=dYRepkVq0JwfcIWXpCaMUS0FQh4UYCuLwAVHUAQA98pvyKeuiLoOstI5E8wy28+7xJPi/M+Ggb1d6Z0Moik6iQgvTzaZUcy2DD+94EFDtxAKaR0goVDd1LHi9G2btqwPm+pSB0uCpTgHHCIMjoMX66MqNkebli9N0rLVoH7xILk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772662485; c=relaxed/simple;
	bh=JmMXkK+pLB2Bo1YGTHUwtHtIJTZMiA8prpH5Y/2aOjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVYGQVctOaJ18yrFHmOME3sFuaN9ToV/3KGTcu+7XUmSDRUuLHAtDTRb9Rv88utDTInwEIzbW4CNYUZhs5CrGCtXmTzZ0x4p4ubklMnF6dcwwpoxfbnP+Sej1QMQoNMIhx6PSrIySISDCpnx6f1VPovkdedK6gSGNZ826ygcQ2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=lQhArVQa; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="lQhArVQa"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 5509A240027
	for <phone-devel@vger.kernel.org>; Wed,  4 Mar 2026 23:14:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1772662481; bh=AygycHmKMmUEErxEv++3db/RN2PgXbdgG0QAnKwV848=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:From;
	b=lQhArVQaT2AiSmCNtPaomel7gxESCcjL6XkZ8Cqa81dzQDRhl8+9/6iS/fxPtlYrB
	 e4DJkxUAZVD/PziEESlHwFPHRlxo+9RooLJUB/a/2xupxjbN3aL32T/WWs5scCRuVL
	 MEk7sC2LlUghXNywPANYWpT3y0S1Mj5uIJLN7ibn9pOa5zwhD/insimOtFoqfO77g3
	 Zfp14J7mn0/vLBOu0laOFSK+n1QdvP1nL2Xcvxz5JQwN+rU1XDm0TCJWkIEUUrgaKD
	 /jIOLmv/aovFXUW/+ME+MCO7e/hHwbjFPOpXGU9Z2eGovbDLS64KKfHGAjMLpC1x4s
	 N0TIGe35iamYg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fR6R34wK6z6tsb;
	Wed,  4 Mar 2026 23:14:39 +0100 (CET)
Date: Wed, 04 Mar 2026 22:14:40 +0000
From: Paul Adam <adamp@posteo.de>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
Message-ID: <aaiuzCWHegpJMCVj@MyryksLaptop>
References: <20260301-wiko-chuppito-v3-0-9b36a2a7aed5@posteo.de>
 <20260301-wiko-chuppito-v3-3-9b36a2a7aed5@posteo.de>
 <9ffc0460-e394-4f18-aed2-ad8a0b3d1b8f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ffc0460-e394-4f18-aed2-ad8a0b3d1b8f@oss.qualcomm.com>

On 26/03/02 12:08, Konrad Dybcio wrote:
> On 3/1/26 11:29 PM, Paul Adam via B4 Relay wrote:
> > From: Paul Adam <adamp@posteo.de>
> > 
> > Add an initial device tree for Wiko PULP 4G.
> > Includes support for:
> > - UART
> > - USB (no OTG)
> > - Internal storage
> > - MicroSD
> > - Volume keys + Power button
> > - Touchscreen
> > - Backlight
> > - Accelerometer: Invensense MPU6880
> > - Magnetometer: Asahi Kasei AK09911
> > - Hall sensor: Rohm BU52021HFV
> > - Proximity sensor
> > - Vibrator
> > - Earpiece
> > - Microphone 1
> > - Headphones
> > - Wifi
> > - Bluetooth
> > - GPU
> > 
> > Signed-off-by: Paul Adam <adamp@posteo.de>
> > ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Thanks for reviewing!

I assume I resend this once more with your tag added?
Also is there anything else I need to do, if I don't receive further
suggestions?

Paul
