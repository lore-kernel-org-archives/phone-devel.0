Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C98919C546
	for <phone-devel@vger.kernel.org>; Tue,  2 Dec 2025 04:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764650515; cv=none; b=c+8ZDK+o/7FyncP+OwXDE9gI4U/Jlo79TKRw3upm0dK46aig7eN70/1AktpNmvzHACCO4VabSQHgUpyruQmYfXQTrUJFOY0VEqLP80G2r1PCXeEUkskf95E9X13hcnAFcBOJjGHFi9bUuaVZObJ3y44BDZlTpVPjtKPqnVQyi6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764650515; c=relaxed/simple;
	bh=xZv+kdthMHC35YBNM5GYL4gmGfKPEygC5TP1M1hv35c=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=N4ryIUq8GJVaUHFC4QuUQT8ZaCwnX2Mgm4wvpdx9cYyKhtn92P1fIE6sYsd1x/KuvVqU+x1rKWvxn5AzFhU5vBITkUCifPrjV5tpC0nKzzhh+1Utnj55ptJC1LWOgQ20d3xh6pePk6wVWbzOBBsWsywG6chLFIYKqP7ncDtUrPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=mqrt0InK; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="mqrt0InK"
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764650500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T1mFU9OCRrIY5hDgOI6aUY6esQiEhROY1AIYyG7Ggbc=;
	b=mqrt0InKHjr1Hnux7w8yWmk2jA62/VKjWxzGQo2x1oHQTULzs/joG0r9L9jJlK2FcLqg2h
	tgzoN9AS6XMwqtw6HX8coWtopVO/W+FSbRZYZj6rPTDpuwkFuhQrI8JaSN3oodBLXRdzPv
	ZGMTxMU7I+3MupBHejUhA48eBecWIc91hJwHGSmjDIymClwENGaMj9ksOuFc03iQhhjIi3
	0ordnSQo1mnFoz2lmPIK4aXAX6CVOaC6L0mzNJdTuBHNju63FKGOsPs58w9kJJkrWLfagr
	KUs3fuD0rsMGzX9rT80FFsllnpIy27dPTDngVy8ogBRK2MIwX1yKA0Qy0b+aHQ==
Date: Tue, 02 Dec 2025 04:41:38 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <803c48742755394d6eabc34ac73a42b36615cc01@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: sdm845-lg-common: remove
 framebuffer reserved-mem
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, "Amir Dahan"
 <system64fumo@protonmail.com>, "Christopher Brown"
 <crispybrown@gmail.com>
In-Reply-To: <adcac270-3668-4b17-b430-d67ef311dd7c@oss.qualcomm.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-12-a5a60500b267@postmarketos.org>
 <adcac270-3668-4b17-b430-d67ef311dd7c@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

December 1, 2025 at 12:41 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm=
.com mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22%20%=
3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:


>=20
>=20On 11/25/25 9:12 AM, Paul Sajna wrote:
>=20
>=20>=20
>=20> It causes this warning
> >=20=20
>=20>  [ 0.000000] OF: reserved mem: OVERLAP DETECTED!
> >  framebuffer@9d400000 mailto:framebuffer@9d400000=20
>=20>  (0x000000009d400000--0x000000009f800000) overlaps with
> >  memory@9d400000 mailto:memory@9d400000  (0x000000009d400000--0x00000=
0009f800000)
> >=20=20
>=20>  Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> >  ---
> >=20
>=20It's defined for both devices that include this dtsi.. perhaps you
> could remove it from there
>=20
>=20Konrad
>

I don't have a judyp to test with and prefer to limit scope.
