Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030CB3081D6;
	Wed, 22 Jul 2026 00:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784679521; cv=none; b=g/TZBR5AgHWGvWXHPYZfbgkeCz+du0kxyetaH31PWDCc628zQbXiXxzxW/YzPODZ9OlKII5JAyJXEKevnl90LFRgfnDSgig13lY/UsAnJDYvbG9KhDjZ/iF6m+8fxe2w4RzphoGHlZW0YjSlSpmjAnpfn8Tq+mM7pDJg0Xk6Mpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784679521; c=relaxed/simple;
	bh=ESCbHAC87pVZ9GxAP9Y0O7y7wFinp8StEXwhRPVGMlg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qa9E7O9/JwkT6+G58Qg3dOEvT1k1eaOGvav+eZhGTp7rj+vTkpmaYR+AIkW0owTiUFjQNYZEaKrEPki/GQev3ZQM70fNX/kEUDZ+3V8e8btckVK1soJ1jPQkj2DiVfbZMfiUm/gwd17FfBzyR7q9eWVB9oyZiOiE0sUHzJhnEIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=UxyUnFl8; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="UxyUnFl8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1784679496; x=1784938696;
	bh=ESCbHAC87pVZ9GxAP9Y0O7y7wFinp8StEXwhRPVGMlg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UxyUnFl8Ebd7eaMdJHc9AvEBjGm394/UNs1GGNt74CQVW/thqn6bK7wyqpOJe1KZx
	 KPrD7K9DavB9bgjF/RSSxfRE+36kp9YYx/bKZqYABYP864Nd28C+rDs2KDdnVQyUqc
	 1wnt1mt34DXi/xwrig9kuYOWkk7HtlvvWUrncX8veWa82Xp/JjQndqbDFy1crwwWvF
	 xr3wPnAjrFr3zENEf6IrRp78uFyIhnfAYJ2r/f/mh2Ll3YV09B7uW4J1LbMeu0tqbw
	 8I6Jkpdzsx2ToL3aSBGXN3yyArY8rLwHJsTa/EjeWm68JxrlvphigUAWqPMKAsf6KR
	 ELS5+/AahT7Lg==
Date: Wed, 22 Jul 2026 00:18:10 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-combo: Specify PLL version in qmp_v6_dp_serdes_tbl structs
Message-ID: <b77dc15d-f9ad-4c06-9e24-8f73421e2130@proton.me>
In-Reply-To: <wg6lgpaexz4ktjlfzqpsidj56wr3hjax2ktn75kqsoaubtdxre@xh3yn3xpr4af>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me> <20260715-sm8475-bup-usbss-v2-2-2d8def39b190@proton.me> <wg6lgpaexz4ktjlfzqpsidj56wr3hjax2ktn75kqsoaubtdxre@xh3yn3xpr4af>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: a2ccf6bbe5a8d06a77e22459d477556da87e94b0
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/21/26 6:46 PM, Dmitry Baryshkov wrote:
> Checking the hardware docs I see no mention of v1 or v1.1 for these
> PHYs.

I got this information from [1] (SM8475) and [2] (SM8550).
As can be seen downstream, SM8475 specifies a v1 PLL while SM8550
specifies a v1.1 PLL.
v1 tables are used for SM8475 as can be seen in [3].
In downstream, the SM8550 driver [4] defines both versions.
The declaration for the structs found in the SM8550 driver can be found
in [5].

Please check my findings.

Regards,
Esteban

[1] https://github.com/LineageOS/android_kernel_qcom_sm8450-devicetrees/blo=
b/lineage-20/qcom/display/display/cape-sde.dtsi#L70
[2] https://github.com/LineageOS/android_kernel_motorola_sm8550-devicetrees=
/blob/lineage-23.2/qcom/display/display/kalama-sde.dtsi#L71
[3] https://github.com/LineageOS/android_kernel_qcom_sm8450-modules/blob/li=
neage-20/qcom/opensource/display-drivers/msm/dp/dp_pll_4nm.c#L195-L282
[4] https://github.com/LineageOS/android_kernel_qcom_sm8550-modules/blob/li=
neage-21/qcom/opensource/display-drivers/msm/dp/dp_pll_4nm.c#L131-L152
[5] https://github.com/LineageOS/android_kernel_qcom_sm8550-modules/blob/li=
neage-21/qcom/opensource/display-drivers/msm/dp/dp_pll.h#L104-L129

