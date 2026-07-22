Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF122F4A05;
	Wed, 22 Jul 2026 05:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784699517; cv=none; b=IMl5RglppR8KvThXGv98MzLRhpH4pX0c+B5tHv8a8Z5Q1UAV8q0lIH6cXaIT9mbzXEiTJZdtRASBD6w6/m/Ii618mNUDNwQBwEni5ds/boQu3RoyqPNZxpV4eaK3qj6dkYDJtTQ3vxl7Tak4XuEi1IBgjjIU3Ja0LLM+mRpmNoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784699517; c=relaxed/simple;
	bh=7EWW65TWhQFgLQPj2Wkv861bBhqVtYITBfDqiAmRxN8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CzHKdnZSMDjuSCbTcH4FF87/naYP1I3ZqBBJtg3grqvb+gyqf+uWdKie4NsAHuGSCwfC0oX+uqS2+uZhrNGcKjgo2nRp+w1DCfdzDtbxDv52JYnCm5HGyXmMFrv6+lc7xqxz4GD6Fx0oLuuIpR1ZqZU6Na13e6weR0cnuwlp5zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=eLr5Ckm8; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="eLr5Ckm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1784699505; x=1784958705;
	bh=7EWW65TWhQFgLQPj2Wkv861bBhqVtYITBfDqiAmRxN8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eLr5Ckm8EKvVt+9shvYM9yYTSn7Jc9du0uSBhGBLgcT66RvEVoe38TFFMjOBW2QRE
	 vvLf3ixJTAe0uef2uutvVe5et6L7nqaKpEPiT/NUE6A+suqBQlygrwLg38Tbr6QTW+
	 5Xw1kJiBMN/ppBwP77dS4mH0cthIj9oM92bfmGeWueIkq3VlC4qDScWSGzE0y1qY8p
	 42tR75tOe91eBddJosYS54YEQnli7/lbf3rRByilB8JSSsKat36G726X9WFPvFiEFz
	 e+/XemSZvM1kOdWieytECYhhoim8lCOZZLZfeJ46rVd7gZN/gO8B5t6xxDtQs404rt
	 xkaqcdJYPwXvw==
Date: Wed, 22 Jul 2026 05:51:39 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-combo: Specify PLL version in qmp_v6_dp_serdes_tbl structs
Message-ID: <8066103b-e1de-4b20-b21e-533a6cbc2bba@proton.me>
In-Reply-To: <zd5wulhfcw7vzbwaz4akhetbqqub7ygsmexuswkdvzxcfmqvqa@hom4ax54efft>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me> <20260715-sm8475-bup-usbss-v2-2-2d8def39b190@proton.me> <wg6lgpaexz4ktjlfzqpsidj56wr3hjax2ktn75kqsoaubtdxre@xh3yn3xpr4af> <b77dc15d-f9ad-4c06-9e24-8f73421e2130@proton.me> <dph6cacosw3jzksqxp7fgofdueukrq6a3c5xys4jfrkqjuigvx@sroivvrxiwxk> <47b1db2c-6314-49ce-a7b9-f68eeb022295@proton.me> <zd5wulhfcw7vzbwaz4akhetbqqub7ygsmexuswkdvzxcfmqvqa@hom4ax54efft>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 67d6104ff7e818c69f7a2fef9f4052ef51b91cb8
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/22/26 1:34 AM, Dmitry Baryshkov wrote:
> Yes, because the platform has different refclock.=20
Sorry. I think I've lost the thread on this one. From what I've
understood:
- For this commit, v1.1 tables should be left as is without renaming
them.
- For the third commit, v1 tables (DP serdes, RBR, HBR, HBR2 and HBR3)
should be added along with a comment in the driver explaining the
reason.
=20
Please confirm if my conclusions are correct or if additional changes
will have to be made.
=20
Regards,
Esteban

