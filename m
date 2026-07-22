Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE4230F92E;
	Wed, 22 Jul 2026 00:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784679630; cv=none; b=cVutNI72WnacvZLjogUjPsENrF/uXiJOoEunGv2tl1muD+70C0hvz4YPosUcp16jcSlDOXxGNQJO0Aw1AQh6rhXC/JVh6DqA08LzBPf6mndOh6p5x0VqoNBfh1Mev37mGPPk4xB7jVkhtMaJcR33UFaK3ugZhFKMNOQXou1BGk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784679630; c=relaxed/simple;
	bh=unF5Uaa9ZTeyd0Kwkv0mOhsPHEUxmYwOn+gAEV/HIiI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7LEnEpB097MIN7H2QQKbHTIaXgNfbtMoM57GlomMXMxuCXR+ZBAiDmW+12yvITK8QG+0IB4dgXIfAVhze6JFeUC6sOhXVwFgbpXu4Al/+FZjDJhGFjOSMfMmtra7OwW9Q9QfeaCNv4/l5B5slepXT3qmdTY6V58qLhemVkjLMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Sp54rczB; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Sp54rczB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1784679620; x=1784938820;
	bh=unF5Uaa9ZTeyd0Kwkv0mOhsPHEUxmYwOn+gAEV/HIiI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Sp54rczBoWPcwqqcVawTUHcu6mlG4PVmIW+gGKTADmS1+1fpiw29GUx50a99ud3LH
	 JBS4kXOZ6olNl/kuX2bYp3DIycWuzPtN1f5bRkCPcowLrSVY+BjBwbvnQpyAOW7GAd
	 N2JrPOTJ8LLzThA8WfMVTNX6qHep/qGELOAW/aM3CslMt7m0VRUT+hlzghMPPIcfaq
	 sod3FFOK1ml+CZwNCiSRkpoDLG4HpJros0lUau2CukZXAEwgvoMNb0UGP73NlnsJLG
	 sdx0DLkCvoXbZy1H0SKm2YXCmm8mW5/B+e9DdPyeLpxGlOtsUj3mj1M3p7CtXIgEcu
	 ZXXlUx5sUqx2w==
Date: Wed, 22 Jul 2026 00:20:14 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-pcie: Add pcs_lane1 offset to V5 offsets
Message-ID: <e317c50b-287a-4e78-b045-3ca723c1fbbf@proton.me>
In-Reply-To: <vnqbthpnjfgwm3bsp3lysfhugxfljd3cictjmwvn4kuavytvmt@lwkhsuydhamk>
References: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me> <20260715-sm8475-bup-pcie-v2-2-48bd91a19abf@proton.me> <vnqbthpnjfgwm3bsp3lysfhugxfljd3cictjmwvn4kuavytvmt@lwkhsuydhamk>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: acce97e3e67ec2402053c1223b98d9eee3a4faae
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/21/26 6:51 PM, Dmitry Baryshkov wrote:
> Fixes: 0fd0b31965b0 ("phy: qualcomm: qmp-pcie: add support for SAR2130P")
Thanks for adding Fixes :D
I did see that SAR2130P also specifies pcs_lane1 but kind of forgot
about it...

Regards,
Esteban

