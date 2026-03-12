Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F6629A2;
	Thu, 12 Mar 2026 07:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773300950; cv=none; b=rPGEleC6hrASi/ROXqGkrjekAS49DKbIudnIZZCzHGys+1zj/TiLrAul2xIoYGeEwVxAvD7ULO22MMbPzHA9SbSk+PfeU+EWPELnPkKmZ4LSLzVTqvBjRHyjCo0iT+GYhP3o4wBTTHCKXZX6dJKZTyNBMH0v5kZTLX1NH37X10U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773300950; c=relaxed/simple;
	bh=n22ZdnCiNz1FqB7pAYtwypL6C/yoAP2gROmFXtvKlKk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FFOt/pm3HWPgh43P+uyNFZyh0SuAbEB8cnYewUSAvgTVG+7whTITSktJUwUQkikvy80WDVkGM3yuAz7N5HJeK16XKmuq+wQQ9eSIMq2E0TG/4+3Pg2UtVMMzEJ8DJZTBCvmd6qWWZMIYpySdh9G7nEtJKu54xcjjVOzy3r6zlWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=SKKLHEjC; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="SKKLHEjC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773300939; x=1773560139;
	bh=W4fSxbreWSN8hJqz6ykGJtj382cjYeRiSHXDVM35kNY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SKKLHEjCwvhBxSV0RlMIqdcQ+OyzgiHq85MbOuoYElqLaDQLdSoCHNrMO/5Etsxx4
	 jdUDwRq6/cSGir3QzIV+bPMDnZIE1+L34GiPBLoioQL5TdvBv4qICNaMwKVasWGabe
	 NTC3ocNEGl2pM/WBeo8Q9KvOVaVKD9ywJigwJUtR2OuHE9sx/6TkqD1Lk8cZV8baQ7
	 EKt9Gx7TrQFKT6xiYVvVMVXUUX3KYXLY6AeCXv7O4Xbkths4zv4+MU4aEVONaJ4Oty
	 DmkDiqYUt6a8uBP5KfZmPQE5Aibn/zjOf+SGtuCUJFTt2HGoCnfa0PAkWAijRMgwxN
	 wEvz1LUxTNBUQ==
Date: Thu, 12 Mar 2026 07:35:32 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable touchscreen
Message-ID: <OlPwFMhd0APrPSzuNA5HLquFco9civ4jOCF8caWC3eRMSAZq1AcFdFBhrT5o2-kyjAzeUEqT_ZSvtYRdaeoyrzt-0EgjKJ6eRsumlPTU2s0=@protonmail.com>
In-Reply-To: <1ca4cdaf-d8f7-43c5-9087-b0394036c461@oss.qualcomm.com>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com> <20260308-rimob-new-features-v1-5-aa2c330572c0@protonmail.com> <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com> <zqVKBYSFu9Qsyz7CKpxCBliYAzh1QjVqyTi24YLuiZy_muAh81pAHgkTWsEaAJsRbMlG_UewopTzYleJCypPrbukpTaBZSpuBtmG5QIKMPs=@protonmail.com> <1ca4cdaf-d8f7-43c5-9087-b0394036c461@oss.qualcomm.com>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 3b1689991cc4bee5e0359733a34ed752bfaa4c1c
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, March 11th, 2026 at 14:03, Konrad Dybcio <konrad.dybcio@oss.q=
ualcomm.com> wrote:
> >
> >> does /proc/interrupts differ?
> >
> > When interrupts-extended is defined:
> >
> > ...
> >  50:        318          0          0          0          0          0 =
         0          0  msmgpio  65 Edge      gt5688
> > ...
> >  54:       3141          0          0          0          0          0 =
         0          0 GIC-0  65 Level     gpu-irq
> > ...
> >
> > Instead, when interrupts-extended is removed/commented out, I see just:
> >
> > ...
> >  53:       2404          0          0          0          0          0 =
         0          0 GIC-0  65 Level     gpu-irq
> > ...
>=20
> Hm, that's odd - I don't see the irq handler being registered anywhere,
> or anything requesting that name. Do you have out-of-tree changes to that
> driver?

Tested on linux-next without changes to goodix.c.

> Konrad
> 
