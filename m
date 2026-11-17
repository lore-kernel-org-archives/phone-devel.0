Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939415;
	b=ApZqgnWysJj/RxEQU+wTEjqtGlx3JnsqwNmGPnj5nVJ3Qbr9PVatm7o1hezBdM/cJrGv
	 azKRGaBFPEkW8yFejqZETLn75aaaTjtcurFBFSulS29T2571y/Zsw4DVIZlfoYt3T+75b
	 XEUQ9kr7B9sLYvS5ZUjfevD4Np1YdKl3hJ1GpWDoVZb1GIgyxWEbXbhyp/unsapWPXHYY
	 kK5q79z8bQliOUQeDiJqLW/tn5j9jR3I8lFHimVFHla2OBGRKjl1WLAAo8ib7w/mrL/Sp
	 XiPQsE+BGnywGoFzRDJrzgj/4WS6KwIC0AYyvcOeKIz99HT0Nk+18v1mPkMeRciS8/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939415;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:Autocrypt:In-Reply-To:Content-Type;
	bh=tAFphuNZhSMbXbrfeyiF5cRg1vQ1G5E1UchQJDp49uM=;
	b=KHDB5vMHUrpcNC9wdV5FZDDUoObAu/N8gvoJ04WrrlLTSyfd5gh0yUtE0T7gBp5yO9lm
	 FI25Qiecw6po61473EUu0C3MIte1d5h4u+/WeLX0TNDbgZOevNspvYACmA4egB6zOWKFB
	 Z8W4YfqfjARSuYOgDn72c/1Qna6WQqi9y5emgXEOAGPfHlHMaOB0EXGAtQl1xqjVhbwvF
	 VQiGWWJF9XZy7ZIFdZNuzuK3+VKIV0SDNYkBZ9kXzpcrzalvtS2hssyEOXeE8Uj6QGr1G
	 scItqwZvpYxVT5EKtsT55ZQJ2lgDEtPibVhQRpM55DZ1ZqXFoLRCLZsPsVGryk2UWTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=sz3wKmQ+;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=GgEId5a1;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A961606A32C;
	Tue, 17 Nov 2026 18:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A961606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=sz3wKmQ+;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=GgEId5a1
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794939390; bh=tAFphuNZhSMbXbrfeyiF5cR
	g1vQ1G5E1UchQJDp49uM=; b=sz3wKmQ+4jyhpUeg8eBoRjZrUVtKSlSbP4ku5TcA8jfrDe7AXn
	IAd8CTJ0Y1DixtC0fQp3rhKkAi8iUzjfU3DQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=From:To:Subject:Date:Message-ID; t=1794939390; bh=tAFphuNZhSMbXbrfeyiF5cR
	g1vQ1G5E1UchQJDp49uM=; b=GgEId5a1Mn8eD2a2afWfliHlYTqly+FWA4sHjHZj8Z7xNlyw3z
	UsaGDphUM1pVQUZ830/KWZdO8FHJRqWAU66/v1tCrSeQv+t4Spezrx81vc7M1T2mWx2OFXAr5jI
	PX+qX0jElWKpRXaK4T7j42yTGJpCYlKjPw+hjm7MuW2F+ZIRrbE1DWjT1AjmB5BzSsbbyX6jgrx
	TpaFMo7dbKUHIhyWTkEgO4n4e0FrzGppISM8cUhH6w6YvsFwXGhvgti4Xypbo9MZq+MAuNS+AB3
	3yGJO8Tx4zUfg7DAxebZgV1PNGo48ErkHzKfczGxd2dtZt5J+NE2ondo7wUufDpXWMg==;
Message-ID: <4f63673e-67c8-4f68-b3f5-82a0579e2b49@erebion.eu>
Date: Tue, 17 Nov 2026 19:16:29 +0100
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/12] arm64: dts: qcom: sm6350-lena: enable remaining
 i2c busses
Content-Language: en-GB
To: Luca Weiss <luca.weiss@fairphone.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-12-7318a19806eb@erebion.eu>
 <DMXH52GLPXUT.236KX5W7LSRY7@fairphone.com>
From: erebion <erebion@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <DMXH52GLPXUT.236KX5W7LSRY7@fairphone.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IZh0FgOC0Mzl8kpWZefDdfl9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IZh0FgOC0Mzl8kpWZefDdfl9
Content-Type: multipart/mixed; boundary="------------sDXDqMcp6Uq300MvD41ZVktY";
 protected-headers="v1"; hp="clear"
Message-ID: <4f63673e-67c8-4f68-b3f5-82a0579e2b49@erebion.eu>
Date: Tue, 17 Nov 2026 19:16:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/12] arm64: dts: qcom: sm6350-lena: enable remaining
 i2c busses
Content-Language: en-GB
To: Luca Weiss <luca.weiss@fairphone.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-12-7318a19806eb@erebion.eu>
 <DMXH52GLPXUT.236KX5W7LSRY7@fairphone.com>
From: erebion <erebion@erebion.eu>
Autocrypt: addr=erebion@erebion.eu; keydata=
 xjMEY7S2FRYJKwYBBAHaRw8BAQdAUf0YlT6sBQSunZeO44bgAPe+ndqTifGaNjw7vzJ2KPHN
 HGVyZWJpb24gPGVyZWJpb25AZXJlYmlvbi5ldT7CjwQTFggANxYhBJyMprURw7/YpjH7646v
 QDJuAq59BQJpWnovBQkHhhzbAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQjq9AMm4Crn057AEA
 j3didUIhbtAoppk2eNu6CbtMvkDisHWHVLaWF8YC1VsA/1P0ngBoVghELMachirfTinwBplJ
 qP7GGlSGRqSfnlAKzjgEY7S2FRIKKwYBBAGXVQEFAQEHQN6NPWcyqKdecGU1vN8FVXBwYEUd
 OAhF5jpmd7M0Ybx8AwEIB8J+BBgWCAAmFiEEnIymtRHDv9imMfvrjq9AMm4Crn0FAmlaei8F
 CQeGHNsCGwwACgkQjq9AMm4Crn075QEAoDqfm4OeAEQWMgfQ496u2S3rWJw1EMgTOP51FQbX
 rY4BAKn6AhEBh605uas3OTVtcwNIAJn1sHTA7HqqWniUe9sP
In-Reply-To: <DMXH52GLPXUT.236KX5W7LSRY7@fairphone.com>

--------------sDXDqMcp6Uq300MvD41ZVktY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTcvMjYgMTM6MTEsIEx1Y2EgV2Vpc3Mgd3JvdGU6DQo+IElmIHlvdSByZXNlbmQs
IGFkZCBhIG5ld2xpbmUgYmVmb3JlICdzdGF0dXMnLCBhbHNvIHdpdGggaTJjMTANCj4gDQo+
IFJldmlld2VkLWJ5OiBMdWNhIFdlaXNzIDxsdWNhLndlaXNzQGZhaXJwaG9uZS5jb20+DQpU
aGFua3MsIHdpbGwgYWxzbyBkbyB0aGF0IHdpdGggaTJjOC4NCg0KLS0gDQplcmViaW9uDQoN
ClhNUFA6IGVyZWJpb25AZXJlYmlvbi5ldQ0KDQpBY2NlcHRlZCBsYW5ndWFnZXM6IEdlcm1h
biwgRW5nbGlzaCwgU3dlZGlzaCwgTm9yd2VnaWFuLCBEYW5pc2gNCg0K

--------------sDXDqMcp6Uq300MvD41ZVktY--

--------------IZh0FgOC0Mzl8kpWZefDdfl9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQScjKa1EcO/2KYx++uOr0AybgKufQUCavyZ/QUDAAAAAAAKCRCOr0AybgKufZVv
AP44LNpwUJ4lzteMf21W5HgTm9u1oF/uAYdWgeHUv075HAD/WfEs1NmlCuXud45L6MnvzXwZ8RdY
ASC3DDAvI4RpzQU=
=hO4x
-----END PGP SIGNATURE-----

--------------IZh0FgOC0Mzl8kpWZefDdfl9--
