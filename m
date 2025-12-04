Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430E13254A8;
	Thu,  4 Dec 2025 18:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764874075; cv=none; b=u2Twpy+85NLEvkx4se/doncLEl5m1sQ1m6N5wjIFInvTJUhxLsfm4+O4iAP6d4ac9K7bflpSjAU23OqniAM1pBC8aZdUvGHtb2wb06zCiUEKGJLupKmTa0XGMoVcrgSQRKdfsAtWOqjouvHOE70VpewjfxfgyuP+fFb8LSVVKus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764874075; c=relaxed/simple;
	bh=noPUV3bu79z3qlWu5jYSIMg//1Eh+wIJG9XWK6Aw/tc=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=ssys1mp04LFzGz67dGbVeI+RcJshP6+FRew6AQGwK+3+2Yu6Ft/qWkZmompOKAwOWEKVT9E1S8TvQWi9Kk4LpUYvL1FkW+Fq5WNb9LOZP0iYolQByzH1XCyKKVLzzFY2brg6apRAd49RStxUWSRhdmEKh/VsCgYmXsz+ljdLXqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=SeeJ3ZNp; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="SeeJ3ZNp"
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764874055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFIyOFl4s3TiXZ1x3OnNe6v2Uon+vzAZW3MjiFsYDiE=;
	b=SeeJ3ZNp2b8pbXmzpfThcPq5PTYnsTv8k9S8yTUQOt4q8rHTliKWqREOM56S7QxuGcjiAo
	F1gEnszIWzKS6UDNlouJxoGpDWEwRGmtZBq2jVUtZ8dDRVf4+/D0XczFDr7KWmSGRbyEOH
	aaUtPKuwBXv9vOHfq/hgSQN+jDKzPbZs5648IoWimVLxgBCM7Gl/F2WnhsAr+Jy+B79j7l
	KrWAjWAqo27Gjlk5KpMISQQm0UtOYeCepD6tFEWhxVtO3lrBIhYev3RSlJt4ESfEBtY1DB
	mLm28zBLE52yOOnH/vLO04l3jU7lLv+35RCupGVc7mZQHatjp/qM0iABgX8FnA==
Date: Thu, 04 Dec 2025 18:47:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <7909626f3116fcb9feb25b77820a98da56e1283a@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, "Amir Dahan"
 <system64fumo@tuta.io>, "Christopher Brown" <crispybrown@gmail.com>
In-Reply-To: <84a17875-0542-47cf-ac4b-5af7bbdc5edf@oss.qualcomm.com>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
 <20251203-judyln-dts-v5-10-80c1ffca8487@postmarketos.org>
 <84a17875-0542-47cf-ac4b-5af7bbdc5edf@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

December 4, 2025 at 12:50 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm=
.com mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22%20%=
3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:


>=20
>=20On 12/3/25 10:40 AM, Paul Sajna wrote:
>=20
>=20>=20
>=20> These regulators are required for the LCD
> >=20=20
>=20>  Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> >  ---
> >  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >=20=20
>=20>  diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/=
arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> >  index 8b88f75b36af..cdaf84de5e6c 100644
> >  --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> >  +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> >  @@ -56,10 +56,27 @@ zap-shader {
> >  };
> >  };
> >=20=20
>=20>  +&ibb {
> >  + regulator-min-microvolt =3D <5500000>;
> >  + regulator-max-microvolt =3D <5700000>;
> >=20
>=20These ranges seem much more reasonable, although I would still
> expect there's a single operational voltage - unless the panel driver
> is supposed to call regulator_set_voltage() in some different power
> modes?
>=20
>=20Konrad
>

So min/max both 55? Or is there another property I should use?
I wasn't sure if that would be physically hard for the regulator to maint=
ain such precision, so I cross-referenced some other DTs in the qcom fold=
er and found this 200mv allowance in one of the sony devices.
