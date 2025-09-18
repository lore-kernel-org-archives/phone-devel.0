Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0293613AC1
	for <phone-devel@vger.kernel.org>; Thu, 18 Sep 2025 02:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758161877; cv=none; b=iXoRYR6p9jJcrvXEXZnap4L32Q6q9C2idxYRVgFVg+chpjzaF48csz6yDBo3uHXtI0iB2iRkBeJvXIJU9BwWRKBZk7QkaWynLSxXqboInP/6G+12YA5tzuz2bFvbJPzTLZz74TL4hkyusxvNx47XcM4LUly8ImKSA+uA8yQEqC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758161877; c=relaxed/simple;
	bh=LnYy1nU48TO7oACmH0QX1ABJCLk3jW4Q3+pBH+f/Otc=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=IgLu63AkFnXV3YJde718/1W3433jUcmLKOOoJC9mc6V2JS7BlBAuBzn3zeE3nXtYD7+KEY63ri26MZDdT4V5CdyliN3zuwkSZeCtGxleLyM5stpvtPWXr7g1rXgooI9M9NEJ+ZOkv4sClSzoajcEas0d+lx96EhcknjlKes1LjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=dOfGgFdn; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="dOfGgFdn"
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1758161873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HTEx0d7bDT19x4SiTkyXjcvht35rtgGdpb0/8C+uB0c=;
	b=dOfGgFdnaUR4mDc+8s5KZA4NKP6oa95iHoPF/C8KJ4K1I5S/LbnbMXzVMqyro1O/SsX71V
	sTlwbA8YczIn3zjt+uxx1ilo1xyNZAQ8U38EXV7O+EUQJ+W7oqe3Jyv/JhIKa+Px5nVUyi
	A776Nm8ZyXuGXp7QRrba/3rVP8CDMGQsjxXMrpYTS4kae8puL76OW5H62XAnRDSpDkP/EH
	/+ozvBTQYIXwIVWWiMlcVpTwECiI/ymY+reXCXFu/vwdtSp00LwM543CTWQZKz+ZO4LY8b
	4i6qM7N7WwHWWL3pshEVm5zWk2nmsFarx9YMcGxUfgD5cQvHkkU5JBscTLWxPg==
Date: Thu, 18 Sep 2025 02:17:50 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <9be1f0af90f337bc36e9e6a091ab5cb14ddc4c65@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v2 02/13] arm64: dts: qcom: sdm845-lg-common: Add uarts
 and Bluetooth
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "David Heidelberg" <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, "Amir Dahan"
 <system64fumo@protonmail.com>, "Christopher Brown"
 <crispybrown@gmail.com>
In-Reply-To: <4428ea30-7324-4faf-98a6-b18eb16f9fc8@oss.qualcomm.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-2-5e16e60263af@postmarketos.org>
 <4428ea30-7324-4faf-98a6-b18eb16f9fc8@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

September 17, 2025 at 1:40 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcom=
m.com mailto:konrad.dybcio@oss.qualcomm.com?to=3D%22Konrad%20Dybcio%22%20=
%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:


> > + /*
> >  + * This path is relative to the qca/
> >  + * subdir under lib/firmware.
> >  + */
> >=20
>=20This comment is a little redundant

Is it? Most of the other firmware paths are relative to /lib/firmware/qco=
m/sdm845/LG/judyln, while this one is /lib/firmware/qca/judyln
