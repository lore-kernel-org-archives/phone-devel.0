Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255EF2DD5F6;
	Wed,  3 Dec 2025 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754077; cv=none; b=to62yJTgkkeQqSG1MUIriy+OOIPSyoR1QIv1HlH4byJe3oXdsu6aJhwjLND2bEU/nH52YkR/Ys+Rhz/DHUKSkdLUFD4ek3G3BDWxMEjJqD8nSNHP+j+iuTsM9T3hzrB82xaJIdrp9hzskWwC2RvLAFfZJMqLdYZa8xWYOkuL4Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754077; c=relaxed/simple;
	bh=lN4pUidHEfSwBA4u7DE6rOq94JjHsmvAT+sc92T9dZI=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=M/4jORGtmudmFCv11dLimdmdTuE2ftBXnpnhZy/qIKpu3gLN35A1w6wsk8pAw99rmSn2JESee/SL/4lToIkmBMTG1Zoed9lwZKUGZxSWS9rF4YW0LySay5XLvuWG4bfZ+joI+ocT1To16KpVWgSQBlHOQRmqw5e65uuzC3CdUkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=loiQjTLt; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="loiQjTLt"
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764754063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lN4pUidHEfSwBA4u7DE6rOq94JjHsmvAT+sc92T9dZI=;
	b=loiQjTLt/dTCAn4zUxiLekEhMaxsCvpFn6g88/+jzS/UKDV8Xa4Yf3mq9s+yg9Y1rCbSHW
	3ZhveVAc5m7Cyjcs8/t/q0n+bELOSdWQwtOazQeI86z3ET7I0jOJCbwFqNdXNjv9j2dLk3
	lPqFu3UkRpd3nvVolnr5KPpbzlfThRqY+77X2S0xzVWBnKYUDSbFoJtDk5dRyGPirTU5+r
	yUQTzLE62mo/3Bbrl+NHPWYrcQlyt9YDR0OZvDTCaSsNgqFFot67x/M/JE5qMwp1Pa7TRX
	XaBlc+1K1xQvtQt5tFzuJWOYammHpuoTx8kBzGf0leUFPPDPNUb2BvBYaExDpA==
Date: Wed, 03 Dec 2025 09:27:40 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <9cdccbb5a3fb10a2d7de1e1d17d36018f40b18a1@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, "Amir Dahan"
 <system64fumo@protonmail.com>, "Christopher Brown"
 <crispybrown@gmail.com>
In-Reply-To: <863db415-51e0-4c54-85bf-ac6a168758e0@oss.qualcomm.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-9-a5a60500b267@postmarketos.org>
 <62ce91326c0e1d5aef1ad5ecad9b99695f983347@postmarketos.org>
 <863db415-51e0-4c54-85bf-ac6a168758e0@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

linux-postmarketos-qcom-sdm845-6.16.7_p20251203010632-r0.apk


December 1, 2025 at 11:42 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm=
.com mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22%20%=
3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:


>=20
>=20On 11/28/25 9:20 PM, Paul Sajna wrote:
>=20
>=20>=20
>=20> I did more testing on this, and the led only comes on if it's brigh=
tness is set to approx 150/255 or lower. In that case, should I set led-m=
ax-microamp to 60mA?
> >=20
>=20FWIW your downstream kernel sets up channels 0 and 1, here you only
> enabled 1. Taking a look at a picture of the phone, I only see a single
> LED on the back, so perhaps you're (over)driving a single power line?
>=20
>=20I'm not a milion percent sure, but I would assume the current draw
> *limiting* register applies to the sum of the current going through
> the three channels because there's only a single instance of it.
>=20
>=20Konrad
>

I tried setting up both, but only the one that was mapped as `led-sources=
 =3D <2>` seemed to have any effect. Also it would confuse userspace flas=
hlight apps if there were two I think. So I'll push v5 with just the one =
that does anything.
