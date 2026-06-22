Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67A5375ABD
	for <phone-devel@vger.kernel.org>; Mon, 22 Jun 2026 15:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141536; cv=none; b=bepX1qz3x8Dwg2HO5d7Olyi3hVSKRoXhNRqYqPsICS1ZOkIdILdq4lYOROedvNmacDwKKv6Uex9mLs05Ew8pHF7BCb3i8T3g10f3yp10bdi0vcHM0YmVCz+GJlM58lMqFYV7FupkVvtyq9UUFtjBXfgGWz0T3bMEY/4f6Kv7Jes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141536; c=relaxed/simple;
	bh=eO98CC1dq9xwepVqr0m1in8xGU1uGdR/vd48GlAlx/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KViKtTvaKgMpo/o2Kn3aj83CUN49JQXZW4beN0QR1t7c/Ih5b3XKZj9WIisjH3+C/xXiw1GQEH27kkjUo+mAsoeAGwEbkxOKyVLC96sIKsCyiZxUXXDiMU13I3dMzmg160HmD6GoDwaGU0ZwjAdq9ebG+y5R0dSdsCnv8xuI/fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6QUJmDR; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6QUJmDR"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-517583cb07aso46895541cf.2
        for <phone-devel@vger.kernel.org>; Mon, 22 Jun 2026 08:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782141534; x=1782746334; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S/6cLw2+muN50gac7bA2Xzn5QQf7rCJUO16TP8tP150=;
        b=e6QUJmDRHXFIReAbVdxh3LMsnkhSYcpTYjyzw4EKufchmN1f+yqYpFIqP8qA50xnXf
         FeMi6ehYMZgFfC/R7W2CWcCeGgZ/7r8yeOxz+G8RWmd1zgJY9a/6Thv4KBe4bQwHiITy
         +9hmVDtkLIwIXttnoGguXAgFagIwrpfOi2kj6f3Bv0BkOwxRFaE3c3C0tXAeAIP57kBx
         nS1hhTzz4fmxhjhyzrwHVj6eRZ1GMcxupjzaeBW6iMIxGHnxlRKS/T47WTZkYFhCPxoL
         ZNTOlE+IgywElLSh8gJF7v1bO6g1gSgFUn90/jGdhgu3lYd4Fl/enwjyqrSphxw8lzqO
         qlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141534; x=1782746334;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/6cLw2+muN50gac7bA2Xzn5QQf7rCJUO16TP8tP150=;
        b=IUD3UnntrgQ2MysU5+NE9lZRPbceTPzDEwdpekWVslqpnrQkZZPF0u6BMJDOTlI4WS
         OqTO9YJuf1aMZRCB2Ub7i3e9vBi19Qog7A/q8YkcrKWu07ALIXnhOzaQajzhbJYCPkPY
         2I8Yhnr+Mzmz+KN4c2oVXeby/3f+iI+6alAtrZIBtxRPKRly/3QyvwWCRNZDGhaPQDlP
         66i8NrCimf9sDchc6prSVYA7un51ZN0uCYDj1AZySyRsEA9+Syln/0/bD6sjY5vyr85C
         eYImY9/28Wdn6/o6qUnwKj9uEzXSeKqpbHUIMF/JLzKQNA8LxKL8wfKvVP7kB1tAe1mV
         Yc2Q==
X-Forwarded-Encrypted: i=1; AFNElJ91qL1sqrl1vXDTYPyUQbt3Y7obcAp+KpysfNZn60FiAroAhfORufrPpTqeiBczOFj0LJPEnsZ55XBggg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwJ3X3xmsz2UxMUsumsCxj+3rfA78DYcI3c8Ft64dqztjOGXja
	suRmL9Bm2cQpUUQx1jdrQQQv8nDcQ4MOVbFtmjjYg9uGTKG1DBUN/jlD
X-Gm-Gg: AfdE7clunGUdCZlVzuz4TXjdKzIkMEBFtKOaEk3QNOTol+YmCalbw1nfiw8F1kZG5nU
	RBwHEHq4m3vcFAnmwCyCJDkPvs3OLQFpg32Yofbg9bf/A6xbZnf11sP0wvkxbzFW/BEX396ZEsj
	kB0qNhOWHrBDF8zd+K1X4rCJ7W0QDJIBgQI7IOKl8EKtxWVEYJvwYs4AREezCm+FZ3F02sg1R5w
	9TtHmo9w6mvK8kv7eTRWEhwLubNf+fUbVhCCRQOw57oSrpKBK2Vm/osSC52w78xJX0AH376+95a
	Lnx2X+GgLTuqynvhkXkK6qhBxw2nYw/MLeROtbpfedgDjZGyio7IqZ2fM5UILXZRUDSpjVabpmm
	AzPy5cFYm2CahpY+m669atMCjJ60ahY2EDNTvYDKyBH2SqmzQrCaetaYCHKgCJKeH2bOR1x8OmZ
	8prYYjdLVAVaXo0l/P
X-Received: by 2002:a05:622a:5c1b:b0:516:dcfc:ebc3 with SMTP id d75a77b69052e-519e4c27793mr220029711cf.30.1782141533547;
        Mon, 22 Jun 2026 08:18:53 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a0989f0a8sm70034291cf.22.2026.06.22.08.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:18:52 -0700 (PDT)
Date: Mon, 22 Jun 2026 11:18:51 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH QUESTION] ASoC: qcom: sdm845: use DSP_A format for TDM
 codec DAIs
Message-ID: <ajlSW1NYc5qh1bL1@rdacayan>
References: <20260613-rfc-dsp-b-to-a-v1-1-7d095fe90a05@ixit.cz>
 <ai3tafRfEgN938cu@sirena.co.uk>
 <5f262a04-8e92-4ac1-bd7c-1246231d3de2@ixit.cz>
 <7f94caa0-48ba-46f3-922e-f16e39fd22c9@kernel.org>
 <357aee62-78ec-4ee3-afb8-5be3ffe70cbd@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <357aee62-78ec-4ee3-afb8-5be3ffe70cbd@ixit.cz>

On Sun, Jun 21, 2026 at 05:54:17PM +0200, David Heidelberg wrote:
> On 14/06/2026 23:40, Srinivas Kandagatla wrote:
> > On 6/14/26 8:26 AM, David Heidelberg wrote:
> > > On 14/06/2026 01:53, Mark Brown wrote:
> > > > On Sat, Jun 13, 2026 at 09:55:59PM +0200, David Heidelberg via B4
> > > > Relay wrote:
> > > > 
> > > > > Currently this worked only because the cs35l36
> > > > > codec mapped both DSP_A and DSP_B to the same hardware register value
> > > > > (asp_fmt = 0), which is inherently DSP_A timing.
> > > > 
> > > > > The CPU-side AFE is configured with qcom,tdm-data-delay = <1> which

No I don't think so, this devicetree property has no effect in
sound/soc/qcom/qdsp6/q6afe-dai.c.

For the Pixel 3a, it only mattered with the RT5514 codec.

> > > > > produces DSP_A framing.
> > > > > The codec format should match what is actually on the wire.
> > > > 
> > > > > So I'm pretty lost if I should go fixing cs35l36 or sdm845.c.
> > > > 
> > > > That sounds like both.  The Cirrus driver is definitely buggy if it's
> > > > mapping DSP A and B to the same register value, at least one of those is
> > > > wrong.
> > > 
> > > I need to clarify. The CS35L36 supports by default only DSP_A, but when
> > > extended to "take DSP_B", speaker just works.
> > > 
> > > This was done previously.
> > > 
> > > Since there isn't any different configuration on the codec side when
> > > added DSP_B into same codepath as DSP_A, I would assume QCOM ASoC send
> > > DSP_A, just marking it as DSP_B ?
> > 
> > 
> > 		qcom,tdm-sync-mode = <0>;
> > 		qcom,tdm-sync-src = <1>;
> > sets the short sync with 1 clk delay making it DSP_A.
> > 
> > for DSP_B you would need, no delay.
> 
> Sure, does that mean the sdm845.c is currently correctly setting
> SND_SOC_DAIFMT_DSP_B there? or there is some missing part of logic deciding
> it?
> 
> Because the reason audio works when I convince driver either:
> 
> a) sdm845 ASoC it uses BSP_A instead of B ... or
> b) cs35l36 it uses BSP_B instead of A
> 
> implies to me, that:
>  1. both devices are setting the HW to either BSP_A or BSP_B mode (just
> don't know which one)
>  2. but the driver flag for ASoC or codec we setting on the driver side is wrong
> 
> If one side really used BSP_A and other BSP_B, the audio should be at best
> heavily distorted, right?
> 
> Please correct me, if I misunderstood or if there is nice doc I could read about it.
> 
> Thanks
> David
> 
> P.S. I did quick search what close-to-mainline repo has for Pixel 3a to
> reach working audio and it's slightly different, see [1]. There isn't any
> change done to the cs35l36 driver in the sdm670 tree.

I just assumed DSP_A and DSP_B were codec-specific.

> [1] https://gitlab.com/sdm670-mainline/linux/-/commit/9eba5aa993f5fb7b4bf5cc936ec22852987d3f9f
