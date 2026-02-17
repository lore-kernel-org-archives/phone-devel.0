Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7068432B9AA
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 10:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771325857; cv=none; b=VhDZyHdFUJho58LjiF/u2lRiqd3unpSKtVxgY7dC6L3exOWqtIrb9mS7Rp5iS+j98FsN8sm1ZWMt+n7v5fb0lp614iVMnaxc/DZiW2b1XtYuxeEPR+B+/rYtEz36mqacfDTtoABNpIgQtHbQ1oZZchPWhiF1sN90g6GW5042IHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771325857; c=relaxed/simple;
	bh=REGFjkcffipwdKlQ7pGtUBYDl92kT1OgIwJ49Cz8wX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjhMJI21jjH3JPpErwayLIQ+SLEigSmyar1M3CKPUoOxE76/Z3mQCjDmRZWC/44o7hKtAYOhY7hhWa63boACIehbzCvQcZ/tZpKZ4b2OVsKMvAiYO6PxPOoBRWGiRoBPoFmWH3fMgrNy4TCXWRjf238VUxpMqUnFDqw9ANDvTLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=fG7Fmm7x; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="fG7Fmm7x"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 7F80B240029
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 11:57:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1771325854; bh=WjEAONbqKhtNPEln7kFmg187W3/y5QE23p/PgaD44gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:From;
	b=fG7Fmm7xiauQ/N0l2G1QHal+l3NLxLP2WE5yRLpD1UNOym3q94YUCOBcm196BUMg/
	 qqalCB5b8v1BwfefEoNlrcu9UatacOXntFpp/3fV7HvqflIndtYK1kbrGiuPwZ+AD4
	 HSslSrIlbiiR74nt7QAkHsIoReilANxl8gp5zj8BrTdX1ll+QW38GfoH6Bw+sQBaDB
	 1yeiBS3/r4vyqSAQTfyKaMywefoF+4Uy9S3ki52rHlqsazHFNdTSRMMwWTOdgaD9lF
	 qJMiNtGLVs+dn49mVm0sjGL6fj0Zop2wC0uSH90XPDQhRWHw24ELjbD0VMPAD4eeT1
	 fw+LXxYAh1j1g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fFc6h4ysvz6v0T;
	Tue, 17 Feb 2026 11:57:32 +0100 (CET)
Date: Tue, 17 Feb 2026 10:57:33 +0000
From: Paul Adam <adamp@posteo.de>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add initial
 devicetree
Message-ID: <aZRJb6FVi6B-fgWF@MyryksLaptop>
References: <20260215-wiko-chuppito-v1-0-9ee6b89606a0@posteo.de>
 <20260215-wiko-chuppito-v1-3-9ee6b89606a0@posteo.de>
 <f5517032-202b-4ae5-a8bb-928144cc5771@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5517032-202b-4ae5-a8bb-928144cc5771@oss.qualcomm.com>

On 26/02/16 12:18, Konrad Dybcio wrote:
> Hello, just a couple comments below

Thanks for the feedback!

> > +// make sure gcc is probed with display disabled.
> > +&gcc {
> > +	clocks = <&xo_board>, <&sleep_clk>, <0>, <0>, <0>, <0>, <0>;
> > +};
> 
> Do things break if you remove this line?

I tested it without and it still works. I just included it because
it was on the pmos msm8916 mainlining wiki page. 

 
> > +
> > +&gpu {
> > +	status = "okay";
> > +};
> > +
> > +&mdss {
> > +	status = "okay";
> > +};
> > +
> > +&mpss_mem {
> > +	reg = <0x0 0x86800000 0x0 0x5600000>;
> > +};
> > +
> > +&pm8916_l6 {
> > +	regulator-always-on;
> 
> Is there a reason for this?

I removed the always-on property, it was for testing purposes.
mpss_mem is needed for audio to work.
I removed mdss since it is only needed for the panel.
Should the gpu only be enabled when the panel is added?


Also should I wait some time for additional comments or immediatly
send a new version when all remarks are addressed?

Paul

