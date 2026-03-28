Received: from mail-24431.protonmail.ch (mail-24431.protonmail.ch [109.224.244.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603E134FF46
	for <phone-devel@vger.kernel.org>; Sat, 28 Mar 2026 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774719070; cv=none; b=obsKcgnt6DK40WoAqft6OBs30wu/1GCZEXF68z4eoUeHxA1VIjyMN07T4hexAMaVRKRysoSAyOvQ17GRl6/cs3RIl+I8dHDaiR397HWWq7/d06bvTkpI9bDVc8pExbXCZxuO36De+vLAOfGZEYJeHErudG22HZ85nJQwwJ/EJuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774719070; c=relaxed/simple;
	bh=0ez/HeqjP2d++NPPugrN+b9Byj3675ZLl57i5U+g6q0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lvb/m+cKISg0q8989G1a208ZGKwuUJQS1x4z7xO0djD9sAwuB6HA4r1OOy1gC2s7TabiS+IfwygekeaD+QsTNQqDI9+G+Q6FMdh9afG4T0Jil+Hxdqjs4UNJ6AdHpUFWDpze0jk8n7aBxybqazWxMbyU0PEOsCUEbApQiRDWz3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=JYXx2ugx; arc=none smtp.client-ip=109.224.244.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="JYXx2ugx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1774719059; x=1774978259;
	bh=sgqrW4vue2YRH/11cpwfBbkabMPf+9TeMN7abNY/hXQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JYXx2ugxoLBqIhcply1iBLXBWtiOGWnNv8TPcXKMqbK0dTiKIhPDiY4fuMniIzG0c
	 DgcG4PxASDHkVW+RCVWk1GlERuVPiwQH3xVFSHB2bS5oj6/LKbvTPgInk6MZjj08+s
	 53RJcD5kY/AwH6oCXofd2azsDtu+4m/m0L+IpTfD6gZrrhTRrfhvhL/vV3Awwtnxks
	 Kiyfc7ZgE8ASj4btj4yHWeM40sFaUhE1vfH8ZsAca2dhXeLw8DfEgrwkN3rs8jkBq0
	 N9USWcLMelB9iPxGrLYHaR7DvhfOBjnhydzrUol06o/2kkHkQxIdpTxr6DC0lhzOxi
	 GnbAJTbZVDiew==
Date: Sat, 28 Mar 2026 17:30:53 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
Message-ID: <O7THc5h8ZhgzNpklYKTGOnEZKlN4BtHZHjKZt2KErekNb3E-hizt2dw7xuJ8G6giEyivmvC0f6-eIfCT6fJkUA7_CVQwhAktCXfBqAVV_Zo=@protonmail.com>
In-Reply-To: <us3ps4bgf5ekk2iudcgs2wa4b5qd4mzokec4q55pmhb6kvt6ht@qm4mmzdai2t2>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com> <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com> <us3ps4bgf5ekk2iudcgs2wa4b5qd4mzokec4q55pmhb6kvt6ht@qm4mmzdai2t2>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: cf18d05c5f1d325076efcda785cfdd467cb230d9
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, March 27th, 2026 at 23:57, Dmitry Baryshkov <dmitry.baryshkov@os=
s.qualcomm.com> wrote:

> On Fri, Mar 27, 2026 at 03:30:49PM +0100, Cristian Cozzolino via B4 Relay=
 wrote:
> > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> >
> > Add the description for the display panel found on this phone.
> > And with this done we can also enable the GPU and set the zap shader
> > firmware path.
> >
> > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > ---
> >  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 73 ++++++++++++++=
++++++++
> >  1 file changed, 73 insertions(+)
> >
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I wonder if I should, instead, edit the compatible property by adding a=20
second string (for the fallback), like this:

compatible =3D "flipkart,rimob-panel-nt35532-cs", "novatek,nt35532";

and, therefore, add "novatek,nt35532" string also to (patch 1/6)'s=20
bindings example. Let me know what you think.

Thanks,

Cristian.

> --
> With best wishes
> Dmitry
> 
