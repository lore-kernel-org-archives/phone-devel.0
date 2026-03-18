Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03693363C7A;
	Wed, 18 Mar 2026 07:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773817737; cv=none; b=Wwd0DYX6F0lHzMq67YMf+MhhANKlHQsXUtpHUcfxOE+8JzaOR8DQQ/uILVhaOfhuDyCIR6h13NpeNyJPU9ZGiQRX4/kDAziY1SbHJF5+jRHFI0BW0HQNE7f2afmnRrQUwnrtmKM45GUvZCcDS0+XnPgm3vWkehGEsb6z+dA9NVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773817737; c=relaxed/simple;
	bh=GRW9JHLTAa2b0AKI+R0G8NVxVhAnwl0rvo+lqgcmuxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9L64qfKCTZX4ptb/TjsVrmyNUOJSK6qt2eoV6kVj00QrUFp8/f5MyPtG2WvXCA4/hBIiWdkRsLHAoIo0/MzK4bteIh5WRL1ZGe7T1Y1yZG1aTk1YEW3wXmjLpLWmpewfbSwsegRvRR2FMONYqusHojYKrKgz+sozVx6x0h/Vf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TcaGRxTP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TcaGRxTP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC58C19421;
	Wed, 18 Mar 2026 07:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773817736;
	bh=GRW9JHLTAa2b0AKI+R0G8NVxVhAnwl0rvo+lqgcmuxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TcaGRxTPJWODKPaqHMRpCW7G9G82mIVGX0jBFULb7NqGtb734uxPj3pf3T+KR9JlL
	 9Bm17QFIZoA42pBnbHT1s+PWgLsTSiroKJhBjFfzKdsmI6wT+PtE2n3bMnbqgCR7eb
	 xRuU5oO+5Mn7kNCB70IErj6du8DYO/J+/ya2BbFPlIGGniP8bTq0l6PWmH8qKyxfMw
	 00GXwPTPe6fit9dyajGrf3AoWJOlv/HRiB4yC41RpzvrrhhkSGHS6ERypnuZY4iyxd
	 cppL1tnF6jUThdZt9mFSUJBvJ1/PKFp8AHAMjS8KlYfbtszHxykXv99n/dDbDEelt2
	 tHZ9eFQPCN7Dw==
Date: Wed, 18 Mar 2026 08:08:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Kaustabh Chakraborty <kauschluss@disroot.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: display: panel: Add Samsung
 S6E8FC0-M1906F9
Message-ID: <20260318-astonishing-spirited-perch-bbfd14@quoll>
References: <20260317-panel-patches-v5-0-ef99f7b280da@gmail.com>
 <20260317-panel-patches-v5-1-ef99f7b280da@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260317-panel-patches-v5-1-ef99f7b280da@gmail.com>

On Tue, Mar 17, 2026 at 08:50:29PM +0200, Yedaya Katsman wrote:
> Add Samsung S6E8FC0 DTS binding used with the M1906F9 6.09" 720x1560
> panel found in the Xiaomi Mi A3 smartphone.
>=20
> Co-developed-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
>  .../bindings/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml        | 5=
 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

