Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361D02E2DF2
	for <phone-devel@vger.kernel.org>; Mon, 27 Apr 2026 20:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777321363; cv=none; b=CTV3hFnJxwhDHZ5hpdTMVeHpJOKPhPfILYNF2HNy60fFT1mxnR2LXJ9P9DrmGBXTlD+qBqdVulUvn5aNHc4sC5hpJk3gQFad86dKHB2oHZzxjIZin7zpTpQeAPcc2EYtKNb8JwATJegupu8y7UXIgYPPZKco6lnsqpE7tkHMfME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777321363; c=relaxed/simple;
	bh=YTd/Z0HCcKLHukgv576kTNa9f4xPUI4kMQZ0Lh2Y+V0=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=j0gbZxNWVoVzroZ0hkBARvZEOrt2Du7Sy/wwO4v7Xr8QE5mMDjXsM4LRnx9xYHHLmW9FYEhhZnqQRT58ViRl7UveB9eOZ/uxtMMdVw7dh8QsVTP1n3E1sFIklZfJ1vuxQmB68ZqpaSECRKKhdCpISSlUWw229pAzBvuuYGZELuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=YMzhjdp5; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="YMzhjdp5"
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1777321358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WBUWoNvxUkGv0blpLp4hLR3tQUEDpc81rOZHnN/VVUo=;
	b=YMzhjdp5FNAhb4Z1tg0sSgl0PNTXf8kfwPTd2XHvmruWGEvC5xOYGB9qDihwT9c8ppRkdf
	auEJ/Jb62RLQJMjSVjfAqylbKIyunq9CRr97vOKUK4iCvMlhjGmfETa2lLCJXm5v76NXdH
	Qr7ltK+j2Fvzf9WvKqLWlf1QjdOiU+AgtoyWmwa/lerPKtMXvvIz/uPFCy5lbZDsWX+/0+
	LHU62gM+poogk3Bbx9CS5YHM2mLia9wFcr1D0bkTVmjCYmhku/alA5Ij8xVe8xV9K5FcVZ
	RQNGLfq2Q6tBzWF68Yzg8XCnHKOVzFMcT4VDvXLWkL/gg97+v0Vn2eW2k0FdCg==
Date: Mon, 27 Apr 2026 20:22:31 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <a0bbc97055846dae83db766e60a39899f09e1e91@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-lg: Enable
 qcom,snoc-host-cap-skip-quirk
To: david@ixit.cz, "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Amit Pundir" <amit.pundir@linaro.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Konrad Dybcio" <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "David Heidelberg" <david@ixit.cz>,
 stable@vger.kernel.org
In-Reply-To: <20260427-b4-skip-host-cam-qmi-req-fixup-v1-2-4398e94bde70@ixit.cz>
References: <20260427-b4-skip-host-cam-qmi-req-fixup-v1-0-4398e94bde70@ixit.cz>
 <20260427-b4-skip-host-cam-qmi-req-fixup-v1-2-4398e94bde70@ixit.cz>
X-Migadu-Flow: FLOW_OUT

April 26, 2026 at 11:44 PM, "David Heidelberg via B4 Relay" <devnull+davi=
d.ixit.cz@kernel.org mailto:devnull+david.ixit.cz@kernel.org?to=3D%22Davi=
d%20Heidelberg%20via%20B4%20Relay%22%20%3Cdevnull%2Bdavid.ixit.cz%40kerne=
l.org%3E > wrote:


>=20
>=20From: Paul Sajna <sajattack@postmarketos.org>
>=20
>=20The WCN3990 firmware for judyln does not respond to the request for
> host capabilities. Add the devicetree quirk to skip this request.
>=20
>=20Fixes: eb8fa3208526 ("arm64: dts: qcom: sdm845-lg: Add wifi nodes")
> Cc: <stable@vger.kernel.org> # 7.1.x
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
>=20diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/ar=
m64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 71d070619ad73..2d02d77d35ea7 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -675,10 +675,12 @@ &venus {
>=20=20
>=20 &wifi {
>  vdd-0.8-cx-mx-supply =3D <&vreg_l5a_0p8>;
>  vdd-1.8-xo-supply =3D <&vreg_l7a_1p8>;
>  vdd-1.3-rfa-supply =3D <&vreg_l17a_1p3>;
>  vdd-3.3-ch0-supply =3D <&vreg_l25a_3p3>;
>  vdd-3.3-ch1-supply =3D <&vreg_l23a_3p3>;
>=20=20
>=20+ qcom,snoc-host-cap-skip-quirk;
> +
>  status =3D "okay";
>  };
>=20
>=20--=20
> 2.53.0
>
Tested-By: Paul Sajna <sajattack@postmarketos.org>
