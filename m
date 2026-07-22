Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65E83ACF05;
	Wed, 22 Jul 2026 06:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702224; cv=none; b=L+4WJ2PvysII9B5lVp6BM1Fh8TPui5ATMJLfZq3P7WhqHLcN/cu05oaiHfhP6R+z/tMs77otKQB/TknxqWLybfewkCIkekVJMLhBnaMc8yvvb2xPElFhbERBqWJYVkhXkUH0spL2ei0L9Wcbot+mqukicIObIdT9DC3uhrH801Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702224; c=relaxed/simple;
	bh=sKsWX3Dd0mR0iH+Td4hJE5oM4Op+hYrWFrWXexs4sec=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q9hvc8DbsquHr39EWmw7u1a9EsAcxNcpVIOsV10t4d6BFNEf9b6/iYBGhoqBRjVH4QMZ71BkJQJCEv1MNQA43asqbC4rgl86duP4WkkZakAFjws6vnDK5/vJ+kYnYW2wnUMrVIN3mSRhEsH+4HohhLumpm+fEqGWFPFpW2+je70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=OIFWY0rp; arc=none smtp.client-ip=79.135.106.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="OIFWY0rp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1784702211; x=1784961411;
	bh=sKsWX3Dd0mR0iH+Td4hJE5oM4Op+hYrWFrWXexs4sec=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OIFWY0rpzGQp7kpWmQwPObm1w9/8+SX8R3LP+F0u4VJAauX9BgFKtNBDbNSQrFl9t
	 AlcLYhpuQd23HQw3V2zNv+6oTghu+eEbr+Q8X8hn+wfiZiJxposcM0cwbAx19jrCaD
	 OwNag9YskARgY5n+BQjqNG53QvQwoqYfLBpXoqzcoOh115tLiXUMQSPrRW1kQf3UC0
	 Cuzw2fzqD35UxD6BZxRgiTW7DzsbRbRQ/W3xFjWOHuaXcQoiL5zBIdR8S16+WRDGgP
	 b/H4UmaMFWLs4jwppS/eQ0W9YedBoju8NlcaK5H3QFz0aCkLteZ5fCbwq2QyqFSzM5
	 eJwHN+JwKU97Q==
Date: Wed, 22 Jul 2026 06:36:44 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-combo: Specify PLL version in qmp_v6_dp_serdes_tbl structs
Message-ID: <34a75314-9cd0-46e2-ac89-2c070582e4fa@proton.me>
In-Reply-To: <sjvy2u27dxljx46iu5pqvtze6snrqnljmcs3c45gt4ckeuhwub@34mbkowlmapv>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me> <20260715-sm8475-bup-usbss-v2-2-2d8def39b190@proton.me> <wg6lgpaexz4ktjlfzqpsidj56wr3hjax2ktn75kqsoaubtdxre@xh3yn3xpr4af> <b77dc15d-f9ad-4c06-9e24-8f73421e2130@proton.me> <dph6cacosw3jzksqxp7fgofdueukrq6a3c5xys4jfrkqjuigvx@sroivvrxiwxk> <47b1db2c-6314-49ce-a7b9-f68eeb022295@proton.me> <zd5wulhfcw7vzbwaz4akhetbqqub7ygsmexuswkdvzxcfmqvqa@hom4ax54efft> <8066103b-e1de-4b20-b21e-533a6cbc2bba@proton.me> <sjvy2u27dxljx46iu5pqvtze6snrqnljmcs3c45gt4ckeuhwub@34mbkowlmapv>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 1f496ad5c17dbf3e2415112cdb6542e16052775a
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/22/26 2:21 AM, Dmitry Baryshkov wrote:
> On Wed, Jul 22, 2026 at 05:51:39AM +0000, Esteban Urrutia wrote:
>> - For this commit, v1.1 tables should be left as is without renaming
>> them.
>=20
> Yes, you can add a comment that downstream uses "4nm-v1.1" PLL type at
> the table or at the PHY definition, if you that it helps in future.
>=20
>> - For the third commit, v1 tables (DP serdes, RBR, HBR, HBR2 and HBR3)
>> should be added along with a comment in the driver explaining the
>> reason.
>=20
> A reason should be explained in the commit message. If you think that it
> helps, add a comment about 4nm-v1.

Thanks for the feedback, Dmitry. I will address this in v3.

Regards,
Esteban

