Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22173890FC
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369047; cv=none; b=b7HhMwME7Spabce+kRpOAEwsdg+B9+WTi/HUvyRCvky8gH+kRteVqwQvYMUrCeCnvKNRWs1iwhgBUYzlU4COGLzzx63VgoqJXiG7vDw9rEjuBMQq1JAZLaGy0R0RX3+KRlYuFqwU1jz+mfoSoj6YC6L4aubqyw8pJGcdl2Saajw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369047; c=relaxed/simple;
	bh=Ph8L6+gJe19poDr+sVxhDt5mPh/0Ip+l1jVhOmzfP2c=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=Kjrjd1u6FVVPQ7ZZp27lYPRWW8yDIknL0iuUeo0ghBXjyh76zfBod63xcsU1Fu/J5h4grAos2bFZOg4LOHMHfD2lbJDrfNEsNeCe0R+yPJxolqSaVDBYtBBXbXgyiRIu7yroSEUB4nhl8zZn6VIukQGC3kSXva9RIIv5hUP0TfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=SBGv8+Bo; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="SBGv8+Bo"
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774369032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ph8L6+gJe19poDr+sVxhDt5mPh/0Ip+l1jVhOmzfP2c=;
	b=SBGv8+Bo2ZzZsy2wDVzsRPzQ/icH2qnrLi7yUqrdCnafoTDUs4mOLEsMTHHCe4nRE47HHv
	YR/KoFkm32uLo1ggRVYzyyR+73wSxDqNNb9WV5KhVqDPcA5ImnAnofcGWzODTcT/KpGS4j
	1EPhQWqIOMRKZLuruv2/CwLFhK3jaVxinN22MVyNYACcpxQ0giajLSnJdfYK3DAUsgTuZt
	C7iRJ6O+BaYHlj0fmpGOfN/mOYZldnGTkl6lDiqkMXhRw0DSjYUyoKedsI8N3N2tZv9Tji
	jKB9q/G7lkAF717vB8nrCB+NW+l110dJRFhZy95sa1pLZkwPankhoAx8yi7Mzw==
Date: Tue, 24 Mar 2026 16:17:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <e833f72236342a7efbce04c2109bf921f770673c@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, "Amir Dahan"
 <system64fumo@tuta.io>, "Christopher Brown" <crispybrown@gmail.com>
In-Reply-To: <e32a0a50-9c15-4f3e-8c83-1f96e5aae4b0@oss.qualcomm.com>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
 <e32a0a50-9c15-4f3e-8c83-1f96e5aae4b0@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

March 24, 2026 at 10:49 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.c=
om mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22%20%3C=
konrad.dybcio%40oss.qualcomm.com%3E > wrote:
> What about the other board (judyp)?
>=20
>=20Konrad
>

I don't have it.
